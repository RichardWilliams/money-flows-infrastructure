# Phase 1.5 GitHub Integration - Continuation Prompt

## Context Summary

I have completed Phase 1 local development of the Money Flows project and set up a comprehensive codespace development environment. The devcontainer is now successfully built and running with:

- .NET 9 SDK
- PostgreSQL client tools
- Redis tools
- GitHub CLI (gh) - **just installed, not yet authenticated**
- All VS Code extensions configured
- Shared infrastructure (PostgreSQL, Redis, MinIO) via Docker Compose

## Project Structure

```
/Users/iwanwilliams/AI/
├── codespace/                          # Master dev environment (devcontainer)
│   ├── .devcontainer/
│   ├── infrastructure/                 # Shared services configs
│   ├── workspaces/
│   │   └── money-flows.code-workspace
│   └── scripts/                        # Service management
│
└── money-flows/                        # Application code
    ├── backend/                        # .NET 9 Web API
    │   ├── src/Api/                   # Main API project
    │   └── src/Api.Tests/             # Test project
    └── frontend/                       # React + Vite UI
```

## What I Need Help With

I need to complete **PHASE 1.5: GitHub Integration** following these exact steps with strict approval requirements:

### CRITICAL RULES (NON-NEGOTIABLE)
1. **Ask for approval BEFORE every GitHub operation** (auth, repo creation, commits, pushes, PRs)
2. **Show me ALL content before committing** (file contents, commit messages, PR descriptions)
3. **Wait for explicit "YES" or "APPROVE"** at each step - never proceed without confirmation
4. **Use existing SSH authentication** - I'm already authenticated as "RichardWilliams" on GitHub
5. **Follow the exact repository structure** specified below

### Tasks to Complete

#### 1. Authenticate GitHub CLI
- GitHub CLI (`gh`) is installed in the devcontainer
- I have SSH keys mounted from host at `/home/vscode/.ssh/`
- My SSH connection to GitHub is already verified (authenticated as "RichardWilliams")
- Run: `gh auth login` and configure to use SSH authentication
- **ASK FOR APPROVAL** before running authentication

#### 2. Create Three GitHub Repositories

Create these repositories with **PUBLIC** visibility:

**Repository 1: money-flows-api**
- Description: "Property & Home Management API - Backend services built with .NET 9, PostgreSQL, and CQRS"
- Topics: `dotnet`, `csharp`, `webapi`, `postgresql`, `cqrs`, `vertical-slice-architecture`
- Initialize with: README, .gitignore (VisualStudio)

**Repository 2: money-flows-ui**
- Description: "Property & Home Management UI - Frontend application built with React, Vite, and TypeScript"
- Topics: `react`, `vite`, `typescript`, `frontend`, `spa`
- Initialize with: README, .gitignore (Node)

**Repository 3: money-flows-infrastructure**
- Description: "Property & Home Management Infrastructure - DevContainer setup, Docker Compose, and shared development environment"
- Topics: `devcontainer`, `docker`, `infrastructure`, `development-environment`
- Initialize with: README, .gitignore (VisualStudio)

**APPROVAL REQUIRED**: Show me the exact `gh repo create` commands before executing each one.

#### 3. Initialize Git Workflow

For each of the three directories, follow this workflow:

**A. Backend (/Users/iwanwilliams/AI/money-flows/backend)**

```bash
cd /Users/iwanwilliams/AI/money-flows/backend

# Initialize Git
git init
git branch -M main

# Add remote
git remote add origin git@github.com:RichardWilliams/money-flows-api.git

# Stage files
git add .

# Show staged files for approval
git status

# WAIT FOR APPROVAL - Show me all files that will be committed

# Create initial commit
git commit -m "Initial commit: .NET 9 API with CQRS and Vertical Slice Architecture

Features:
- Clean Architecture with Vertical Slices
- CQRS with MediatR
- Entity Framework Core with PostgreSQL
- FluentValidation
- Serilog logging
- Health checks
- Swagger/OpenAPI

🤖 Generated with Claude Code
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

# WAIT FOR APPROVAL before pushing

# Push to GitHub
git push -u origin main

# Create feature branch
git checkout -b feature/phase-1-complete

# WAIT FOR APPROVAL before creating PR
```

**B. Frontend (/Users/iwanwilliams/AI/money-flows/frontend)**

```bash
cd /Users/iwanwilliams/AI/money-flows/frontend

# Same workflow as backend
# Adjust commit message to:
"Initial commit: React + Vite frontend with TypeScript

Features:
- React 18 with TypeScript
- Vite build tooling
- Modern component architecture
- ESLint configuration

🤖 Generated with Claude Code
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
```

**C. Infrastructure (/Users/iwanwilliams/AI/codespace)**

```bash
cd /Users/iwanwilliams/AI/codespace

# Same workflow as backend
# Adjust commit message to:
"Initial commit: DevContainer master development environment

Features:
- .NET 9 SDK
- PostgreSQL 16 + Redis 7 + MinIO
- GitHub CLI integration
- VS Code workspace configurations
- Pre-configured extensions (SQLTools, Redis, Docker, Nginx)
- Service management scripts

🤖 Generated with Claude Code
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
```

#### 4. Create Pull Requests

For each repository, create a PR from the feature branch:

```bash
gh pr create --title "Phase 1 Complete: Initial Implementation" --body "$(cat <<'EOF'
## Summary
- Initial implementation of [Backend API / Frontend UI / Infrastructure]
- All Phase 1 requirements completed
- Ready for review

## Changes
[List key changes based on the repository]

## Test Plan
- [X] Local development environment tested
- [X] All services running
- [ ] Ready for deployment setup

🤖 Generated with Claude Code
EOF
)"
```

**APPROVAL REQUIRED**: Show me each PR title and body before creating.

### Important Notes

1. **Working Directory**: I am currently inside the devcontainer at `/workspace`
2. **SSH Keys**: Mounted from `~/.ssh/` on host to `/home/vscode/.ssh/` in container
3. **Git Config**: Mounted from host, already configured
4. **GitHub User**: RichardWilliams
5. **Approval Process**:
   - Show command → Wait for "YES" → Execute → Show output
   - Show file contents → Wait for "YES" → Commit
   - Show commit message → Wait for "YES" → Push
   - Show PR details → Wait for "YES" → Create

### What Success Looks Like

At the end of this phase, I should have:
- ✅ GitHub CLI authenticated with SSH
- ✅ Three public repositories created on GitHub
- ✅ Initial commits pushed to `main` branch for all three repos
- ✅ Feature branches created (`feature/phase-1-complete`)
- ✅ Three pull requests ready for review
- ✅ All repositories properly linked and documented

### Ready to Start?

Please help me complete Phase 1.5 following the exact steps above with the strict approval requirements. Start by authenticating GitHub CLI, then proceed step-by-step through repository creation and Git workflow initialization.

**REMEMBER**: Ask before every GitHub operation and show me all content before committing!
