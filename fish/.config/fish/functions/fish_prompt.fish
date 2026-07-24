# Two-line prompt: [host ]path <icon> branch [markers] / astronaut arrow.
function fish_prompt
    set -l last_status $status

    set -l normal (set_color normal)
    set -l cwd_color (set_color -o cyan)
    set -l host_color (set_color -o yellow)
    set -l git_color (set_color -o red)
    set -l git_icon \uf126

    set -l arrow_color (set_color -o green)
    if test $last_status -ne 0
        set arrow_color (set_color -o $fish_color_error)
    end

    # host only over SSH
    set -l host
    if set -q SSH_TTY; or set -q SSH_CONNECTION
        set host $host_color (prompt_hostname) $normal ' '
    end

    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # branch + markers computed separately (+, %, $ are legal in branch names)
    set -l git
    set -l branch (command git symbolic-ref --short HEAD 2>/dev/null)
    or set branch (command git rev-parse --short HEAD 2>/dev/null)
    if test -n "$branch"
        set -l marks
        command git diff --cached --quiet 2>/dev/null; or set -a marks '*'
        command git diff --quiet 2>/dev/null; or set -a marks '+'
        set -l untracked (command git ls-files --others --exclude-standard 2>/dev/null)
        test -n "$untracked[1]"; and set -a marks '%'
        command git rev-parse --verify --quiet refs/stash >/dev/null; and set -a marks '$'

        set -l markstr
        test -n "$marks"; and set markstr ' ['(string join '' $marks)']'
        set git ' ' $git_color $git_icon ' ' $branch $markstr $normal
    end

    echo -s $host $cwd_color (prompt_pwd) $normal $git
    echo -n -s $arrow_color '❯' ' ' $normal
end
