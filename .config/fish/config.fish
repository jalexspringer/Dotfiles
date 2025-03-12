if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source

# Aliases
#

alias hx="helix"
alias dve="zellij -l welcome --config-dir ~/.config/yazelix/zellij options --layout-dir ~/.config/yazelix/zellij/layouts"

# Godot development environment
alias gde="zellij -l godot-helix-yazi --config-dir ~/.config/yazelix/zellij options --layout-dir ~/.config/yazelix/zellij/layouts"
alias bt="bluetui"
alias gde="godot-helix"

# taskwarrior
alias t=task
alias tui=taskwarrior-tui
alias tn='clear;task next'
alias ta='task add'
alias tan='task add scheduled:today'
alias tat='task add scheduled:tomorrow until:sch+14d'
alias tm='task modify'
alias trol="task sch:yes status:pending modify sch:tod"
alias td='clear;task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H; calcurse -r; timew | grep -v "no active time"'
alias tal='task add dep:"$(task +LATEST uuids)"'

set -gx EDITOR helix
set -gx VISUAL helix
