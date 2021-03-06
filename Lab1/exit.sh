function exit_ {
re='^[+-]?[0-9]+$'
if [[ $1 -gt 255 ]] || [[ $1 -lt -255 ]]
then
  echo -e "\033[31mExit number must be in (-255, 255)\033[0m" >&2
  exit -3
fi
if [[ -z $1 || "$1" = "interactive" ]]
  then
    echo "exit 0"
    exit 0
elif [[ -n $2 ]] && ! [[ "$2" = "interactive" ]]
  then
    echo -e "\033[31mincorrect number of arguments\033[0m" >&2
    exit -3
elif ! [[ $1 =~ $re ]]
  then
   echo -e "\033[31merror: Not a number\033[0m" >&2
   if [[ "$2" = "interactive" ]]
        then return -4
    else
        exit -4
    fi
else
  echo "exit $1"
  exit $1
fi
}
