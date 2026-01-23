#!/usr/bin/env bash

file_operations() {
  local file=$1

  while true; do
    echo "---------------------------------------------------------------------"
    echo "| 0 Back | 1 Delete | 2 Rename | 3 Make writable | 4 Make read-only |"
    echo "---------------------------------------------------------------------"
    read -r option
    case "$option" in
      0)
        break
        ;;
      1)
        rm -f "$file"
        echo "$file has been deleted."
        break
        ;;
      2)
        echo "Enter the new file name:"
        read -r name
        mv "$file" "$name"
        echo "$file has been renamed as $name"
        break
        ;;
      3)
        chmod 666 "$file"
        echo "Permissions have been updated."
        ls -l "$file"
        break
        ;;
      4)
        chmod 664 "$file"
        echo "Permissions have been updated."
        ls -l "$file"
        break
        ;;
      *)
        ;;
    esac
  done
}

file_dir_operations() {
  while true; do
    arr=(*)
    echo "The list of files and directories:"
    for item in "${arr[@]}"; do
      if [[ -f "$item" ]]; then
        echo "F $item"
      elif [[ -d "$item" ]]; then
        echo "D $item"
      fi
    done

    echo
    echo "---------------------------------------------------"
    echo "| 0 Main menu | 'up' To parent | 'name' To select |"
    echo "---------------------------------------------------"
    read -r option
    if [[ -e "$option" ]]; then
      if [[ -d "$option" ]]; then
        cd "$option" || return
      else
        file_operations "$option"
      fi
    elif [[ "$option" == "up" ]]; then
      cd ../
    elif [[ "$option" == "0" ]]; then
      return 0
    else
     echo "Invalid input!"
    fi
    echo

  done
}

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
    1)
      echo "OS: $(uname -s)"
      ;;
    2)
      echo "User: $(whoami)"
      ;;
    3)
      file_dir_operations
      ;;
    4)
      echo "Not implemented!"
      ;;
    *)
      echo "Invalid option!"
      ;;
  esac
done
