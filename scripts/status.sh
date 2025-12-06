#!/bin/bash

# Show status of all infrastructure services

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODESPACE_DIR="$(dirname "$SCRIPT_DIR")"

echo "📊 Infrastructure Status"
echo "======================="
echo ""

cd "$CODESPACE_DIR"

# Show running containers
echo "🐳 Running Containers:"
docker-compose -f .devcontainer/docker-compose.yml ps

echo ""
echo "💾 Volumes:"
docker volume ls | grep codespace || echo "No codespace volumes found"

echo ""
echo "🌐 Network:"
docker network ls | grep codespace || echo "No codespace network found"

echo ""
echo "📡 Service Health:"

# Check PostgreSQL
if docker-compose -f .devcontainer/docker-compose.yml exec -T postgres pg_isready -U postgres > /dev/null 2>&1; then
    echo "  ✅ PostgreSQL: Healthy"
else
    echo "  ❌ PostgreSQL: Not available"
fi

# Check Redis
if docker-compose -f .devcontainer/docker-compose.yml exec -T redis redis-cli ping > /dev/null 2>&1; then
    echo "  ✅ Redis: Healthy"
else
    echo "  ❌ Redis: Not available"
fi

# Check MinIO
if docker-compose -f .devcontainer/docker-compose.yml exec -T minio curl -f http://localhost:9000/minio/health/live > /dev/null 2>&1; then
    echo "  ✅ MinIO: Healthy"
else
    echo "  ❌ MinIO: Not available"
fi

echo ""
