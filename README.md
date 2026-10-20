# Factlet for Visual Studio Code

Syntax highlighting for [Factlet](https://github.com/factlet/factlet), an
incremental fact graph for rules-as-code, with a small Lisp for writing the
graph as data.

```lisp
(unit usd :prefix "$" :places 2)
(enum filing-status single married-joint)

(input filing-status : filing-status :label "Filing status")
(collection w2s :label "Forms W-2"
  (input wages : usd :line 1))

(def law/deduction :cite "IRC §63(c)(2)"
  (table filing-status
    single        $15,750
    married-joint $31,500))

(def taxable-income :label "Taxable income" :line 15
  (max $0 (- (sum w2s wages) law/deduction)))
```

## Features

- **Declarations**: `unit`, `enum`, `input`, `def`, `collection`, `defn`,
  `fixpoint` and `module`, with the names they declare. Enum variants,
  `defn` parameters and `: type` annotations (including `[usd 12]`) are
  highlighted too.
- **Expressions**: operators, `if`/`cond`/`let`/`table`/`and`/`or`/`not`,
  and every built-in function, recognized only at the head of a list:
  `year` is a built-in in `(year d)` but not in `(+ year 1)`.
- **Literals**, as the reader sees them: numbers with their unit prefix or
  suffix (`$1,234.56`, `22%`, `5kWh`), dates (`2025-12-31`), strings and
  their escapes, `:keywords`, `'variants`, `true`, `false` and `?`.
- **Errors the reader would report**: malformed numbers (`$12,34`, `1.`),
  impossible dates (`2025-02-29`, `2025-13-01`) and unknown string escapes.
- **Tests**: `test`, `given`, `member`, `empty`, `expect` and
  `expect-error`, for test and `--case` files.
- Comment toggling with `;`, bracket matching and auto-closing for `( )`,
  `[ ]` and `" "`.

## File association

Factlet programs use the `.lisp` extension, so this extension claims it.
If you also have a Common Lisp extension installed, choose per workspace in
`.vscode/settings.json`:

```json
{
  "files.associations": {
    "*.lisp": "factlet"
  }
}
```

## Install from source

From this folder:

```sh
npx @vscode/vsce package --skip-license
code --install-extension factlet-0.1.0.vsix
```

`--skip-license` is needed because the licenses are `LICENSE-MIT` and
`LICENSE-APACHE`, not a single `LICENSE` file.

## Development

Open this folder in VS Code and press F5 to launch an Extension Development
Host with the grammar loaded. Use **Developer: Inspect Editor Tokens and
Scopes** to see the scope of any token.

The grammar is [syntaxes/factlet.tmLanguage.json](syntaxes/factlet.tmLanguage.json).
Its tests in [tests/](tests) are Factlet files annotated with the scopes
each token should have, in the format of
[vscode-tmgrammar-test](https://github.com/PanAeon/vscode-tmgrammar-test):

```lisp
(defn excess [a : usd b : usd] (max $0 (- a b)))
;     ^^^^^^ entity.name.function.factlet
;             ^ variable.parameter.factlet
```

```sh
npm install
npm test
```

## License

Licensed under either of [Apache License, Version 2.0](LICENSE-APACHE) or
[MIT license](LICENSE-MIT) at your option.
