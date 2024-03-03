# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Call .zsh_aliases
if [ -e $HOME/.zsh_aliases ]; then
    source $HOME/.zsh_aliases
fi

# /usr/local/bin
export PATH=/usr/local/bin:$PATH

# default editor neovim
export EDITOR="nvim"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# thefuck
eval $(thefuck --alias)

# source fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv put this here
eval "$(pyenv init -)"
PATH=$(pyenv root)/shims:$PATH
eval "$(pyenv virtualenv-init -)"

# tdo notes configuration
export NOTES_DIR="/Users/barrettpoth/Library/Mobile Documents/com~apple~CloudDocs/notes"

# User additions to path
export PATH="$PATH:/Applications/Insomnia.app/Contents/MacOS/"  # add insomnia (open new insomnia window)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin/"  # add visual studio code
export PATH="$PATH:/usr/local/opt/mysql@5.6/bin"  # add mysql
export PATH="$PATH:$HOME/Developer/"  # add things in Develeper directory
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"  # add things in Develeper directory
export PATH="$PATH:/Users/barrettpoth/Library/Application Support/JetBrains/Toolbox/scripts"
export PATH="$PATH:/Users/barrettpoth/.ebcli-virtual-env/executables"

# rust
. "$HOME/.cargo/env"

# Turn on oh-my-zsh
if [ -f ~/.zshrc.oh-my-zsh ]; then
    . ~/.zshrc.oh-my-zsh
fi

# load zsh completions (must load oh-my-zsh first)
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
autoload -Uz compinit
compinit
source $(brew --prefix)/etc/bash_completion.d/az

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# load zsh completions
fpath+=~/.zfunc
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

# setup direnv
eval "$(direnv hook zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GITSTATUS_LOG_LEVEL=DEBUG
export PATH="$HOME/.local/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
