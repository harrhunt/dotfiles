if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ALIASES
alias ls="lsd"
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

if type -q nvim
    alias vim="nvim"
end
alias v="vim ."

function starship_transient_prompt_func
  starship module character
end
function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience
