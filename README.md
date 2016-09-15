
# measureText v1.0.0 ![experimental](https://img.shields.io/badge/stability-experimental-EC5315.svg?style=flat)

**TODO:** Provide category for native text measuring. For now, you must pick [this commit]().

```coffee
measureText = require "measureText"

promise = measureText
  line: "measuring the width of a single-line string"
  style: {
    # See the `options.style` section.
  }

promise.then (fontWidth) ->
  # `fontWidth` is the width of `options.line` when
  # `options.style` is applied on the native end.

promise = measureText
  lines: "measuring the width of a multi-line string"
  style: {
    width: 640 # <= The max width of the text. (required)
    # Also see the `options.style` section.
  }

promise.then (lines) ->
  # `lines` is an array of strings. Place each line in its
  # own TextView to stay within `options.style.width`.
```

## options.style

Supported `options` types:
```coffee
fontSize: Number.isRequired
fontFamily: String.isRequired
fontWeight: String.or Number
fontStyle: String
lineBreakMode: String
letterSpacing: Number
```

Default `options` values:
```coffee
fontWeight: "normal"
fontStyle: "normal"
lineBreakMode: "word-wrapping"
letterSpacing: 0 # kerning disabled
```

Supported `fontWeight` values:
- `100`
- `200`
- `300`
- `400` (or `normal`)
- `500`
- `600`
- `700` (or `bold`)
- `800`
- `900`

Supported `fontStyle` values:
- `normal`
- `italic` (or `oblique`)

Supported `lineBreakMode` values:
- `clipping`
- `word-wrapping`
- `char-wrapping`
- `truncating-head`
- `truncating-middle`
- `truncating-tail`
