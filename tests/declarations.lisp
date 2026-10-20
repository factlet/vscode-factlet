; SYNTAX TEST "source.factlet" "declarations"

(unit usd :prefix "$" :places 2)
; <- punctuation.section.list.begin.factlet
;^^^^ storage.type.unit.factlet
;     ^^^ entity.name.type.unit.factlet
;         ^^^^^^^ entity.other.attribute-name.factlet
;         ^ punctuation.definition.keyword.factlet
;                 ^^^ string.quoted.double.factlet
;                             ^ constant.numeric.factlet
;                              ^ punctuation.section.list.end.factlet
(unit kwh :suffix "kWh")
;     ^^^ entity.name.type.unit.factlet

(enum filing-status
;^^^^ storage.type.enum.factlet
;     ^^^^^^^^^^^^^ entity.name.type.enum.factlet
  single married-joint ; a comment
; ^^^^^^ variable.other.enummember.factlet
;        ^^^^^^^^^^^^^ variable.other.enummember.factlet
;                      ^^^^^^^^^^^ comment.line.semicolon.factlet
  head-of-household)
; ^^^^^^^^^^^^^^^^^ variable.other.enummember.factlet
;                  ^ punctuation.section.list.end.factlet

; The enum ends at its closing paren.
(input filing-status : filing-status :label "Filing status")
;^^^^^ storage.type.input.factlet
;      ^^^^^^^^^^^^^ entity.name.variable.input.factlet
;                    ^ keyword.operator.type.annotation.factlet
;                      ^^^^^^^^^^^^^ entity.name.type.factlet
;                                    ^^^^^^ entity.other.attribute-name.factlet
;                                           ^^^^^^^^^^^^^^^ string.quoted.double.factlet
(input dependents : number :default 0)
;                   ^^^^^^ support.type.builtin.factlet
;                          ^^^^^^^^ entity.other.attribute-name.factlet
;                                   ^ constant.numeric.factlet
(input monthly-premiums : [usd 12])
;                       ^ keyword.operator.type.annotation.factlet
;                         ^ punctuation.section.vector.begin.factlet
;                          ^^^ entity.name.type.factlet
;                              ^^ constant.numeric.factlet
;                                ^ punctuation.section.vector.end.factlet
;                                 ^ punctuation.section.list.end.factlet
(input grid : [[usd 2] date])
;             ^ punctuation.section.vector.begin.factlet
;              ^ punctuation.section.vector.begin.factlet
;               ^^^ entity.name.type.factlet
;                   ^ constant.numeric.factlet
;                    ^ punctuation.section.vector.end.factlet
;                      ^^^^ support.type.builtin.factlet
;                          ^ punctuation.section.vector.end.factlet

(def law/std-deduction :cite "IRC §63(c)(2)" $15,750)
;^^^ storage.type.def.factlet
;    ^^^^^^^^^^^^^^^^^ entity.name.variable.def.factlet
;                      ^^^^^ entity.other.attribute-name.factlet
;                            ^^^^^^^^^^^^^^^ string.quoted.double.factlet
;                                            ^^^^^^^ constant.numeric.factlet
;                                            ^ keyword.other.unit.factlet
;                                                   ^ punctuation.section.list.end.factlet
(def min-wage $7.25)
;    ^^^^^^^^ entity.name.variable.def.factlet
;    ^^^^^^^^ - support.function.builtin.factlet

(collection w2s :label "Forms W-2"
;^^^^^^^^^^ storage.type.collection.factlet
;           ^^^ entity.name.type.collection.factlet
  (input box1-wages : usd :line 1)
;        ^^^^^^^^^^ entity.name.variable.input.factlet
;                     ^^^ entity.name.type.factlet
  (def withheld-rate (/ box2-withheld box1-wages)))
;      ^^^^^^^^^^^^^ entity.name.variable.def.factlet
;                     ^ keyword.operator.arithmetic.factlet
;                       ^^^^^^^^^^^^^ meta.symbol.factlet

(defn excess [a : usd b : usd] (max $0 (- a b)))
;^^^^ storage.type.defn.factlet
;     ^^^^^^ entity.name.function.factlet
;            ^ punctuation.section.vector.begin.factlet
;             ^ variable.parameter.factlet
;               ^ keyword.operator.type.annotation.factlet
;                 ^^^ entity.name.type.factlet
;                     ^ variable.parameter.factlet
;                            ^ punctuation.section.vector.end.factlet
;                               ^^^ support.function.builtin.factlet
;                                       ^ keyword.operator.arithmetic.factlet
;                                         ^ meta.symbol.factlet
;                                         ^ - variable.parameter.factlet
(defn monthly-credit
;     ^^^^^^^^^^^^^^ entity.name.function.factlet
  [paid : usd benchmark : [usd 12]]
;  ^^^^ variable.parameter.factlet
;             ^^^^^^^^^ variable.parameter.factlet
;                         ^ punctuation.section.vector.begin.factlet
;                          ^^^ entity.name.type.factlet
;                              ^^ constant.numeric.factlet
;                                ^ punctuation.section.vector.end.factlet
;                                 ^ punctuation.section.vector.end.factlet
  (min paid benchmark))
;  ^^^ support.function.builtin.factlet
;      ^^^^ meta.symbol.factlet

(fixpoint sch1/line17 :start $0 :within $1 :max 50)
;^^^^^^^^ storage.type.fixpoint.factlet
;         ^^^^^^^^^^^ variable.other.fixpoint.factlet
;                     ^^^^^^ entity.other.attribute-name.factlet
;                            ^^ constant.numeric.factlet
;                                          ^^^^ entity.other.attribute-name.factlet
(module state (def rate 5%))
;^^^^^^ storage.type.module.factlet
;       ^^^^^ entity.name.namespace.factlet
;              ^^^ storage.type.def.factlet
;                  ^^^^ entity.name.variable.def.factlet
;                       ^^ constant.numeric.factlet
;                        ^ keyword.other.unit.factlet
(include "law-2025.lisp")
;^^^^^^^ keyword.control.import.factlet
;        ^^^^^^^^^^^^^^^ string.quoted.double.factlet
