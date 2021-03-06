#  
#                   ____  _           
#   _ __ ___  _   _| __ )(_)_ __ __ _ 
#  | '_ ` _ \| | | |  _ \| | '__/ _` |
#  | | | | | | |_| | |_) | | | | (_| |
#  |_| |_| |_|\__, |____/|_|_|  \__,_|
#             |___/                   
#  

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='#'
else
    #local user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
    local user_host='%{$terminfo[bold]$fg[green]%}%n %{$reset_color%}'
    local user_symbol='$'
fi

local current_dir='%{$terminfo[bold]$fg[green]%}%~ %{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)› %{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")› %{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

#PROMPT="╭─${venv_prompt}${user_host}${current_dir}${rvm_ruby}${git_branch}
PROMPT="╭─${venv_prompt}${current_dir}${rvm_ruby}${git_branch}%{$fg_bold[red]%}%*%{$reset_color%}
╰─%B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
