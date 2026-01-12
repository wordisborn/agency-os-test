# CLAUDE.md — Agency Operating Rules

These are the non-negotiable repo rules for building and shipping work in this repository.

## Touchstones (human approvals)
Stop and wait for Jason at exactly two points:
1) **Proposal approval** — scope is locked (OpenSpec change is ready)
2) **Release approval** — deploy-ready (staging verified, release packet complete)

## Workflow: OpenSpec-driven delivery
- All meaningful work MUST be represented as an OpenSpec change folder.
- Branches, commits, and PRs MUST reference the OpenSpec change they implement.
- Do not implement work that is not in the approved OpenSpec change.

## Branching
- **Never push to `main`.**
- For each OpenSpec change, create a feature branch named:
  - `openspec/<change-name>`
- Open a PR early (draft is fine). All work happens via PR.

## Commits
- Keep commits small and map them to items in `tasks.md`.
- Commit message format:
  - `feat(openspec/<change-name>): <summary>`
  - (use `fix/ chore/ refactor/ test/ docs` as appropriate)

## PR hygiene (required)
Every PR MUST include:
- A link to the OpenSpec change folder: `openspec/changes/<change-name>/`
- A **Test Plan** (how to verify the change)
- **Rollout / Rollback notes** (how to deploy + undo safely)

## Tech stack (default)
Use this stack unless the approved proposal explicitly changes it:
- Frontend: **Next.js (App Router)**
- Hosting: **Vercel**
- Backend: **Supabase** (Postgres + Auth + Storage)

## Runtime boundaries (important)
- Do **not** run long/async work in request handlers.
- Any multi-step or slow task MUST use:
  - `request -> enqueue job -> poll/stream result`
- Use the **Background Jobs** blueprint for:
  - LLM calls
  - document generation/parsing
  - retries / rate limits
  - webhooks / external integrations

## Release-ready checklist (required)
A change is "release ready" only if all of the following are true:

### Scope + traceability
- The PR links to `openspec/changes/<change-name>/`
- All `tasks.md` items are completed (or explicitly deferred in the spec/proposal)

### Quality gates
- CI is green (lint, typecheck, tests, build)
- New/changed behavior is covered by tests (or the PR explains why not)
- No obvious security regressions (secrets, authz, injection, unsafe dependencies)

### Staging verification
- Deployed to staging (or the canonical demo environment)
- Smoke-tested against the **Test Plan**
- Any migrations were run and verified (if applicable)

### Rollout / rollback
- Rollout steps are documented
- Rollback steps are documented and plausible
- Feature flags are used for risky changes (when applicable)

### Observability (as applicable)
- Logs/metrics needed to validate the change are in place
- Post-deploy checks are listed (what to look at right after deploy)

When all items pass, the Release Manager should post a short Release Packet and declare:
**READY FOR RELEASE APPROVAL**.