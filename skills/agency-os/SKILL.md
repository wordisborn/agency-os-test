---
name: agency-os
description: Runs a spec-driven delivery loop using OpenSpec with only two human touchpoints: proposal approval and release approval. Use for building features end-to-end in a controlled, auditable way.
---

# Agency OS (Proposal + Release)

## Operating rules
- Work MUST be tracked as an OpenSpec change.
- Only two user approvals are required:
  1) **Proposal approval** (scope locked)
  2) **Release approval** (deploy-ready)
- Anything not in the approved OpenSpec change is out of scope.

## Definition of "Release"
Release means: merged + CI green + deployed to a real environment (staging at minimum; production when applicable) with a rollback plan.

## Required artifacts (always)
For any change `<change-name>`:
- `openspec/changes/<change-name>/proposal.md`
- `openspec/changes/<change-name>/tasks.md`
- `openspec/changes/<change-name>/specs/**/spec.md` (deltas)
Optional:
- `openspec/changes/<change-name>/design.md` (for irreversible decisions)

## Gates
### Gate A — Proposal ready for approval
- Proposal clearly states goals + non-goals
- Tasks are broken down and checkable
- Spec deltas include acceptance scenarios
- `openspec validate <change-name>` passes (or equivalent checks)

### Gate B — Release ready
- All tasks checked off
- Tests + lint pass
- Deployment notes written (staging/prod)
- Rollback plan exists
- Post-deploy checks listed (what to watch)

## OpenSpec usage reminders
- Create: `/openspec:proposal <name>`
- Implement: `/openspec:apply <name>`
- Finish: `/openspec:archive <name>`