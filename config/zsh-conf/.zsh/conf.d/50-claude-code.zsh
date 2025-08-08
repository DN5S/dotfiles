# Claude Code configuration

# Add Claude Code to PATH if installed
if command -v claude-code &> /dev/null; then
    export CLAUDE_CODE_INSTALLED=true
fi

# Claude Code aliases
alias cc='claude-code'
alias ccc='claude-code chat'
alias ccs='claude-code status'
alias cch='claude-code help'
alias ccm='claude-code mcp'
alias ccml='claude-code mcp list'

# ccusage aliases (third-party cost tracker) - using offline mode to avoid LiteLLM warnings
alias ccusage='ccusage --offline'
alias ccud='ccusage daily --mode auto --offline'
alias ccum='ccusage monthly --mode auto --offline'
alias ccuw='ccusage weekly --mode auto --offline'

# MCP Server environment variables (optional - set these if you use the services)
# export GITHUB_TOKEN="your-github-personal-access-token"
# export POSTGRES_CONNECTION_STRING="postgresql://user:password@localhost:5432/dbname"
# export BRAVE_API_KEY="your-brave-search-api-key"

# Claude Code completion (if available)
if [[ -n "$CLAUDE_CODE_INSTALLED" ]] && command -v claude-code &> /dev/null; then
    eval "$(claude-code completions zsh 2>/dev/null || true)"
fi