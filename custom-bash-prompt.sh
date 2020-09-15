#!/bin/bash

echo "https://github.com/freddieventura/custom-bash-prompt "
echo "This script will help you customize your prompt in bash"
echo "Choose among the options available for your environment"

continue=1
nonanswered=1
nonansweredinner=1



while [[ $nonanswered = 1 ]]
do
  if [[ $continue = 1 ]]
  then
    read -n 2 -p "Do you want to display a status variable in your prompt[Y/N] Exit [E]?" selection
    case "$selection" in
    y | Y) nonanswered=0
    echo "Select the Variable"
    echo "[A] \h Hostname"
    echo "[B] \t Current time in 24-hour format"
    echo "[C] \w Current Working Directory"
    echo "[D] \u Username of the current user"
    while [[ "$nonansweredinner" = 1 ]]
    do
      read -n 2 selection
        case "$selection" in
        a | A) stringa="\h"
          nonansweredinner=0;;
        b | B) stringa="\t"
          nonansweredinner=0;;
        c | C) stringa="\w"
          nonansweredinner=0;;
        d | D) stringa="\u"
          nonansweredinner=0;;
        *) echo "Please select a correct option";;
      esac
    done;;
    n | N) echo "You dont want to display a status variable in your prompt"
    nonanswered=0;;
    e | E) echo "Exiting"
    continue=0
    nonanswered=0;;
    *) echo "You selected the wrong option, Try again please";;
    esac
  else
    break
  fi
done

nonanswered=1
nonansweredinner=1

while [[ $nonanswered = 1 ]]
do
  if [[ $continue = 1 ]]
  then
    read -n 2 -p "Do you want to Colour up this string[Y/N] Exit [E]?" selection
    case "$selection" in
    y | Y) nonanswered=0   
    echo "Select the Color"
    echo "[A] Black"
    echo "[B] Red"
    echo "[C] Green"
    echo "[D] Yellow"
    echo "[E] Blue"
    echo "[F] Magenta"
    echo "[G] Cyan"
    echo "[H] Grey"
    echo "[I] Bright Black"
    echo "[J] Bright Red"
    echo "[K] Bright Green"
    echo "[L] Bright Yellow"
    echo "[M] Bright Blue"
    echo "[N] Bright Magenta"
    echo "[O] Bright Cyan"
    echo "[P] Bright White"
    while [[ "$nonansweredinner" = 1 ]]
    do
      read -n 2 selection 
        case "$selection" in
        a | A) colora="30m$colora" 
          nonansweredinner=0;;
        b | B) colora="31m$colora" 
          nonansweredinner=0;;
        c | C) colora="32m$colora" 
          nonansweredinner=0;;
        d | D) colora="33m$colora" 
          nonansweredinner=0;;
        e | E) colora="34m$colora" 
          nonansweredinner=0;;
        f | F) colora="35m$colora" 
          nonansweredinner=0;;
        g | G) colora="36m$colora" 
          nonansweredinner=0;;
        h | H) colora="37m$colora" 
          nonansweredinner=0;;
        i | I) colora="90m$colora" 
          nonansweredinner=0;;
        j | J) colora="91m$colora" 
          nonansweredinner=0;;
        k | K) colora="92m$colora" 
          nonansweredinner=0;;
        l | L) colora="93m$colora" 
          nonansweredinner=0;;
        m | M) colora="94m$colora" 
          nonansweredinner=0;;
        n | N) colora="95m$colora" 
          nonansweredinner=0;;
        o | O) colora="96m$colora" 
          nonansweredinner=0;;
        p | P) colora="97m$colora" 
          nonansweredinner=0;;
        *) echo "Please select a correct option";;
      esac
    done;;
    n | N) echo "You dont want to color up your string"
    nonanswered=0;;
    e | E) echo "Exiting"
    continue=0
    nonanswered=0;;
    *) echo "You selected the wrong option, Try again please";;
    esac
  else
    break
  fi
done

nonanswered=1
nonansweredinner=1

while [[ $nonanswered = 1 ]]
do
  if [[ $continue = 1 ]]
  then
    read -n 2 -p "Do you want to add an effect to the string[Y/N] Exit [E]?" selection 
    case "$selection" in
    y | Y) nonanswered=0   
    echo "Select the Color"
    echo "[A] Normal"
    echo "[B] Bold"
    echo "[C] Faint"
    echo "[D] Highlighted (inverted colours)"
    echo "[E] Underlined"
    echo "[F] Slow blink"
    echo "[G] Conceal"
    echo "[H] Crossed-out"
    while [[ "$nonansweredinner" = 1 ]]
    do
      read -n 2 selection 
        case "$selection" in
        a | A) effecta="0;$effecta" 
          nonansweredinner=0;;
        b | B) effecta="1;$effecta" 
          nonansweredinner=0;;
        c | C) effecta="2;$effecta" 
          nonansweredinner=0;;
        d | D) effecta="3;$effecta" 
          nonansweredinner=0;;
        e | E) effecta="4;$effecta" 
          nonansweredinner=0;;
        f | F) effecta="5;$effecta" 
          nonansweredinner=0;;
        g | G) effecta="8;$effecta" 
          nonansweredinner=0;;
        h | H) effecta="9;$effecta" 
          nonansweredinner=0;;
        *) echo "Please select a correct option";;
      esac
    done;;
    n | N) echo "You dont want to apply no effect to the string"
    nonanswered=0;;
    e | E) echo "Exiting"
    continue=0
    nonanswered=0;;
    *) echo "You selected the wrong option, Try again please";;
    esac
  else
    break
  fi
done

if [[ $continue = 1 ]]
then

  if  grep "custom-bash-prompt" ~/.bashrc > /dev/null
  then
    echo "You have already used freddieventura/custom-bash-prompt"
    echo "Swaping your previous configuration"
    sed '/custom-bash-prompt/{N;d;}' ~/.bashrc | dd of=~/temporal.txt conv=fdatasync > /dev/null 2>&1
    mv ~/temporal.txt ~/.bashrc
    else
    echo "You haven't used custom-bash-prompt before"
  fi
  prompt="\[\033[$effecta$colora\]$stringa\[\033[00m\]"
  echo "$prompt"

  echo "## PROMPT ADDED BY custom-bash-prompt" >> ~/.bashrc 
  echo export PS1=\"$prompt\"  >> ~/.bashrc

  echo "In order to apply the changes to your current environment"
  echo 'Don'\''t forget to execute the following command "source ~/.bashrc"'

else
  echo "You have successfully exited the script"
 fi

