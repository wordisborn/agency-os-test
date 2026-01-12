# Tasks: Add Health Endpoint

**Change ID:** `add-health-endpoint`

## Implementation Tasks

### 1. Create Health API Route
- [ ] Create directory `/app/api/health/`
- [ ] Create file `/app/api/health/route.ts`
- [ ] Implement GET handler that returns:
  - HTTP 200 status
  - JSON with `status: "ok"` and `timestamp`
  - Content-Type: application/json
  - Cache-Control: no-cache, no-store, must-revalidate

**Validation:** File exists at correct location with TypeScript code

---

### 2. Test Endpoint Locally (Development)
- [ ] Run `npm run dev`
- [ ] Send GET request to `http://localhost:3000/api/health`
- [ ] Verify response is HTTP 200
- [ ] Verify response body matches expected JSON format
- [ ] Verify response time is under 100ms

**Validation:** `curl http://localhost:3000/api/health` returns expected JSON

---

### 3. Test Endpoint Locally (Production Build)
- [ ] Run `npm run build`
- [ ] Run `npm run start`
- [ ] Send GET request to `http://localhost:3000/api/health`
- [ ] Verify response is HTTP 200
- [ ] Verify response body is correct

**Validation:** Production build serves health endpoint correctly

---

### 4. Run Code Quality Checks
- [ ] Run `npm run lint`
- [ ] Verify no ESLint errors
- [ ] Verify TypeScript compilation succeeds

**Validation:** All linting passes, no type errors

---

### 5. Update Documentation
- [ ] Add health endpoint section to README.md
- [ ] Document endpoint URL: `/api/health`
- [ ] Document response format
- [ ] Provide `curl` example

**Validation:** README has clear health endpoint documentation

---

### 6. Create Pull Request
- [ ] Ensure all changes are committed on branch `openspec/add-health-endpoint`
- [ ] Create PR with:
  - Title: "feat(openspec/add-health-endpoint): add health check endpoint"
  - Link to `openspec/changes/add-health-endpoint/`
  - Test Plan: Steps to test endpoint locally and in production
  - Rollout notes: Deploy via Vercel after merge
  - Rollback notes: Delete route file if issues occur
- [ ] Verify CI passes (lint, type check)

**Validation:** PR is created and follows CLAUDE.md PR hygiene rules

---

## Verification Checklist

Before marking this change complete, verify:

- [ ] All acceptance criteria from proposal.md are met
- [ ] Endpoint returns HTTP 200 with correct JSON
- [ ] Works in both dev and production builds
- [ ] No authentication required (publicly accessible)
- [ ] README documents the endpoint
- [ ] No ESLint or TypeScript errors
- [ ] Branch follows naming convention: `openspec/add-health-endpoint`
- [ ] PR follows CLAUDE.md PR hygiene rules

## Notes

- This is a simple, single-file change with no external dependencies
- Tasks should be completed sequentially
- Testing can be done with `curl`, browser, or any HTTP client
- Keep implementation minimal - avoid adding complexity
