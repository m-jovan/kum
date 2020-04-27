#! /usr/bin/env bash
SUBFORMS_PATH="./doc-form-angular/src/app/subforms/"
cd $SUBFORMS_PATH

echo Please enter command:
echo 1. Pull all
echo 2. Merge develop into master
echo 3. Pull master
echo 4. Checkout

read command1

COMMAND=$command1

for dir in ./*/
do
  cd ${dir}
  git status >/dev/null 2>&1
  if [ $command1 == "1" ]
  then 
    [ $(echo $?) -eq 0 ] && echo "Updating ${dir%*/}..." && git fetch && git pull
  elif [ $command1 == "2" ]
  then
    [ $(echo $?) -eq 0 ] && echo "Merging ${dir%*/}..." && git fetch && git pull && git checkout master && git merge develop && git checkout develop
  elif [ $command1 == "3" ]
  then
    [ $(echo $?) -eq 0 ] && echo "Updating ${dir%*/}..." && git checkout master && git fetch && git pull
  else
    checkout="git checkout $command1"
    [ $(echo $?) -eq 0 ] && echo "Branching ${dir%*/}..." && $checkout && git fetch
  fi
  cd ..
done
