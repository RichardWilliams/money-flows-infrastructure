# VS Code Extensions - Quick Reference 🚀

## 📊 What's Installed

| Extension | Purpose | Access |
|-----------|---------|--------|
| **SQLTools + PostgreSQL** | Database client | Database icon in sidebar |
| **PostgreSQL Explorer** | Visual DB browser | PostgreSQL icon in sidebar |
| **Redis Client** | Redis management | Redis icon in sidebar |
| **Nginx Formatter** | Format configs | Auto on save |
| **Nginx Language** | Syntax & snippets | Auto for `.conf` files |
| **Docker** | Container management | Docker icon in sidebar |

---

## 🗄️ PostgreSQL

### Quick Actions

```bash
# Open SQLTools
Click database icon OR Ctrl+Alt+D

# Run query
Ctrl+E Ctrl+E

# New query
Right-click connection → "New SQL File"
```

### Pre-configured Connections
✅ **PostgreSQL - Money Flows** → `property_mgmt`
✅ **PostgreSQL - Main DB** → `postgres`

---

## 🔴 Redis

### Quick Actions

```bash
# Open Redis client
Click Redis icon OR Ctrl+Alt+R

# Browse keys
Expand connection → See all keys

# Execute command
Right-click → "New Redis Console"
```

### Common Commands
```redis
KEYS *              # List all keys
GET mykey           # Get value
SET mykey "value"   # Set value
DEL mykey           # Delete key
FLUSHDB            # Clear database
```

---

## 🌐 Nginx

### Quick Actions

```bash
# Format config
Shift+Alt+F

# Use snippets
Type: server [Tab]
Type: location [Tab]
Type: proxy [Tab]
```

### Config Location
`/Users/iwanwilliams/AI/codespace/infrastructure/nginx/nginx.conf`

---

## 🐳 Docker

### Quick Actions

```bash
# View containers
Click Docker icon

# View logs
Right-click container → "View Logs"

# Attach shell
Right-click → "Attach Shell"

# Compose
Right-click docker-compose.yml → "Compose Up/Down"
```

---

## ⌨️ Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| SQLTools | `Ctrl+Alt+D` |
| Execute Query | `Ctrl+E Ctrl+E` |
| Query History | `Ctrl+E Ctrl+H` |
| Format Document | `Shift+Alt+F` |
| Command Palette | `F1` |

---

## 🔗 Need More Details?

See [VSCODE_EXTENSIONS_GUIDE.md](VSCODE_EXTENSIONS_GUIDE.md) for comprehensive documentation!
