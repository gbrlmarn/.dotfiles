# .zshrc
# Mainly for MacOS

# Set vim mode
set -o vi

# Completion
autoload -U compinit
compinit -D

# Defaults
EDITOR='vi'

# Options
force_color_prompt=yes

# Paths
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/scripts"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.dotnet/tools"

# GNU
# GNU gsed in favor of BSD sed needs to be installed in order for emacs man command to work
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# Guile
export GUILE_LOAD_PATH="/opt/homebrew/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/opt/homebrew/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/opt/homebrew/lib/guile/3.0/extensions"

# Env Vars
export DOTNET_ROOT="/opt/homebrew/Cellar/dotnet/9.0.3/libexec"
# export DOTNET_ROOT="/opt/homebrew/Cellar/dotnet@8/8.0.14_1/libexec"

# Openjdk
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"


# Aliases
alias nom="nom --config-path=$HOME/.config/nom/config.yml"

# Binds
bindkey -s ^f "tmux-sessionizer\n"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
