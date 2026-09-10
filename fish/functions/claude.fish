function claude --wraps claude \
    --description 'claude, launched so the ugrep grep shim is never installed (anthropics/claude-code#74143)'
    command claude --allowedTools Grep $argv
end
