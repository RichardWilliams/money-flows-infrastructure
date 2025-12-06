#!/bin/bash

# Start Money Flows services

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODESPACE_DIR="$(dirname "$SCRIPT_DIR")"

echo "🚀 Starting Money Flows Services..."
echo ""

# Start infrastructure if not running
echo "📦 Starting infrastructure services..."
cd "$CODESPACE_DIR"
docker-compose -f .devcontainer/docker-compose.yml up -d postgres redis minio

# Wait for services
echo "⏳ Waiting for services to be ready..."
sleep 5

# Check PostgreSQL
echo "  ✓ Checking PostgreSQL..."
until docker-compose -f .devcontainer/docker-compose.yml exec -T postgres pg_isready -U postgres > /dev/null 2>&1; do
    echo "    Waiting for PostgreSQL..."
    sleep 2
done
echo "  ✅ PostgreSQL is ready"

# Check Redis
echo "  ✓ Checking Redis..."
until docker-compose -f .devcontainer/docker-compose.yml exec -T redis redis-cli ping > /dev/null 2>&1; do
    echo "    Waiting for Redis..."
    sleep 2
done
echo "  ✅ Redis is ready"

echo ""
echo "🎉 Infrastructure services are running!"
echo ""
echo "Available services:"
echo "  - PostgreSQL: localhost:5432 (user: postgres, password: postgres)"
echo "  - Redis: localhost:6379"
echo "  - MinIO: http://localhost:9000 (console: http://localhost:9001)"
echo "  - Adminer: http://localhost:8080"
echo ""
echo "Next steps:"
echo "  1. Open workspace: File → Open Workspace → workspaces/money-flows.code-workspace"
echo "  2. Start backend: cd money-flows/backend && dotnet run --project src/Api"
echo "  3. Start frontend: cd money-flows/frontend && npm run dev"
echo ""
echo "Or use the compound launcher: 'Money Flows (Full Stack)'"
echo ""
