# Contributing to VocaSygnal

Thank you for your interest in contributing to VocaSygnal!

VocaSygnal is an open-source job market intelligence and career matching platform combining full-stack development, data engineering, natural language processing, and machine learning.

We welcome contributions from developers, data scientists, researchers, students, and open-source enthusiasts.

All contributors are expected to follow the guidelines below to maintain code quality, consistency, reproducibility, and project stability.

---

## 1. Code of Conduct

All contributors must:

- Communicate respectfully and professionally.
- Provide constructive feedback.
- Respect different technical opinions.
- Avoid discriminatory, offensive, or inappropriate behaviour.
- Help maintain an inclusive development environment.

---

## 2. Before Contributing

Before starting development:

1. Check existing GitHub Issues.
2. Search for duplicate feature requests or bug reports.
3. Discuss significant changes through a GitHub Issue.
4. Wait for approval or clarification before starting major features.
5. Make sure your proposed contribution aligns with the project objectives.

For small documentation corrections, contributors may open an issue and submit a PR without waiting for separate approval.

---

## 3. Git Branching Strategy

The `main` branch is the stable integration branch.

Direct commits to `main` are not permitted.

Every contribution must be developed in a dedicated branch created from the latest `main`.

### Branch Naming Convention

Use the following formats:

| Type | Format |
|---|---|
| Feature | `feature/<issue-id>-<description>` |
| Bug fix | `fix/<issue-id>-<description>` |
| Documentation | `docs/<issue-id>-<description>` |
| Refactoring | `refactor/<issue-id>-<description>` |
| Testing | `test/<issue-id>-<description>` |
| Infrastructure | `chore/<issue-id>-<description>` |

Examples:

```text
feature/12-user-authentication
fix/15-invalid-csv-upload
docs/18-update-api-documentation
test/22-job-matching-tests
chore/25-docker-configuration
```

---

## 4. Issue-Driven Development

Every meaningful contribution must be associated with a GitHub Issue.

Issues should clearly describe:

- Problem or requirement.
- Expected behaviour.
- Proposed implementation.
- Acceptance criteria.
- Relevant technical considerations.

Contributors should reference the associated Issue in their Pull Requests.

Use GitHub keywords such as:

```text
Closes #12
Fixes #15
Resolves #18
```

Issues should be closed only after the associated implementation has been successfully merged.

---

## 5. Development Workflow

Follow these steps for every contribution.

### Step 1: Fork the Repository

Fork the official VocaSygnal repository to your GitHub account.

### Step 2: Clone Your Fork

```bash
git clone https://github.com/YOUR_USERNAME/vocasygnal.git

cd vocasygnal
```

### Step 3: Configure the Upstream Repository

```bash
git remote add upstream https://github.com/ORIGINAL_OWNER/vocasygnal.git
```

### Step 4: Synchronise Main

```bash
git switch main
git pull upstream main
```

### Step 5: Create a Dedicated Branch

```bash
git switch -c feature/12-your-feature-name
```

### Step 6: Implement the Contribution

- Follow the existing project architecture.
- Write clean and maintainable code.
- Add appropriate tests.
- Update relevant documentation.
- Avoid unnecessary dependencies.
- Never commit credentials or sensitive information.

### Step 7: Run Quality Checks

Run the relevant checks before committing.

Python:

```bash
ruff check .
ruff format --check .
mypy app
pytest -v
```

Frontend:

```bash
npm run lint
npm run build
npm run test
```

Not every check will apply to every change, but all relevant checks must pass.

### Step 8: Commit Your Changes

Follow Conventional Commits.

Examples:

```text
feat(auth): add user registration
fix(api): handle invalid request payloads
docs(readme): update installation instructions
test(jobs): add job filtering tests
refactor(database): improve repository structure
chore(ci): configure automated testing
```

### Step 9: Push Your Branch

```bash
git push -u origin feature/12-your-feature-name
```

### Step 10: Create a Pull Request

Open a Pull Request against the official repository's `main` branch.

Include:

- Summary of changes.
- Related GitHub Issue.
- Implementation details.
- Testing performed.
- Screenshots when relevant.
- Potential breaking changes.

### Step 11: Review and Merge

- Resolve review comments.
- Ensure required CI checks pass.
- Obtain the required maintainer approval.
- Merge after the contribution is approved.
- Delete the feature branch after merging.

---

## 6. Coding Standards

### Python

Follow:

- PEP 8 – Style Guide for Python Code.
- PEP 257 – Docstring Conventions.
- PEP 484 – Type Hints.

Requirements:

- Use meaningful variable and function names.
- Add type hints.
- Write clear docstrings for public interfaces.
- Keep functions focused.
- Handle exceptions appropriately.
- Use Ruff and Mypy.

### TypeScript and React

Requirements:

- Prefer TypeScript over untyped JavaScript.
- Avoid unnecessary use of `any`.
- Use reusable React components.
- Keep business logic separate from presentation.
- Follow existing frontend conventions.
- Use ESLint and the project's formatter.

### API Development

- Follow REST API conventions.
- Use consistent response structures.
- Validate incoming requests.
- Handle errors properly.
- Document public endpoints.
- Maintain API versioning.

### Database Development

- Use SQLAlchemy for ORM operations.
- Use Alembic for schema migrations.
- Never modify production database schemas manually.
- Document important schema changes.
- Consider indexing and query performance.

---

## 7. Testing Requirements

All meaningful code changes must include appropriate tests.

Expected testing practices include:

- Unit testing.
- Integration testing.
- API testing.
- Frontend component testing.
- End-to-end testing.
- Machine learning pipeline testing.

Machine learning contributions should document:

- Dataset origin.
- Preprocessing methodology.
- Model configuration.
- Evaluation metrics.
- Reproducibility considerations.

Do not submit changes that knowingly break existing tests.

---

## 8. Documentation

Contributors should update documentation whenever functionality changes.

Relevant documentation includes:

- README.md
- API documentation
- Architecture documentation
- Database documentation
- Installation instructions
- Testing instructions
- Model methodology
- CHANGELOG.md

---

## 9. Security and Data Privacy

Contributors must:

- Never commit API keys, passwords, or tokens.
- Never expose private candidate information.
- Avoid uploading real personal CVs or sensitive data.
- Validate uploaded files.
- Follow secure authentication practices.
- Respect the licences and terms of external datasets.
- Report security vulnerabilities privately to the project maintainers rather than publishing exploit details in public Issues.

---

## 10. Pull Request Checklist

Before submitting a Pull Request, verify:

- [ ] An associated GitHub Issue exists.
- [ ] A dedicated branch was created.
- [ ] Changes follow the project architecture.
- [ ] Code follows the relevant style standards.
- [ ] Appropriate tests were added.
- [ ] Existing tests pass.
- [ ] Documentation was updated.
- [ ] No credentials or sensitive data are included.
- [ ] Commit messages follow Conventional Commits.
- [ ] Pull Request description is complete.
- [ ] Related Issue is referenced.

---

## 11. Versioning

VocaSygnal follows Semantic Versioning:

`MAJOR.MINOR.PATCH`

Examples:

- `0.1.0` – Initial development.
- `0.2.0` – New functionality.
- `0.2.1` – Bug fixes.
- `1.0.0` – First stable release.

---

## 12. Recognition

Contributors who make meaningful contributions may be acknowledged in the project documentation and release notes.

Thank you for helping improve VocaSygnal!

**VocaSygnal**

*Turning job market data into career intelligence.*