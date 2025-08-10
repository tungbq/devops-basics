## SonarQube

### 1. What is SonarQube?

**Overview**
SonarQube is an open-source platform for **continuous inspection of code quality**. It performs **static code analysis** to detect bugs, vulnerabilities, code smells, and duplicated code across multiple languages.
It integrates with CI/CD pipelines to automatically scan your codebase, enforce quality gates, and monitor metrics such as code coverage over time.

> See: [https://www.sonarsource.com/products/sonarqube/](https://www.sonarsource.com/products/sonarqube/)

**SonarQube Diagram**

- Typical flow:
  Developer → Commit & Push → CI/CD runs build/tests → SonarScanner sends analysis to SonarQube → SonarQube evaluates against Quality Gate → Results in dashboard & PR comments.

**Official Website of SonarQube**
[https://www.sonarsource.com/products/sonarqube/](https://www.sonarsource.com/products/sonarqube/)

**Official Documentation**
[https://docs.sonarsource.com/sonarqube/](https://docs.sonarsource.com/sonarqube/)

### 2. Prerequisites

To start working with SonarQube:

- A running SonarQube instance (local via Docker or remote server)
- SonarQube project key and token
- Basic knowledge of your project’s build tool (e.g., `dotnet`, Maven, Gradle, npm)
- Installed scanner for your tech stack:

  - **.NET**: `dotnet-sonarscanner`
  - **Generic**: `sonar-scanner` CLI

### 3. SonarQube Basics

**Getting Started with SonarQube**
Start here: [https://docs.sonarsource.com/sonarqube-server/10.6/try-out-sonarqube/](https://docs.sonarsource.com/sonarqube-server/10.6/try-out-sonarqube/)

**Key Concepts:**

- **Project**: A codebase being analyzed.
- **Quality Profile**: Set of rules applied to a project’s language.
- **Quality Gate**: Pass/fail criteria for new code (e.g., coverage ≥ 80%).
- **Issues**: Findings categorized as Bugs, Vulnerabilities, or Code Smells.
- **New Code**: Recently added or changed code, usually compared to the main branch.

**Basics**

- Get hands-on with Sonarqube basics here: [basics](./basics/)

### 4. Advanced Topics

**Custom Quality Gates**
Set rules like:

- No new critical issues
- New code coverage ≥ 80%
- New code duplication ≤ 3%

**Multi-Language Scans**
Analyze projects with multiple tech stacks in a single run (e.g., backend + frontend).

**SonarCloud**
Cloud-hosted alternative with built-in GitHub/Bitbucket/GitLab integration.
[https://sonarcloud.io/](https://sonarcloud.io/)

### 5. More...

**SonarQube Developer Resources**

- [https://community.sonarsource.com/](https://community.sonarsource.com/)

**SonarQube practice**
- [https://github.com/SonarSource/sonar-scanning-examples](https://github.com/SonarSource/sonar-scanning-examples)

**Recommended Books**
N/A
