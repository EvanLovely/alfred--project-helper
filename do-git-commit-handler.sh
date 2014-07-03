source bash_functions
cd ~/active-project/site_root/
git add . --all
git commit -q -m "$1"
if [[ "$(echo $?)" != "0" ]]; then
  echo "Error"
  exit
fi
if [[ "$(getsetting git_push_after_commit)" == "TRUE" ]]; then
    git push -q
    if [[ "$(echo $?)" == "0" ]]; then
      echo "Commited and Pushed"
    else
      git pull -q
      git push -q
      if [[ "$(echo $?)" == "0" ]]; then
        echo "Commited, Pulled, and Pushed"
      fi
    fi
  else
  echo "Commited"
fi
