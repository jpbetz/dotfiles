[ -f ${HOME}/.Xmodmap ] && xmodmap ${HOME}/.Xmodmap

cat ${HOME}/.config/i3-base/config > ${HOME}/.config/i3/config
[ -f ${HOME}/.config/i3/config-local ] ${HOME}/.config/i3/config-local >> ${HOME}/.config/i3/config
