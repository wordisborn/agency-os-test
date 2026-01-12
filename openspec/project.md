# Project Context

## Purpose

Agency OS Test is a foundational Next.js application serving as the base for building agency-focused tools and workflows. The project follows OpenSpec-driven development practices with tight GitHub integration via Claude Code.

## Tech Stack

- **Frontend Framework:** Next.js 16.1+ (App Router)
- **Language:** TypeScript (strict mode)
- **Hosting Platform:** Vercel
- **Package Manager:** npm
- **Backend:** Supabase (Postgres + Auth + Storage) - _to be added_
- **Version Control:** Git + GitHub
- **CI/CD:** GitHub Actions
- **AI Assistant:** Claude Code (GitHub integration)

## Project Conventions

### Code Style

- TypeScript strict mode enabled
- ESLint with Next.js recommended rules
- Functional components with React hooks
- Prefer `const` over `let`, avoid `var`
- Use TypeScript types/interfaces over `any`
- File naming: kebab-case for files, PascalCase for components

### Architecture Patterns

- **App Router:** Use Next.js App Router (not Pages Router)
- **Server Components:** Default to server components, use client components only when needed
- **File Structure:** Keep components in `/app` directory, group by route
- **Background Jobs:** Use request → enqueue → poll/stream pattern (see CLAUDE.md)
- **API Routes:** Keep in `/app/api` when needed

### Testing Strategy

- Unit tests for business logic (to be implemented)
- Integration tests for API routes (to be implemented)
- E2E tests for critical user flows (to be implemented)
- Run tests in CI before merge

### Git Workflow

- **Branch Naming:** `openspec/<change-name>` for features
- **Never push to main directly**
- **Commits:** Small, atomic commits mapped to tasks.md items
- **Commit Format:** `type(openspec/<change-name>): description`
  - Types: `feat`, `fix`, `chore`, `refactor`, `test`, `docs`
- **Pull Requests:** Must include:
  - Link to OpenSpec change folder
  - Test plan
  - Rollout/rollback notes
- **Co-Author:** Include Claude in commits:
  ```
  Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
  ```

## Domain Context

Agency operations and workflows. Specifics to be defined as features are built.

## Important Constraints

- **No direct main pushes:** All changes via PR
- **OpenSpec required:** All meaningful work must have an OpenSpec change
- **Runtime boundaries:** No long/async work in request handlers; use background jobs
- **Security:** No secrets in code; use environment variables
- **Minimal scope:** Avoid over-engineering; add complexity only when needed

## External Dependencies

- **Vercel:** Hosting and deployment platform
- **GitHub:** Code hosting, CI/CD, and Claude Code integration
- **Supabase:** Backend services (to be integrated)
- **Claude API:** AI assistant capabilities via Claude Code

## Current State

**Phase:** Initial setup complete
**Last Updated:** 2026-01-12

### Completed Changes

- `bootstrap-nextjs`: Minimal Next.js app with App Router + TypeScript

### Planned Changes

- Add Supabase integration
- Implement authentication
- Set up background jobs architecture
- Add styling framework
