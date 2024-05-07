#!/bin/bash
am-fold() {
  file="$1"
  width="$2"

  # The '-z' test checks if the variable 'width' has a length of zero, meaning it is either unset or
  # its value is an empty string.
  [[ -z "$width" ]] && width=100

  if fold "$file" -w "$width" -s > "$file".temp; then
    mv "$file".temp "$file"
    echo "Folded!"
  else
    echo "Error during folding."
    rm -f "$file".temp
  fi
}
