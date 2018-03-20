# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH



# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes fzf and ripgrep bin if it exists
if [ -d "$HOME/.fzf/bin" ] ; then
    PATH="$HOME/.fzf/bin:$PATH"
fi

# Stops config if this terminal is non-interactive
[[ -z "$PS1" ]] && return

# Default editor
export EDITOR=vim

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Report CPU usage for commands running longer than 45 seconds
REPORTTIME=45

# CHECK DEPENDENCIES BLOCK

command -v wget >/dev/null 2>&1 || { echo "I require wget but it's not installed." >&2; }
command -v curl >/dev/null 2>&1 || { echo "I require curl but it's not installed." >&2; }
command -v git >/dev/null 2>&1 || { echo "I require git but it's not installed." >&2; }

# FILE SOURCING BLOCK

# personal config file with aliases
[[ -f ~/.zsh_aliases ]] && . ~/.zsh_aliases

# Check for antigen and install if not
if [ ! -f "$HOME/antigen.zsh" ] 
then
    echo "Antigen not installed. Pulling." 
    curl -L git.io/antigen > $HOME/antigen.zsh
fi

# Source antigenrc
[[ -f ~/.antigenrc ]] && . ~/.antigenrc

# fzf completions
[[ -f ~/.fzf.zsh ]] && . ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
vim_fzf () { vim $(fzf); }

# Configure zsh prompt. Listed last to override antigen theme settings
#PROMPT="> "
RPROMT=" "
