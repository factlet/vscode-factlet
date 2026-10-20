; SYNTAX TEST "source.factlet" "test files"

(test "single, one W-2"
;^^^^ keyword.other.test.factlet
;     ^^^^^^^^^^^^^^^^^ string.quoted.double.factlet
  (expect line34/refund ?)
;  ^^^^^^ keyword.other.test.factlet
;                       ^ constant.language.missing.factlet
  (given filing-status 'single
;  ^^^^^ keyword.other.test.factlet
;                      ^^^^^^^ variable.other.enummember.factlet
         taxable-interest $0)
;                         ^^ constant.numeric.factlet
  (member w2s acme
;  ^^^^^^ keyword.other.test.factlet
    (given box1-wages $58,000)
;    ^^^^^ keyword.other.test.factlet
    (expect-error withheld-rate))
;    ^^^^^^^^^^^^ keyword.other.test.factlet
  (empty dependents))
;  ^^^^^ keyword.other.test.factlet
