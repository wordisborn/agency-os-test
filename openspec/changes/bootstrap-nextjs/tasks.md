# Tasks: Bootstrap Next.js App

**Change ID:** `bootstrap-nextjs`

## Implementation Tasks

### 1. Scaffold Next.js Application
- [ ] Run `npx create-next-app@latest` with the following options:
  - TypeScript: Yes
  - ESLint: Yes
  - Tailwind CSS: No
  - `src/` directory: No
  - App Router: Yes
  - Import alias: Default (`@/*`)
- [ ] Verify all files were created successfully
- [ ] Verify `package.json` contains expected scripts

**Validation:** Files exist at expected locations (`app/`, `package.json`, `tsconfig.json`, etc.)

---

### 2. Remove Unnecessary Dependencies (if any)
- [ ] Review `package.json` for any non-essential dependencies
- [ ] Remove or keep default Next.js setup as-is (prefer keeping minimal defaults)

**Validation:** `npm install` runs without warnings

---

### 3. Verify Local Development Server
- [ ] Run `npm install`
- [ ] Run `npm run dev`
- [ ] Open `http://localhost:3000` in browser
- [ ] Verify homepage renders without errors
- [ ] Check dev server logs for any warnings

**Validation:** Homepage loads successfully, no console errors

---

### 4. Verify Production Build
- [ ] Run `npm run build`
- [ ] Check for build errors or warnings
- [ ] Run `npm run start`
- [ ] Verify production build serves correctly on `localhost:3000`

**Validation:** Build completes successfully, production server runs

---

### 5. Run Code Quality Checks
- [ ] Run `npm run lint`
- [ ] Fix any linting errors (if any)
- [ ] Verify TypeScript compilation succeeds

**Validation:** `npm run lint` exits with code 0

---

### 6. Add Vercel Configuration (if needed)
- [ ] Check if Vercel auto-detects Next.js (usually does by default)
- [ ] Add `vercel.json` only if custom configuration is needed
- [ ] Verify framework is set to Next.js

**Validation:** Vercel configuration is minimal or absent (relies on auto-detection)

---

### 7. Update Documentation
- [ ] Update README.md with:
  - Project description
  - Prerequisites (Node.js version)
  - Setup instructions (`npm install`)
  - Run instructions (`npm run dev`)
  - Build instructions (`npm run build`)
  - Deployment instructions (Vercel)
- [ ] Update `openspec/project.md` with tech stack details

**Validation:** Another developer can follow README to run the app

---

### 8. Create Pull Request
- [ ] Ensure all changes are committed on branch `openspec/bootstrap-nextjs`
- [ ] Create PR with:
  - Title: "feat(openspec/bootstrap-nextjs): scaffold Next.js app"
  - Link to `openspec/changes/bootstrap-nextjs/`
  - Test Plan: Steps to verify local dev and build
  - Rollout notes: Deploy to Vercel after merge
  - Rollback notes: Delete deployment, revert commit
- [ ] Verify CI passes (if any CI is configured)

**Validation:** PR is created and links to OpenSpec change

---

## Verification Checklist

Before marking this change complete, verify:

- [ ] All acceptance criteria from proposal.md are met
- [ ] App runs locally via `npm run dev`
- [ ] Production build succeeds
- [ ] README is updated with clear instructions
- [ ] No build warnings or errors
- [ ] Branch follows naming convention: `openspec/bootstrap-nextjs`
- [ ] PR follows CLAUDE.md PR hygiene rules

## Notes

- This is a greenfield scaffold, so no existing code needs to be preserved
- Keep the setup minimal - resist adding "nice to have" features
- All tasks should be completed sequentially (no parallelization needed for this small scope)
