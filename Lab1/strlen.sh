function strlen {
  if [ "$1" = "strlen" ] && [ "$2" != "interactive" ]
    then  VAR="$2"
  elif [ "$2" = "interactive" ]
    then VAR="$1"
  fi 
  size=${#VAR}
  echo -e "Len: $size"
}
