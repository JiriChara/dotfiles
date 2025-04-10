#!/bin/bash

skip_files=("README.markdown install.sh .git .gitignore .gitmodules")
replace_all=false

install() {
  for file in *; do
    # Skip files in the skip_files array
    if [[ " ${skip_files[@]} " =~ " ${file} " ]]; then
      continue
    fi

    file_path="$HOME/.$file"

    if [[ -e "$file_path" ]]; then
      if cmp -s "$file" "$file_path"; then
        echo "identical $file_path"
      elif [[ "$replace_all" == true ]]; then
        replace_file "$file" "$file_path"
      else
        read -p "overwrite $file_path? [ynaq] " choice
        case "$choice" in
          a) 
            replace_all=true
            replace_file "$file" "$file_path"
            ;;
          y) 
            replace_file "$file" "$file_path"
            ;;
          q) 
            exit
            ;;
          *)
            echo "skipping $file_path"
            ;;
        esac
      fi
    else
      link_file "$file" "$file_path"
    fi
  done

  # Symlink neovim configs
  home="$HOME"
  config_path="$home/.config"
  nvim_path="$home/.config/nvim"
  nvimrc_path="$home/.config/nvimrc"

  [[ ! -e "$config_path" ]] && mkdir -p "$config_path"
  [[ ! -e "$nvim_path" ]] && ln -s "$home/.nvim" "$nvim_path"
  [[ ! -e "$nvimrc_path" ]] && ln -s "$home/.nvimrc" "$nvimrc_path"
}

replace_file() {
  rm -rf "$2"
  link_file "$1" "$2"
}

link_file() {
  echo "linking $2"
  ln -s "$PWD/$1" "$2"
}

# Run the install function
install
