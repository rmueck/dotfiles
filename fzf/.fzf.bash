# Setup fzf
# ---------
if [[ ! "$PATH" == */home/${LOGNAME}/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/${LOGNAME}/.fzf/bin"
fi

eval "$(fzf --bash)"
