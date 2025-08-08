#!/bin/bash

# MCP Server Setup Script for Claude Code
# This script configures MCP servers for development

set -e

echo "Setting up MCP servers for Claude Code..."

# Check if Claude Code is installed
if ! command -v claude-code &> /dev/null; then
    echo "Error: Claude Code is not installed. Please install it first with:"
    echo "npm install -g @anthropic-ai/claude-code"
    exit 1
fi

# Create Claude config directory if it doesn't exist
CLAUDE_CONFIG_DIR="$HOME/.config/claude"
mkdir -p "$CLAUDE_CONFIG_DIR"

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy MCP servers configuration
echo "Copying MCP servers configuration..."
cp "$SCRIPT_DIR/mcp-servers.json" "$CLAUDE_CONFIG_DIR/claude_code_config.json"

echo ""
echo "MCP servers have been configured! The following servers are available:"
echo ""
echo "Core Development Servers (already configured):"
echo "  • filesystem - Access to local file system"
echo "  • git - Git repository operations"
echo "  • github - GitHub API integration (requires GITHUB_TOKEN env var)"
echo "  • memory - Persistent memory across sessions"
echo "  • fetch - HTTP requests and web scraping"
echo ""
echo "Database Servers (already configured):"
echo "  • postgres - PostgreSQL database access (requires POSTGRES_CONNECTION_STRING)"
echo "  • sqlite - SQLite database access"
echo ""
echo "Additional Tools (already configured):"
echo "  • brave-search - Web search capabilities (requires BRAVE_API_KEY)"
echo "  • puppeteer - Browser automation and testing"
echo "  • docker - Docker container management"
echo ""
echo "To add environment variables for services that require them:"
echo "  1. GitHub: export GITHUB_TOKEN='your-github-token'"
echo "  2. PostgreSQL: export POSTGRES_CONNECTION_STRING='your-connection-string'"
echo "  3. Brave Search: export BRAVE_API_KEY='your-brave-api-key'"
echo ""
echo "You can also add these services with Claude Code CLI:"
echo "  • Sentry: claude mcp add --transport http sentry https://mcp.sentry.dev/mcp"
echo "  • Linear: claude mcp add --transport sse linear https://mcp.linear.app/sse"
echo "  • Notion: claude mcp add --transport http notion https://mcp.notion.com/mcp"
echo ""
echo "To verify MCP servers are working, run: claude-code mcp list"
echo ""