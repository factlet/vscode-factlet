; SYNTAX TEST "source.factlet" "expressions"

(+ a (- b) (* 2 c) (/ d 2))
;^ keyword.operator.arithmetic.factlet
;     ^ keyword.operator.arithmetic.factlet
;           ^ keyword.operator.arithmetic.factlet
;                   ^ keyword.operator.arithmetic.factlet
(and (<= a b) (!= a c) (= a d) (> a e))
;^^^ keyword.control.factlet
;     ^^ keyword.operator.comparison.factlet
;              ^^ keyword.operator.comparison.factlet
;                       ^ keyword.operator.comparison.factlet
;                               ^ keyword.operator.comparison.factlet
(or true (not false))
;^^ keyword.control.factlet
;   ^^^^ constant.language.boolean.factlet
;         ^^^ keyword.control.factlet
;             ^^^^^ constant.language.boolean.factlet
(if (> x $0) x $0)
;^^ keyword.control.factlet
(cond ((< a b) a) (else b))
;^^^^ keyword.control.factlet
;       ^ keyword.operator.comparison.factlet
;                  ^^^^ keyword.control.else.factlet
(let [half (/ x 2)] (* half half))
;^^^ keyword.control.factlet
;    ^ punctuation.section.vector.begin.factlet
;     ^^^^ meta.symbol.factlet
;                 ^ punctuation.section.vector.end.factlet

(table filing-status
;^^^^^ keyword.control.factlet
;      ^^^^^^^^^^^^^ meta.symbol.factlet
  (single married-separate) $15,750
;  ^^^^^^ meta.symbol.factlet
;                           ^^^^^^^ constant.numeric.factlet
  else                      $0)
; ^^^^ keyword.control.else.factlet

(sum w2s box1-wages)
;^^^ support.function.builtin.factlet
;    ^^^ meta.symbol.factlet
;    ^^^ - constant.numeric.factlet
(count w2s (> box1-wages $100,000))
;^^^^^ support.function.builtin.factlet
(min-of w2s x) (max-of w2s x) (any w2s t) (all w2s t)
;^^^^^^ support.function.builtin.factlet
;               ^^^^^^ support.function.builtin.factlet
;                              ^^^ support.function.builtin.factlet
;                                          ^^^ support.function.builtin.factlet
(sum-list (map-list monthly-credit premiums slcsp))
;^^^^^^^^ support.function.builtin.factlet
;          ^^^^^^^^ support.function.builtin.factlet
;                   ^^^^^^^^^^^^^^ meta.symbol.factlet
(or-else (nth xs 0) (abs (given? x)))
;^^^^^^^ support.function.builtin.factlet
;         ^^^ support.function.builtin.factlet
;                    ^^^ support.function.builtin.factlet
;                         ^^^^^^ support.function.builtin.factlet
(age-on birth-date 2025-12-31)
;^^^^^^ support.function.builtin.factlet
;                  ^^^^^^^^^^ constant.numeric.date.factlet
(months-between a b) (days-between a b) (year d) (month d) (day d)
;^^^^^^^^^^^^^^ support.function.builtin.factlet
;                     ^^^^^^^^^^^^ support.function.builtin.factlet
;                                        ^^^^ support.function.builtin.factlet
;                                                 ^^^^^ support.function.builtin.factlet
;                                                           ^^^ support.function.builtin.factlet
(round $1 (floor 0.01 (ceil 1 x)))
;^^^^^ support.function.builtin.factlet
;          ^^^^^ support.function.builtin.factlet
;                      ^^^^ support.function.builtin.factlet
(brackets taxable-income [10% $11,925  12%])
;^^^^^^^^ support.function.builtin.factlet
;                         ^^^ constant.numeric.factlet
;                             ^^^^^^^ constant.numeric.factlet

; Builtins are only recognized at the head of a list.
(+ year 1) (minimum 1) (excess a b)
;  ^^^^ - support.function.builtin.factlet
;           ^^^^^^^ - support.function.builtin.factlet
;                       ^^^^^^ meta.symbol.factlet
( max a b)
; ^^^ support.function.builtin.factlet

(= filing-status 'single)
;                ^^^^^^^ variable.other.enummember.factlet
;                ^ punctuation.definition.quote.factlet
(+ line1z/wages line16/tax)
;  ^^^^^^^^^^^^ meta.symbol.factlet
;               ^^^^^^^^^^ meta.symbol.factlet
;               ^^^^^^^^^^ - constant.numeric.factlet
