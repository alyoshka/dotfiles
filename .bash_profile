# Charset global fixes
export LANG="UTF-8"
export LESSCHARSET=utf-8

source ~/Work/src/github.com/phacility/arcanist/resources/shell/bash-completion

# Git completion and prompt plugins:
# https://github.com/git/git/tree/master/contrib/completion
source ~/.git-completion.bash
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1

# Aliases
alias ll='ls -la'
alias lint='golint ./... | grep -v vendor'

# land changes and open corresponding task in browser
LAND() {
    arc land $1
    open https://topsteam.atlassian.net/browse/$1
}
alias land=LAND

# Prompt colors
FG_BLACK='\[\e[0;30m\]'
FG_RED='\[\e[0;31m\]'
FG_GREEN='\[\e[0;32m\]'
FG_YELLOW='\[\e[0;33m\]'
FG_BLUE='\[\e[0;34m\]'
FG_MAGENTA='\[\e[0;35m\]'
FG_CYAN='\[\e[0;36m\]'
FG_WHITE='\[\e[0;37m\]'
FG_DEFAULT='\[\e[0;39m\]'

BG_BLACK='\[\e[40m\]'
BG_RED='\[\e[41m\]'
BG_GREEN='\[\e[42m\]'
BG_YELLOW='\[\e[43m\]'
BG_BLUE='\[\e[44m\]'
BG_MAGENTA='\[\e[45m\]'
BG_CYAN='\[\e[46m\]'
BG_WHITE='\[\e[47m\]'
BG_DEFAULT='\[\e[49m\]'

RESET='\[\e[0m\]'

# Special symbols
# Requires Menlo for Powerline font:
# https://github.com/abertsch/Menlo-for-Powerline
SYM_BRANCH=''
SYM_SEPARATOR=''

# Prompt line generation
generate_prompt() {
    # Current directory
    dir_part=$FG_BLACK$BG_BLUE' \w '

    # Git repo
    GIT_PROMPT=$(__git_ps1 ' %s')
    if [[ -n $GIT_PROMPT ]]; then
        git_part=$FG_BLUE$BG_YELLOW$SYM_SEPARATOR$FG_BLACK$BG_YELLOW' '$SYM_BRANCH$GIT_PROMPT' '
    else
        git_part=''
    fi

    # Ending
    if [[ -n $GIT_PROMPT ]]; then
        end_part=$FG_YELLOW$BG_DEFAULT$SYM_SEPARATOR$RESET' '
    else
        end_part=$FG_BLUE$BG_DEFAULT$SYM_SEPARATOR$RESET' '
    fi

    PS1=$dir_part$git_part$end_part
}
PROMPT_COMMAND=generate_prompt
export GOPATH=$HOME/Work
export PATH=$PATH:$HOME/Work/src/github.com/phacility/arcanist/bin
export PATH=$PATH:$GOPATH/bin
