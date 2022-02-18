while true; do
  read -p "the file size of perf.data is larger than 1G, it will take too long to decode, do you want to Y: continue or N: resample a smaller one? " user_input
  case $user_input in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer Y or N";;
  esac
done
