#!/bin/bash
set -euo pipefail

# Assign default values if user does not provide parameters
high_default=${1:-80}
med_default=${2:-50}

printf "Colorize lines for disk usage \n"
printf "How to use: ./file_name.sh <high_value> <medium_value>. Order high to med is important for correct coloring. Example command: \n"
printf "./colorize_out.sh 90 60 \n\n"
printf "Default high color \033[1;31m red \033[0m is 80 and default medium color \033[1;33m yellow \033[0m is 50 \n"
printf "Current comparison values are: $high_default and $med_default \n\n"

df -h | awk -v high=$high_default -v med=$med_default '{
  usage = +substr($5, 1, length($5)-1);
  if (usage >= high) {
    printf "\033[1;31m%s\033[0m\n", $0;
  }
  else if (usage >= med) {
    printf "\033[1;33m%s\033[0m\n", $0; 
  }
  else { print; } 
}'
