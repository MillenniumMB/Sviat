function log {
  if [[ -n $1 ]] && ! [[ "$1" = "interactive" ]]
    then echo -e "\033[31mincorrect number of arguments\033[0m" >&2
    exit -3
  elif ! [[ -r "/var/log/anaconda/X.log" ]]
    then
      echo -e "\033[31mYou will not be able to open this diretoria $1\033[0m" >&2
      if [[ "$1" = "interactive" ]]
        then return -2
      else
        exit -2
      fi
  fi   
  while read line
    do
    if [[ "$line" = *"(WW)"* && "$line" != *"(WW) warning, (EE) error, (NI) not implemented, (??) unknown."* ]]
    then echo -e "${line//"(WW)"/"\033[33mWarning:\033[0m"}"
    fi
  done < "/var/log/anaconda/X.log"
  while read line
  do
    if [[ "$line" = *"(II)"* && "$line" != *"(++) from command line, (!!) notice, (II) informational,"* ]]
    then echo -e "${line//"(II)"/"\033[94mInformation:\033[0m"}"
    fi
  done < "/var/log/anaconda/X.log"
}
