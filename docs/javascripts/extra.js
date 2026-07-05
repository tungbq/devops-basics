/* ═══════════════════════════════════════════════════════════════════
   DevOps Basics — Home Page JavaScript
   - Fetches live GitHub star count
   - Smooth counter animation
═══════════════════════════════════════════════════════════════════ */

(function () {
  "use strict";

  /* ── Animate a number counter ─────────────────────────────────── */
  function animateCounter(el, target, duration) {
    var start = 0;
    var startTime = null;
    var formatted = target >= 1000
      ? (target / 1000).toFixed(1).replace(/\.0$/, "") + "k"
      : String(target);

    function step(timestamp) {
      if (!startTime) startTime = timestamp;
      var progress = Math.min((timestamp - startTime) / duration, 1);
      var eased = 1 - Math.pow(1 - progress, 3); // ease-out cubic
      var current = Math.round(eased * target);
      if (target >= 1000) {
        el.textContent = (current / 1000).toFixed(1).replace(/\.0$/, "") + "k";
      } else {
        el.textContent = String(current);
      }
      if (progress < 1) {
        requestAnimationFrame(step);
      } else {
        el.textContent = formatted;
      }
    }
    requestAnimationFrame(step);
  }

  /* ── Fetch GitHub stars ───────────────────────────────────────── */
  function fetchStars() {
    fetch("https://api.github.com/repos/tungbq/devops-basics", {
      headers: { Accept: "application/vnd.github.v3+json" }
    })
      .then(function (r) { return r.json(); })
      .then(function (data) {
        var count = data.stargazers_count;
        if (!count) return;

        /* Pill inside the GitHub button */
        var pill = document.getElementById("gh-stars");
        if (pill) {
          var f = count >= 1000
            ? (count / 1000).toFixed(1).replace(/\.0$/, "") + "k"
            : String(count);
          pill.textContent = "⭐ " + f;
        }

        /* Stats bar counter — animate it */
        var heroStar = document.getElementById("hero-stars");
        if (heroStar) {
          animateCounter(heroStar, count, 1400);
        }
      })
      .catch(function () {
        /* Silently fail if API is rate-limited or offline */
      });
  }

  /* ── Intersection Observer — animate stats when visible ───────── */
  function observeStats() {
    var statsEl = document.querySelector(".home-hero__stats");
    if (!statsEl) return;

    if ("IntersectionObserver" in window) {
      var observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            fetchStars();
            observer.disconnect();
          }
        });
      }, { threshold: 0.3 });
      observer.observe(statsEl);
    } else {
      fetchStars();
    }
  }

  /* ── Boot ─────────────────────────────────────────────────────── */
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", observeStats);
  } else {
    observeStats();
  }
})();