#!/bin/bash
# Diffs topics/ on disk against README.md's topics table and appends a row
# for any topic missing one. Automates what's mechanically certain from the
# filesystem (name, folder link, whether basics/practice exist) and flags
# what genuinely needs a human (official docs link, icon) instead of
# guessing — a table row with a wrong doc link or a fabricated tag is worse
# than one with a visible TODO.
#
# Usage:
#   tools/generate-main-readme.sh          # append missing rows, print what still needs a human pass
#   tools/generate-main-readme.sh --check  # exit 1 if anything is missing (CI gate); never modifies README.md

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
README="$REPO_ROOT/README.md"
TOPICS_DIR="$REPO_ROOT/topics"
CHECK_ONLY=false
[ "${1:-}" = "--check" ] && CHECK_ONLY=true

# --- gather state ------------------------------------------------------------

mapfile -t topic_dirs < <(find "$TOPICS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)
mapfile -t table_slugs < <(grep -oP 'href="\./topics/\K[a-z0-9-]+(?=/")' "$README" | sort -u)

missing=()
for t in "${topic_dirs[@]}"; do
  found=false
  for s in "${table_slugs[@]}"; do [ "$t" = "$s" ] && found=true && break; done
  $found || missing+=("$t")
done

orphans=()
for s in "${table_slugs[@]}"; do
  [ -d "$TOPICS_DIR/$s" ] || orphans+=("$s")
done

if [ ${#orphans[@]} -gt 0 ]; then
  echo "⚠️  README.md links to topics with no matching folder on disk (left as-is, needs a human look):" >&2
  printf '   - %s\n' "${orphans[@]}" >&2
fi

if [ ${#missing[@]} -eq 0 ]; then
  echo "✅ Every topic under topics/ already has a README.md table row."
  exit 0
fi

if $CHECK_ONLY; then
  echo "❌ Missing from README.md's topics table:" >&2
  printf '   - %s\n' "${missing[@]}" >&2
  exit 1
fi

# --- prettify a slug into a display name --------------------------------------

declare -A ACRONYMS=([aws]=AWS [gcp]=GCP [ci]=CI [cd]=CD [sql]=SQL [iis]=IIS [elk]=ELK [k8s]=K8s [iac]=IaC [ssh]=SSH [api]=API)

prettify() {
  local slug="$1" out="" word
  IFS='-' read -ra words <<<"$slug"
  for word in "${words[@]}"; do
    if [ -n "${ACRONYMS[$word]:-}" ]; then
      out+="${ACRONYMS[$word]} "
    else
      out+="${word^} "
    fi
  done
  echo "${out% }"
}

# --- icon lookup, verified not blank -------------------------------------------

icon_for() {
  local slug="$1"
  local url="https://skillicons.dev/icons?i=$slug"
  local size
  size=$(curl -s -o /dev/null -w '%{size_download}' "$url" 2>/dev/null || echo 0)
  # skillicons.dev returns a ~256-byte "undefined" placeholder SVG for any
  # slug it doesn't recognise (discovered first-hand adding the fluxcd
  # topic, which needed a GitHub-avatar icon instead) — anything that small
  # isn't a real icon.
  if [ "$size" -gt 1000 ]; then
    echo "$url"
  else
    echo ""
  fi
}

# --- generate rows -------------------------------------------------------------

rows=""
needs_polish=()
for slug in "${missing[@]}"; do
  name=$(prettify "$slug")
  icon=$(icon_for "$slug")
  if [ -n "$icon" ]; then
    icon_td="<td><img height=\"28\" src=\"$icon\" /></td>"
  else
    icon_td="<td><!-- TODO: no skillicons.dev icon for '$slug' — add one manually (e.g. a GitHub org avatar, see the argocd/fluxcd rows for precedent) --></td>"
    needs_polish+=("$slug: icon")
  fi

  if [ -d "$TOPICS_DIR/$slug/basics" ]; then
    basics_td="<td>✔️ <a href=\"./topics/$slug/basics/\">Explore</a></td>"
  else
    basics_td="<td><!-- TODO: no basics/ yet --></td>"
    needs_polish+=("$slug: basics")
  fi

  if [ -d "$TOPICS_DIR/$slug/practice" ]; then
    practice_td="<td>🏃 <a href=\"./topics/$slug/practice/\">Explore</a></td>"
  else
    practice_td="<td><!-- TODO: no practice/ yet --></td>"
    needs_polish+=("$slug: practice")
  fi

  needs_polish+=("$slug: docs link")

  rows+="    <tr>
        $icon_td
        <td>$name</td>
        <td><a href=\"./topics/$slug/\">$slug</a></td>
        <td>📖 <!-- TODO: official docs link --></td>
        $basics_td
        $practice_td
    </tr>
"
done

# Insert just before the table's closing tag. chmod --reference before the
# mv: writing through a fresh temp file (safer than in-place editing) would
# otherwise silently drop README.md's existing permission bits.
awk -v rows="$rows" '
  /<\/table>/ && !done { printf "%s", rows; done=1 }
  { print }
' "$README" >"$README.tmp"
chmod --reference="$README" "$README.tmp"
mv "$README.tmp" "$README"

echo "✅ Added ${#missing[@]} row(s) to README.md's topics table: ${missing[*]}"
echo ""
echo "⚠️  Needs a human pass before merging:"
printf '   - %s\n' "${needs_polish[@]}"
