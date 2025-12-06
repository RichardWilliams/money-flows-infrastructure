# AI Codespace - Master Development Environment

Your central development environment for all projects. This is your **mission control** for software development.

## 🎯 What is This?

Think of this as your personal **cloud development environment** (like GitHub Codespaces), but running locally. It provides:

- ✅ **One environment** for all your projects
- ✅ **Shared infrastructure** (databases, caches, storage)
- ✅ **Consistent tooling** (Git, GitHub CLI, Docker, .NET, Node.js)
- ✅ **Multi-project workspaces** (work on multiple related projects simultaneously)
- ✅ **Resource efficient** (shared services, no duplication)

## 🏗️ Architecture

```
AI/
├── codespace/                         # ← You are here
│   ├── .devcontainer/                # Main dev environment
│   ├── workspaces/                   # VS Code workspace definitions
│   ├── infrastructure/               # Shared service configs
│   └── scripts/                      # Utility scripts
│
├── money-flows/                      # Your projects
├── other-project/
└── another-project/
```

### Infrastructure Services

This codespace runs the following shared services:

| Service | Port | Purpose | Access |
|---------|------|---------|--------|
| **PostgreSQL 16** | 5432 | Database | `postgres:5432` (postgres/postgres) |
| **Redis 7** | 6379 | Cache/Queue | `redis:6379` |
| **MinIO** | 9000, 9001 | S3-compatible storage | http://localhost:9000 |
| **Adminer** | 8080 | Database UI | http://localhost:8080 |

### VS Code Extensions (Pre-installed)

**Database Management:**
- ✅ **SQLTools + PostgreSQL** - Query and browse databases directly in VS Code
- ✅ **PostgreSQL Explorer** - Visual database tree explorer
- ✅ **Redis Client** - Browse keys, execute commands, monitor Redis

**Infrastructure:**
- ✅ **Nginx Formatter** - Auto-format Nginx configs
- ✅ **Docker Extension** - Manage containers, view logs, attach shells

**See**: [VSCODE_EXTENSIONS_GUIDE.md](VSCODE_EXTENSIONS_GUIDE.md) for detailed usage
**Quick Ref**: [EXTENSIONS_QUICK_REF.md](EXTENSIONS_QUICK_REF.md)

## 🚀 Quick Start

### First Time Setup

1. **Open this folder in VS Code:**
   ```bash
   cd /Users/iwanwilliams/AI/codespace
   code .
   ```

2. **Reopen in Container:**
   - When prompted, click **"Reopen in Container"**
   - Or press `F1` → **"Dev Containers: Reopen in Container"**
   - Wait for the container to build (3-5 minutes first time)

3. **Verify setup:**
   ```bash
   # Check tools are available
   gh --version
   dotnet --version
   node --version
   docker --version

   # Check infrastructure services
   ./scripts/status.sh
   ```

### Daily Workflow

1. **Open Codespace:**
   ```bash
   cd /Users/iwanwilliams/AI/codespace
   code .
   ```

2. **Load a workspace:**
   - `File` → `Open Workspace from File`
   - Choose: `workspaces/money-flows.code-workspace`
   - This opens Backend + Frontend + Infrastructure together

3. **Start services:**
   ```bash
   # Option 1: Use scripts
   ./scripts/start-money-flows.sh

   # Option 2: Manual
   docker-compose -f .devcontainer/docker-compose.yml up -d
   ```

4. **Start your application:**
   - Use the VS Code debugger: `F5` → **"Money Flows (Full Stack)"**
   - Or run manually:
     ```bash
     # Terminal 1: Backend
     cd ../money-flows/backend
     dotnet run --project src/Api

     # Terminal 2: Frontend
     cd ../money-flows/frontend
     npm run dev
     ```

## 📂 Available Workspaces

### Money Flows (`money-flows.code-workspace`)

Opens Backend + Frontend + Infrastructure for the Money Flows project.

**What it includes:**
- 💰 Money Flows - Backend API (`.NET 10`)
- 🎨 Money Flows - Frontend UI (`React + TypeScript`)
- 🏗️ Codespace (Infrastructure)

**Launch configurations:**
- `🚀 Backend API (.NET 10)` - Run backend with debugger
- `🎨 Frontend (Vite + React)` - Run frontend with hot reload
- `🧪 Backend Tests` - Run all tests
- `🚀 Money Flows (Full Stack)` - **Run both together**

**Tasks available:**
- `Build Backend` - Compile .NET project
- `Watch Backend` - Run with hot reload
- `Test Backend` - Run all tests
- `Start Infrastructure Services` - Start databases, etc.
- `Stop Infrastructure Services` - Stop all services

### Future Workspaces

Add more `.code-workspace` files for other projects:

```json
{
  "folders": [
    {
      "name": "Client Project",
      "path": "../../client-project"
    },
    {
      "name": "Codespace",
      "path": ".."
    }
  ]
}
```

## 🛠️ Utility Scripts

All scripts are in the `scripts/` directory:

### Start Services

```bash
./scripts/start-money-flows.sh
```
Starts PostgreSQL, Redis, MinIO and waits for them to be ready.

### Check Status

```bash
./scripts/status.sh
```
Shows running containers, volumes, networks, and service health.

### View Logs

```bash
# All services
./scripts/logs.sh

# Specific service
./scripts/logs.sh postgres
./scripts/logs.sh redis
./scripts/logs.sh minio
```

