# Agency OS Test

A minimal Next.js application using the App Router, deployed on Vercel.

## Prerequisites

- Node.js 18.x or later
- npm (comes with Node.js)

## Getting Started

### Installation

Clone the repository and install dependencies:

```bash
git clone https://github.com/wordisborn/agency-os-test.git
cd agency-os-test
npm install
```

### Development

Run the development server:

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser to see the application.

The page will auto-update as you edit files in the `app/` directory.

### Production Build

Create an optimized production build:

```bash
npm run build
```

Run the production server locally:

```bash
npm run start
```

### Code Quality

Run ESLint to check code quality:

```bash
npm run lint
```

## Deployment

This application is designed to deploy on Vercel:

1. Push your code to GitHub
2. Import your repository in [Vercel](https://vercel.com)
3. Vercel will automatically detect Next.js and configure the build
4. Your app will be deployed and available at a Vercel URL

For more details, see the [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying).

## Tech Stack

- **Framework:** Next.js 16.1+ (App Router)
- **Language:** TypeScript
- **Hosting:** Vercel
- **Package Manager:** npm

## Project Structure

```
.
├── app/              # Next.js App Router pages and layouts
├── public/           # Static assets
├── openspec/         # OpenSpec specifications and changes
├── .github/          # GitHub workflows (Claude Code integration)
├── next.config.ts    # Next.js configuration
├── tsconfig.json     # TypeScript configuration
└── package.json      # Dependencies and scripts
```

## OpenSpec Workflow

This project follows OpenSpec-driven development. All meaningful changes are tracked in `openspec/changes/`. See [CLAUDE.md](./CLAUDE.md) for workflow rules.

## Learn More

- [Next.js Documentation](https://nextjs.org/docs)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)
- [Vercel Documentation](https://vercel.com/docs)
