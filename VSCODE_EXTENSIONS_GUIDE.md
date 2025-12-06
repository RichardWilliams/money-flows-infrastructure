# VS Code Extensions Guide

Your codespace comes with powerful extensions for managing PostgreSQL, Redis, and Nginx directly from VS Code!

## 🗄️ PostgreSQL Extensions

### 1. SQLTools + PostgreSQL Driver

**What it does**: Full-featured database client inside VS Code

**Pre-configured connections:**
- ✅ **PostgreSQL - Money Flows** → `property_mgmt` database
- ✅ **PostgreSQL - Main DB** → `postgres` database

#### How to Use:

1. **Open SQLTools sidebar:**
   - Click the database icon in the left sidebar
   - Or press `Ctrl+Alt+D` (Windows/Linux) / `Cmd+Alt+D` (Mac)

2. **Connect to database:**
   - Expand "PostgreSQL - Money Flows"
   - Click "Connect"
   - See all tables, views, schemas

3. **Run queries:**
   - Right-click connection → "New SQL File"
   - Write your SQL
   - Press `Ctrl+E Ctrl+E` to execute
   ```sql
   SELECT * FROM property_management.properties LIMIT 10;
   ```

4. **Browse tables:**
   - Expand database → schemas → tables
   - Right-click table → "Show Table Records"
   - View data in a grid

5. **Export results:**
   - Run query
   - Click export icon
   - Choose CSV, JSON, or copy to clipboard

#### Features:
- ✅ Syntax highlighting
- ✅ Auto-completion
- ✅ Query history
- ✅ Table browser
- ✅ Export results
- ✅ Multiple connections

### 2. PostgreSQL Explorer

**What it does**: Visual database explorer with advanced features

#### How to Use:

1. **Open PostgreSQL sidebar:**
   - Look for PostgreSQL icon in left sidebar

2. **Add connection:**
   - Click "+" icon
   - Host: `postgres`
   - Port: `5432`
   - User: `postgres`
   - Password: `postgres`
   - Database: `property_mgmt`

3. **Browse visually:**
   - Expand trees
   - View table structure
   - See column types
   - View indexes

#### Features:
- ✅ Tree view of database objects
- ✅ DDL preview
- ✅ Function editing
- ✅ Query runner

---

## 🔴 Redis Extension

### Redis Client (Dunn.redis)

**What it does**: Browse and manage Redis data directly in VS Code

**Pre-configured:**
- ✅ Host: `redis`
- ✅ Port: `6379`
- ✅ Database: 0

#### How to Use:

1. **Open Redis sidebar:**
   - Click Redis icon in left sidebar
   - Or press `Ctrl+Alt+R`

2. **Connect:**
   - Connection auto-configured
   - Click "Connect to Redis"

3. **Browse keys:**
   - See all keys in tree view
   - Grouped by pattern (`:` separator)
   - Click to view value

4. **Common operations:**
   ```bash
   # Set a key
   Right-click → "Set Key"
   Key: user:123
   Value: {"name": "John"}

   # Get a key
   Click on key → view in editor

   # Delete a key
   Right-click → "Delete Key"
   ```

5. **Execute commands:**
   - Right-click connection → "New Redis Console"
   - Type Redis commands:
   ```redis
   SET mykey "Hello World"
   GET mykey
   KEYS *
   INCR counter
   HSET user:1 name "John" email "john@example.com"
   ```

#### Features:
- ✅ Browse all keys
- ✅ View key values
- ✅ Set/update/delete keys
- ✅ Execute Redis commands
- ✅ Monitor commands
- ✅ Pub/Sub support

#### Common Use Cases:

**Cache debugging:**
```redis
# See what's cached
KEYS cache:*

# Check TTL
TTL cache:user:123

# Flush cache
FLUSHDB
```

**Session management:**
```redis
# View sessions
KEYS session:*

# Get session data
GET session:abc123

# Delete session
DEL session:abc123
```

---

## 🌐 Nginx Extensions

### 1. Nginx Formatter

**What it does**: Auto-format Nginx configuration files

#### How to Use:

1. **Open Nginx config:**
   - Open any `.conf` file
   - Language mode auto-detects as "nginx"

2. **Format on save:**
   - Already enabled in settings
   - Just save the file (`Ctrl+S`)
   - Auto-formatted!

3. **Manual format:**
   - Right-click → "Format Document"
   - Or press `Shift+Alt+F`

#### Example:
```nginx
# Before (messy)
server{listen 80;server_name example.com;location /{proxy_pass http://backend;}}

# After (formatted)
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend;
    }
}
```

### 2. Nginx Language Support

**What it does**: Syntax highlighting, snippets, and validation

