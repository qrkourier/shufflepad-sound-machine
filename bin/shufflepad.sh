#!/bin/bash -u

donames(){
  find -mindepth 1 -maxdepth 1 -type f -iname '*.mp3' | egrep '\s' | \
    while read pad;do 
      mv -v "$pad" $(sed -r 's/[-)(_ ]+//g'<<<"${pad#./}") 
    done
}

purgepad(){
  printf '\npurging ./pad/\n'
  rm -rf ./pad/; mkdir -p ./pad/
}

dopad(){
  printf '\npadding\n'
  find -mindepth 1 -maxdepth 1 -type f -iname '*.mp3' | \
    while read pad;do 
      echo $pad
      sox $pad ./pad/${pad#./} pad 0 $(($RANDOM%66));
    done
  
    printf 'padding produced %d files occupying %s\n' \
      $(ls -1 ./pad/|wc -l) "$(du -sh ./pad/)"
}

docat(){
  eval avconv -i concat:$(\
    ls ./pad/*.mp3|shuf|while read pad;do printf '%s\|' $pad;done|sed 's/\\|$//' \
  ) -c copy ./pad/out.mp3
}

read -sn1 -t9 -p 'ctrl-c to cancel: in 10s I will rename all files in pwd like\
(s/ /-/g)' DONAMES
[[ "$DONAMES" == "n" ]] || donames

read -sn1 -t9 -p "ctrl-c to cancel: in 10s I will purge ./pad/" PURGEPAD
[[ "$PURGEPAD" == "n" ]] || purgepad

read -sn1 -t9 -p "ctrl-c to cancel: in 10s I will assume all files in pwd are\
.mp3 and copy  each to the same in ./pad after padding each with a \
random amount silence averaging less than 60s" DOPAD
[[ "$DOPAD" == "n" ]] || dopad

read -sn1 -t9 -p "ctrl-c to cancel: in 10s this will proceed to cat all of the \
padded sounds together in ./pad/out.mp3" DOCAT
[[ "$DOCAT" == "n" ]] || docat
  
