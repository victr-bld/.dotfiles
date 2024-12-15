export ZSH="$HOME/.oh-my-zsh"

# themes
ZSH_THEME="simple"

# plugins
plugins=(
    git
    zsh-autosuggestions
)

# sources
source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"

# aliases
alias f=fdfind
alias nv=nvim
