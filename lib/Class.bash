#------------------------------------------------------------------------------
# Emulate OO in Bash
#------------------------------------------------------------------------------

Class() {
  :
}

Pig.Latin.new() {
  local symbol=$1 english="$2"
  printf -v "Pig_Latin__${symbol}__english" "$english"
  func=$(type Pig.Latin:convert | tail -n+2)
  func="${func//%%/\$Pig_Latin__${symbol}__}"
  func="${func/Pig.Latin:/$symbol.}"
  eval "$func"
}

die() { echo "$@" >&2; exit 1; }

