#!/bin/bash

echo "🚀 Setting up AI Codespace..."

# Fix SSH permissions
if [ -d "/home/vscode/.ssh" ]; then
    chmod 700 /home/vscode/.ssh
    chmod 600 /home/vscode/.ssh/* 2>/dev/null || true
    echo "✅ SSH permissions configured"
fi

# Verify GitHub CLI is available
if command -v gh &> /dev/null; then
    echo "✅ GitHub CLI is available"
    gh --version
else
    echo "⚠️  GitHub CLI not found"
fi

# Verify Docker is available
if command -v docker &> /dev/null; then
    echo "✅ Docker is available"
    docker --version
else
    echo "⚠️  Docker not found"
fi

# Verify .NET is available
if command -v dotnet &> /dev/null; then
    echo "✅ .NET SDK is available"
    dotnet --version
else
    echo "⚠️  .NET SDK not found"
fi

# Install global npm packages (if needed)
if command -v npm &> /dev/null; then
    echo "📦 Installing global npm packages..."
    npm install -g pnpm
    echo "✅ npm packages installed"
fi

# Wait for infrastructure services to be ready
echo "⏳ Waiting for infrastructure services..."
sleep 5

# Check PostgreSQL
if command -v pg_isready &> /dev/null; then
    until pg_isready -h postgres -p 5432 -U postgres; do
        echo "  Waiting for PostgreSQL..."
        sleep 2
    done
    echo "✅ PostgreSQL is ready"
fi

# Check Redis
if command -v redis-cli &> /dev/null; then
    until redis-cli -h redis ping; do
        echo "  Waiting for Redis..."
        sleep 2
    done
    echo "✅ Redis is ready"
fi

echo ""
echo "🎉 AI Codespace is ready!"
echo ""
echo "Available services:"
echo "  - PostgreSQL: postgres:5432 (user: postgres, password: postgres)"
echo "  - Redis: redis:6379"
echo "  - MinIO: minio:9000 (console: http://localhost:9001)"
echo "  - Adminer: http://localhost:8080"
echo ""
echo "Next steps:"
echo "  1. Open a workspace: File → Open Workspace from File"
echo "  2. Choose: workspaces/money-flows.code-workspace"
echo "  3. Start your services!"
echo ""
