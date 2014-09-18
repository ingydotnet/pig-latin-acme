source lib/Class.bash

Class Pig.Latin @english

Pig.Latin:convert() {
  local words=(%%english) pig_latin_words=()
  local word lword pword ay
  for word in ${words[@]}; do
    lword=$(echo $word | tr '[:upper:]' '[:lower:]')
    [[ $lword =~ ^([^aeiou]*)(.*)$ ]] ||
      die 'error'
    [ -z "${BASH_REMATCH[1]}" ] && ay=way || ay=ay
    pword=${BASH_REMATCH[2]}${BASH_REMATCH[1]}$ay
    if [[ $word =~ ^[A-Z] ]]; then
      pword=$(echo ${pword:0:1} | tr '[:lower:]' '[:upper:]')${pword:1}
    fi
    pig_latin_words+=($pword)
  done
  echo "${pig_latin_words[@]}"
}