#### Features:
- ✅ Syntax highlighting
- ✅ Auto-completion for directives
- ✅ Code snippets
- ✅ Hover documentation
- ✅ Go to definition

#### Snippets:

Type these prefixes and press `Tab`:

```nginx
# Type: server
server {
    listen 80;
    server_name example.com;

    location / {
        # cursor here
    }
}

# Type: location
location / {
    # cursor here
}

# Type: proxy
proxy_pass http://backend;
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
```

---

## 🐳 Docker Extension

**What it does**: Manage all your Docker containers, images, networks

#### How to Use:

1. **Open Docker sidebar:**
   - Click Docker whale icon
   - See all containers, images, networks

2. **View running services:**
   - Containers → See postgres, redis, minio, etc.
   - Right-click container:
     - View logs
     - Attach shell
     - Inspect
     - Stop/Start

3. **View container logs:**
   - Right-click container → "View Logs"
   - See real-time output
   - Filter by text

4. **Attach to container:**
   - Right-click container → "Attach Shell"
   - Get bash terminal inside container
   ```bash
   # Example: Inside postgres container
   psql -U postgres -d property_mgmt
   ```

5. **Compose integration:**
   - Right-click `docker-compose.yml`
   - "Compose Up" - Start all services
   - "Compose Down" - Stop all services
   - "Compose Restart" - Restart services

---

## 🎯 Quick Reference

### PostgreSQL
- **Connect**: SQLTools sidebar → Click connection
- **Query**: Right-click → "New SQL File" → `Ctrl+E Ctrl+E`
- **Browse**: Expand connection → schemas → tables

### Redis
- **Connect**: Redis sidebar → "Connect to Redis"
- **Browse**: Expand to see keys
- **Console**: Right-click → "New Redis Console"

### Nginx
- **Format**: Open `.conf` → `Shift+Alt+F`
- **Snippets**: Type prefix → `Tab`

### Docker
- **View**: Docker sidebar → Containers
- **Logs**: Right-click → "View Logs"
- **Shell**: Right-click → "Attach Shell"

---

## 💡 Pro Tips

### 1. Multiple Database Queries

Open multiple SQL files side-by-side:
```bash
# File 1: queries.sql
SELECT * FROM properties;

# File 2: analytics.sql
SELECT COUNT(*) FROM money_flows;

# Execute independently with Ctrl+E Ctrl+E
```

### 2. Redis Pattern Matching

```redis
# Find all cache keys
KEYS cache:*

# Find user sessions
KEYS session:*

# Find by pattern
KEYS user:*:profile
```

### 3. Nginx Config Testing

Before saving to production:
```nginx
# Test in development
# Make changes → Save → Format
# Check syntax highlighting for errors
```

### 4. Docker Quick Actions

- **Stop service**: Docker sidebar → Right-click → Stop
- **Restart service**: Right-click → Restart
- **View logs**: Right-click → View Logs
- **Terminal in container**: Right-click → Attach Shell

### 5. SQLTools Keyboard Shortcuts

- `Ctrl+E Ctrl+E` - Execute query
- `Ctrl+E Ctrl+H` - Show query history
- `Ctrl+E Ctrl+B` - Bookmark query
- `Ctrl+Alt+D` - Open SQLTools

---

## 🔧 Customization

### Add More Database Connections

Edit `.devcontainer/devcontainer.json`:

```json
"sqltools.connections": [
  {
    "name": "My New Database",
    "driver": "PostgreSQL",
    "server": "postgres",
    "port": 5432,
    "database": "my_database",
    "username": "postgres",
    "password": "postgres"
  }
]
```

### Change Redis Connection

```json
"redis.host": "redis",
"redis.port": 6379,
"redis.db": 0,
"redis.password": ""  // Add if needed
```

---

## 🆘 Troubleshooting

### PostgreSQL connection fails
```bash
# Check PostgreSQL is running
./scripts/status.sh

# Test connection from terminal
psql -h postgres -U postgres -d property_mgmt
```

### Redis connection fails
```bash
# Check Redis is running
redis-cli -h redis ping

# Should return: PONG
```

### Extensions not loading
```bash
# Rebuild container
# F1 → "Dev Containers: Rebuild Container"
```

---

## 📚 Extension Documentation

- **SQLTools**: https://vscode-sqltools.mteixeira.dev/
- **PostgreSQL**: https://marketplace.visualstudio.com/items?itemName=ckolkman.vscode-postgres
- **Redis**: https://marketplace.visualstudio.com/items?itemName=Dunn.redis
- **Nginx**: https://marketplace.visualstudio.com/items?itemName=william-voron.vscode-nginx
- **Docker**: https://code.visualstudio.com/docs/containers/overview

---

**Your codespace is now a complete infrastructure management center!** 🚀
