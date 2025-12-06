# AI Codespace - Quick Start 🚀

## TL;DR

```bash
# 1. Open codespace
cd /Users/iwanwilliams/AI/codespace
code .

# 2. Reopen in Container (when prompted)

# 3. Start services
./scripts/start-money-flows.sh

# 4. Open workspace
# File → Open Workspace → workspaces/money-flows.code-workspace

# 5. Run app
# Press F5 → "Money Flows (Full Stack)"
```

---

## Common Commands

### Service Management

```bash
./scripts/start-money-flows.sh   # Start all services
./scripts/status.sh               # Check health
./scripts/logs.sh                 # View logs
./scripts/stop-all.sh             # Stop everything
./scripts/cleanup.sh              # Fresh start (deletes data!)
```

### Database Access

```bash
# PostgreSQL CLI
psql -h postgres -U postgres -d property_mgmt

# Adminer UI
open http://localhost:8080
```

### GitHub CLI

```bash
gh auth login                     # First time setup
gh repo create                    # Create repository
gh pr create                      # Create pull request
```

### Development

```bash
# Backend
cd ../money-flows/backend
dotnet run --project src/Api

# Frontend
cd ../money-flows/frontend
npm run dev

# Tests
dotnet test
```

---

## Service URLs

- Backend API: http://localhost:5000
- Backend Swagger: http://localhost:5000/swagger
- Frontend: http://localhost:5173
- PostgreSQL: localhost:5432
- Redis: localhost:6379
- MinIO Console: http://localhost:9001
- Adminer: http://localhost:8080

---

## Credentials

| Service | Username | Password |
|---------|----------|----------|
| PostgreSQL | postgres | postgres |
| Redis | - | (no password) |
| MinIO | minioadmin | minioadmin |

---

## Workspace Shortcuts

| Action | Shortcut |
|--------|----------|
| Open Workspace | `File` → `Open Workspace from File` |
| Run Full Stack | `F5` → **Money Flows (Full Stack)** |
| New Terminal | `Ctrl+Shift+` ` |
| Command Palette | `F1` or `Ctrl+Shift+P` |

## VS Code Extensions

| Extension | Access | Shortcut |
|-----------|--------|----------|
| **SQLTools** (PostgreSQL) | Database icon | `Ctrl+Alt+D` |
| **Redis Client** | Redis icon | Click sidebar |
| **Docker** | Docker icon | Click sidebar |
| **Nginx Formatter** | Auto on save | `Shift+Alt+F` |

**Full guide**: [VSCODE_EXTENSIONS_GUIDE.md](VSCODE_EXTENSIONS_GUIDE.md)
**Quick ref**: [EXTENSIONS_QUICK_REF.md](EXTENSIONS_QUICK_REF.md)

---

## Need Help?

1. Check status: `./scripts/status.sh`
2. View logs: `./scripts/logs.sh`
3. Read docs: [README.md](README.md)
4. Restart: `./scripts/stop-all.sh && ./scripts/start-money-flows.sh`

---

**Remember**: This is your mission control for ALL projects! 🎯
