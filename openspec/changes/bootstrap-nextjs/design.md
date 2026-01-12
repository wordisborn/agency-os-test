# Design: Bootstrap Next.js App

**Change ID:** `bootstrap-nextjs`

## Architectural Decisions

### 1. Next.js App Router (not Pages Router)

**Decision:** Use Next.js App Router

**Rationale:**
- App Router is the current recommended approach by Next.js (stable as of v13+)
- Better server component support and streaming
- More aligned with React's future direction
- CLAUDE.md explicitly specifies "Next.js (App Router)"

**Trade-offs:**
- Slightly steeper learning curve than Pages Router
- Some third-party libraries may have better Pages Router support
- ✅ Accepted: App Router is the strategic choice for new projects

---

### 2. TypeScript Configuration

**Decision:** Enable TypeScript from the start

**Rationale:**
- Industry standard for production applications
- Better IDE support and developer experience
- Catches errors at compile time
- Expected by CLAUDE.md tech stack conventions

**Trade-offs:**
- Minimal overhead for setup (Next.js handles most TS config)
- ✅ Accepted: TypeScript is non-negotiable for this project

---

### 3. Minimal Initial Setup

**Decision:** Decline optional features during `create-next-app` (Tailwind, src/, etc.)

**Rationale:**
- Tailwind/styling: Can be added later via separate OpenSpec change
- `src/` directory: Not needed for small projects; adds unnecessary nesting
- Keep root directory structure clean and standard

**Trade-offs:**
- May need to add styling solution later (intentional - not in scope)
- ✅ Accepted: Start minimal, add complexity only when needed

---

### 4. Vercel as Deployment Platform

**Decision:** Target Vercel for deployment

**Rationale:**
- Specified in CLAUDE.md tech stack
- Zero-config deployment for Next.js (built by same company)
- Excellent DX with git integration
- Free tier suitable for MVP/testing

**Trade-offs:**
- Vendor lock-in to Vercel's platform
- May need configuration changes if migrating to other platforms later
- ✅ Accepted: Vercel is the designated platform per project requirements

---

## File Structure

```
/
├── app/
│   ├── layout.tsx          # Root layout
│   ├── page.tsx            # Homepage
│   └── globals.css         # Global styles (minimal)
├── public/
│   └── (static assets)
├── .gitignore
├── next.config.js          # Next.js configuration
├── package.json
├── tsconfig.json
├── README.md
└── openspec/               # Existing directory
    └── changes/
        └── bootstrap-nextjs/
```

## Non-Functional Requirements

### Performance
- Initial page load should be < 3 seconds on typical broadband
- Build time should be < 2 minutes locally
- No performance optimizations beyond Next.js defaults at this stage

### Security
- No authentication or sensitive data in this phase
- Follow Next.js security defaults
- Secrets (if any added later) must use environment variables

### Scalability
- Not a concern for initial scaffold
- Next.js handles basic scaling via Vercel automatically

## Open Questions

None. This is a straightforward implementation with well-established patterns.

## Future Considerations

After this change is complete and approved, likely next steps:
1. Add Supabase integration (per CLAUDE.md backend specification)
2. Add basic styling framework
3. Add authentication
4. Set up background jobs architecture

These are out of scope for this proposal.
