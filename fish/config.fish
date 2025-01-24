if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ALIASES
if type -q lsd
    alias ls="lsd"
    alias l='ls -l'
    alias la='ls -a'
    alias lla='ls -la'
    alias lt='ls --tree'
end

if type -q nvim
    alias vim="nvim"
end
if type -q vim
    alias v="vim ."
end


if type -q starship
    function starship_transient_prompt_func
      starship module character
    end
    function starship_transient_rprompt_func
      starship module time
    end
    starship init fish | source
    enable_transience
end

if type -q curl
    alias dl="curl -OJ"
end

if type -q nvm
    nvm use stable
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
