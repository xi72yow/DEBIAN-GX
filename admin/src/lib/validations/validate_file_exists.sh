## [@bashly-upgrade validations]
validate_file_exists() {
  if [ -f "$1" ]; then
    return 0
  else
    return 1
  fi
}
