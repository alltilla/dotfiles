if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -gx CDPATH .:$HOME/repos:$HOME/repos/axosyslog/.claude/worktrees
set -gx LSAN_OPTIONS "suppressions=$HOME/repos/axosyslog/tests/axosyslog-lsan.supp"

# Feed the gh CLI token to the GitHub MCP server, which reads
# $GITHUB_PERSONAL_ACCESS_TOKEN. Re-read each shell so it tracks gh's rotation.
if command -q gh
    set -l _gh_tok (gh auth token 2>/dev/null)
    test -n "$_gh_tok"; and set -gx GITHUB_PERSONAL_ACCESS_TOKEN $_gh_tok
    set -e _gh_tok
end

# Created by `pipx` on 2024-10-28 14:38:39
set PATH $PATH $HOME/.local/bin

# Added by codebase-memory-mcp install
fish_add_path $HOME/.local/bin
