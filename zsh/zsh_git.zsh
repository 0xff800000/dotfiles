# Git log override pretty graph
git() {
    if [[ $@ == "log" ]]; then
        command git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
    else
        command git "$@"
    fi
}

git_get_branch() {
    [ -d .git/ ] && echo $(git branch | cut -b3-)
}

git_get_change() {
    local ret=""
    git status | wc | read -rA b
    if [[ $b != "2" ]]; then
        ret="*"
    fi
    echo $ret
}

git_str() {
    echo "$(git_get_branch)$(git_get_change)"
}
