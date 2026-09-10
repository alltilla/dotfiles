function daily --description 'Run the Claude Code /daily standup summary'
    claude --permission-mode auto "/daily $argv"
end
