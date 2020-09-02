#PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u@\h\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]"

NEWLINE=$'\n'
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

local RED="%{$fg_bold[red]%}"
local GREEN="%{$fg_bold[green]%}"
local WHITE="%{$fg_bold[white]%}"

PROMPT='${GREEN}(${WHITE}%n@%m${GREEN}%)\
${GREEN}-\
${GREEN}(${WHITE}${PWD/#$HOME/~}${GREEN}%)\
$(git_prompt_info)${NEWLINE}\
${ret_status} %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="${GREEN}-(${WHITE}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${GREEN})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="${RED} ✗"
ZSH_THEME_GIT_PROMPT_CLEAN="${GREEN} ✔"
