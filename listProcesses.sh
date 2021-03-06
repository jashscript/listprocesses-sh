#!/bin/bash

function listProcesses(){
  if [ -z "$1" ]
  then
    local quant=11
  else
    local quant=$(bc <<< $1+1)
  fi

  results=$(ps -e -o pid --sort -size | head -n $quant | grep "[0-9]" | tr -d '\n')
  for pid in $results
  do
    local pr_size=$(ps -p $pid -o size | grep "[0-9]")
    echo -n $(ps -p $pid -o comm=) " => "
    echo $(bc <<< "scale=2;$pr_size/1024") "MB"
  done
}

listProcesses $1
