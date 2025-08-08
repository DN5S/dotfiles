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

# ccusage aliases (third-party cost tracker) - using offline mode to avoid LiteLLM warnings
alias ccusage='ccusage --offline'
alias ccud='ccusage daily --mode auto --offline'
alias ccum='ccusage monthly --mode auto --offline'
alias ccuw='ccusage weekly --mode auto --offline'

# Claude Code completion (if available)
if [[ -n "$CLAUDE_CODE_INSTALLED" ]] && command -v claude-code &> /dev/null; then
    eval "$(claude-code completions zsh 2>/dev/null || true)"
fi