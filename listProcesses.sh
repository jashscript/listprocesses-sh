#!/bin/bash

function listProcesses(){
  if [ -z "$1" ]
  then
    local quant=11
  else
    local quant=$(expr $1 + 1)
  fi

  results=$(ps -e -o pid --sort -size | head -n $quant | grep "[0-9]" | tr -d '\n')
  for pid in $results
  do
    echo $(ps -p $pid -o comm=)
  done
}

listProcesses $1
