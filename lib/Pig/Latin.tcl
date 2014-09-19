package require Tcl 8.5
package require TclOO

oo::class create Pig::Latin {
    constructor {args} {
        variable english [lindex $args 0]
    }

    method convert {} {
        variable english
        set pig_latin_words {}
        foreach {word} [regexp -all -inline {\S+} $english] {
            set lword [string tolower $word]
            regexp {^([^aeiou]*)(.*)$} $lword match match1 match2
            set ay [expr ("$match1"=="")?"way":"ay"]
            set pword "$match2$match1$ay"
            if [regexp {^[A-Z]} $word] {
                lappend pig_latin_words [string toupper $pword 0 0]
            } else {
                lappend pig_latin_words $pword
            }
        }
        return [join $pig_latin_words]
    }
}

package provide Pig::Latin 0.0.1
