Pig.Latin:convert() {
  local words=(%%english) pig_latin_words=()
  local word lword pword ay
  for word in ${words[@]}; do
    lword=$(echo $word | tr '[:upper:]' '[:lower:]')
    [[ $lword =~ ^([^aeiou]*)(.*)$ ]] || die 'error'
    if [ -z "${BASH_REMATCH[1]}" ]; then
      ay=way
    else
      ay=ay
    fi
    pword=${BASH_REMATCH[2]}${BASH_REMATCH[1]}$ay
    if [[ $word =~ ^[A-Z] ]]; then
      pword=$(echo ${pword:0:1} | tr '[:lower:]' '[:upper:]')${pword:1}
    fi
    pig_latin_words+=($pword)
  done
  echo "${pig_latin_words[@]}"
}

#------------------------------------------------------------------------------
# Emulate OO in Bash
#------------------------------------------------------------------------------
Pig.Latin.new() {
  local symbol=$1 english="$2"
  printf -v "Pig_Latin__${symbol}__english" "$english"
  func=$(type Pig.Latin:convert | tail -n+2)
  func="${func//%%/\$Pig_Latin__${symbol}__}"
  func="${func/Pig.Latin:/$symbol.}"
  eval "$func"
}

die() { echo "$@" >&2; exit 1; }
