function reverse {
  if [[ -z $1 || -z $2 || -n $3 ]] && ! [[ "$3" = "interactive" ]]
    then echo -e "\033[31mIncorrect number of arguments\033[0m" >&2
    exit 1
  elif ! [[ -r $1 || -r $2 ]]
    then echo -e "\033[31mYou can't use this file\033[0m" >&2
    if [[ "$3" = "interactive" ]]
        then return -2
    else
        exit -2
    fi
  elif [[ -d $1 || -d $2 ]]
    then echo -e "\033[31mError:it is directory\033[0m" >&2
       if [[ "$3" = "interactive" ]]
        then return -2
        
    else
        exit -2
    fi
  fi
  
  if [[ -f $2 ]] && ! [[ -w $2 ]] ; then
      echo -e "\033[31mYou haven't access to outfile\033[0m" >&2
      if [[ "$3" = "interactive" ]]
        then return -2
    else
        exit -2
    fi
    fi
 if ! ( >> $2) 2>/dev/null ; then
      echo -e "\033[31mYou haven't access to directory of outfile\033[0m" >&2
       if [[ "$3" = "interactive" ]]
        then return -2
    else
        exit -2
    fi
    fi
    
  if ! [[ -f $1 ]]
    then echo -e "\033[31mFile not found\033[0m" >&2
     if [[ "$3" = "interactive" ]]
        then return -2
    else
        exit -2
    fi 
  fi
  if ! [[ -f $2 ]]
    then touch $2
  fi
  tac $1 > buffer.txt
        echo > $2
        rev buffer.txt > $2
        rm buffer.txt
}
