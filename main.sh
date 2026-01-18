#!/usr/bin/env bash

echo "Hello $USER!"

while true; do
  echo
  echo "------------------------------"
  echo "| Hyper Commander            |"
  echo "| 0: Exit                    |"
  echo "| 1: OS info                 |"
  echo "| 2: User info               |"
  echo "| 3: File and Dir operations |"
  echo "| 4: Find Executables        |"
  echo "------------------------------"
  echo

  read -r option
  case "$option" in
    0)
      echo "Farewell!"
      break
      ;;
    1|2|3|4)
      echo "Not implemented!"
      ;;
    *)
      echo "Invalid option!"
      ;;
  esac
done
