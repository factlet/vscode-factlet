; SYNTAX TEST "source.factlet" "literals"

; a comment (def x 1)
; <--------------------- comment.line.semicolon.factlet
(def x "a ; b") ; trailing
;      ^^^^^^^ string.quoted.double.factlet
;      ^^^^^^^ - comment.line.semicolon.factlet
;               ^^^^^^^^^^ comment.line.semicolon.factlet
;               ^ punctuation.definition.comment.factlet

"a \"quoted\" word\n\t\\"
;  ^^ constant.character.escape.factlet
;                 ^^ constant.character.escape.factlet
;                   ^^ constant.character.escape.factlet
;                     ^^ constant.character.escape.factlet
"bad \q escape"
;    ^^ invalid.illegal.unknown-escape.factlet
"first
; <------ string.quoted.double.factlet
second"
; <------- string.quoted.double.factlet

[42 -1.5 0.1 1_000_000 $1,234.56 -$5 €1,000]
;^^ constant.numeric.factlet
;   ^^^^ constant.numeric.factlet
;        ^^^ constant.numeric.factlet
;            ^^^^^^^^^ constant.numeric.factlet
;                      ^^^^^^^^^ constant.numeric.factlet
;                                ^^^ constant.numeric.factlet
;                                 ^ keyword.other.unit.factlet
;                                    ^^^^^^ constant.numeric.factlet
;                                    ^ keyword.other.unit.factlet
[22% 5kWh :line 2b]
;^^^ constant.numeric.factlet
;  ^ keyword.other.unit.factlet
;    ^^^^ constant.numeric.factlet
;     ^^^ keyword.other.unit.factlet
;               ^^ constant.numeric.factlet
[$12,34 1. 1.5.6 12_34,567]
;^^^^^^ invalid.illegal.number.factlet
;       ^^ invalid.illegal.number.factlet
;          ^^^^^ invalid.illegal.number.factlet
;                ^^^^^^^^^ invalid.illegal.number.factlet
[.5 +5 x2 - $]
;^^ meta.symbol.factlet
;   ^^ meta.symbol.factlet
;      ^^ meta.symbol.factlet
;         ^ meta.symbol.factlet
;           ^ meta.symbol.factlet

[2025-12-31 2024-02-29 2000-02-29]
;^^^^^^^^^^ constant.numeric.date.factlet
;           ^^^^^^^^^^ constant.numeric.date.factlet
;                      ^^^^^^^^^^ constant.numeric.date.factlet
[2025-02-29 1900-02-29 2025-13-01 2025-04-31]
;^^^^^^^^^^ invalid.illegal.date.factlet
;           ^^^^^^^^^^ invalid.illegal.date.factlet
;                      ^^^^^^^^^^ invalid.illegal.date.factlet
;                                 ^^^^^^^^^^ invalid.illegal.date.factlet

[true false ? else given?]
;^^^^ constant.language.boolean.factlet
;     ^^^^^ constant.language.boolean.factlet
;           ^ constant.language.missing.factlet
;             ^^^^ keyword.control.else.factlet
;                  ^^^^^^ meta.symbol.factlet
[truest :5 ::x]
;^^^^^^ meta.symbol.factlet
;       ^^ entity.other.attribute-name.factlet
;          ^^^ entity.other.attribute-name.factlet