### Stop Services

```bash
./scripts/stop-all.sh
```
Stops all infrastructure services (data is preserved).

### Cleanup

```bash
./scripts/cleanup.sh
```
**⚠️ WARNING:** Deletes ALL data in databases and caches. Use for fresh start.

## 🗄️ Infrastructure Details

### PostgreSQL

**Connection:**
- Host: `postgres` (inside container) or `localhost` (from host)
- Port: `5432`
- User: `postgres`
- Password: `postgres`

**Databases:**
- `property_mgmt` - Money Flows project
  - Schema: `property_management` (new app)
  - Schema: `home_accounts` (legacy data)

**Management:**
- Adminer UI: http://localhost:8080
- CLI: `psql -h postgres -U postgres -d property_mgmt`

**Add new databases:**
Edit `infrastructure/postgres/01-init-databases.sql`

### Redis

**Connection:**
- Host: `redis` (inside container) or `localhost` (from host)
- Port: `6379`
- No password (development)

**CLI:**
```bash
redis-cli -h redis
```

**Configuration:**
See `infrastructure/redis/redis.conf`

### MinIO (S3-compatible storage)

**Access:**
- API: http://localhost:9000
- Console: http://localhost:9001
- Credentials: `minioadmin` / `minioadmin`

**Use for:**
- File uploads
- Static assets
- Backups

## 🐳 Docker-in-Docker

This codespace supports Docker-in-Docker, meaning you can:

1. Run containers from within the devcontainer
2. Use `docker-compose` for your projects
3. Build and test Docker images

**Example:**
```bash
# Inside the devcontainer
cd ../money-flows/backend
docker build -t money-flows-api .
docker run -p 5000:5000 money-flows-api
```

## 🔧 Customization

### Add More Tools

Edit `.devcontainer/Dockerfile`:

```dockerfile
# Install your tools
RUN apt-get update && apt-get install -y \
    your-package-here \
    && apt-get clean
```

### Add More Services

Edit `.devcontainer/docker-compose.yml`:

```yaml
services:
  # Your new service
  elasticsearch:
    image: elasticsearch:8
    ports:
      - "9200:9200"
    networks:
      - devnet
```

### Add More Workspaces

Create new `.code-workspace` files in `workspaces/`:

```bash
cp workspaces/money-flows.code-workspace workspaces/my-project.code-workspace
# Edit the new file
```

## 🎓 Tips & Tricks

### Multiple Terminals

Open terminals for different folders:
- `Ctrl+Shift+` ` - New terminal
- Click dropdown → Select folder

### Integrated Debugging

Use the compound launcher to run multiple services:
- `F5` → Choose **"Money Flows (Full Stack)"**
- Sets breakpoints in both backend and frontend
- Debug both simultaneously

### Database Access

**VS Code Extension:**
1. Install SQLTools extension
2. Connect to `postgres:5432`
3. Browse databases visually

**Command Line:**
```bash
# Inside container
psql -h postgres -U postgres -d property_mgmt

# Run SQL file
psql -h postgres -U postgres -d property_mgmt -f script.sql
```

### Port Forwarding

Ports are automatically forwarded:
- Backend: http://localhost:5000
- Frontend: http://localhost:5173
- PostgreSQL: localhost:5432
- Redis: localhost:6379
- MinIO: http://localhost:9000
- Adminer: http://localhost:8080

Access from your host machine browser!

## 🔍 Troubleshooting

### Container won't start

```bash
# Rebuild without cache
# In VS Code: F1 → "Dev Containers: Rebuild Container Without Cache"
```

### Services not responding

```bash
# Check status
./scripts/status.sh

# View logs
./scripts/logs.sh

# Restart
./scripts/stop-all.sh
./scripts/start-money-flows.sh
```

### Port already in use

```bash
# Find what's using the port
lsof -i :5432  # PostgreSQL
lsof -i :6379  # Redis

# Kill the process
kill -9 <PID>
```

### Database connection refused

```bash
# Check if PostgreSQL is running
./scripts/status.sh

# Check logs
./scripts/logs.sh postgres

# Restart PostgreSQL
docker-compose -f .devcontainer/docker-compose.yml restart postgres
```

### Out of disk space

```bash
# Clean up Docker
docker system prune -a --volumes

# Or use the cleanup script (deletes all data!)
./scripts/cleanup.sh
```

## 📚 Next Steps

1. **Set up GitHub integration:**
   ```bash
   gh auth login
   ```

2. **Create repositories:**
   - Follow `PHASE_1.5_QUICK_REFERENCE.md` in money-flows project

3. **Start building:**
   - Open `workspaces/money-flows.code-workspace`
   - Start coding!

## 🆘 Need Help?

- Check infrastructure status: `./scripts/status.sh`
- View logs: `./scripts/logs.sh [service]`
- Restart everything: `./scripts/stop-all.sh && ./scripts/start-money-flows.sh`
- Fresh start: `./scripts/cleanup.sh`

## 📖 Related Documentation

- Money Flows Backend: `../money-flows/backend/README.md`
- Money Flows Frontend: `../money-flows/frontend/README.md`
- Phase 1.5 Guide: `../money-flows/files/PHASE_1.5_QUICK_REFERENCE.md`

---

**Welcome to your AI Codespace!** 🚀

This is your development headquarters. All your projects, all your tools, one environment.
