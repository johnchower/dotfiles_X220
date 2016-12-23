sudo find . -type l -ls | grep dotfiles | grep '>' | awk '{$1=$2=$3=$4=$5=$6=$7=$8=$9=$10=""; print $0}' > ~/dotfiles_X220/link_targets
