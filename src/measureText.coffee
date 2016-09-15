
require "isDev"

{TextManager} = require "NativeModules"

assertTypes = require "assertTypes"
Promise = require "Promise"
OneOf = require "OneOf"

measureText = (options) ->

  if isDev
    assertTypes options, optionTypes

    if options.lines
      assertTypes options.style, styleTypes.multiline

    else assertTypes options.style, styleTypes.line

  Promise.defer (resolve) ->

    if options.lines
      TextManager.computeLines options.lines, options.style, resolve

    else if options.line
      TextManager.computeWidth options.line, options.style, resolve

    else throw TypeError "Must define 'options.lines' or 'options.text'!"

module.exports = measureText

#
# Helpers
#

FontStyle = OneOf [
  "normal"
  "italic"
  "oblique"
]

FontWeight = OneOf [
  "normal"
  "bold"
  100
  200
  300
  400
  500
  600
  700
  800
  900
]

LineBreakMode = OneOf [
  "clipping"
  "word-wrapping"
  "char-wrapping"
  "truncating-head"
  "truncating-middle"
  "truncating-tail"
]

optionTypes =
  line: String.Maybe
  lines: String.Maybe
  style: Object

styleTypes =

  line:
    fontSize: Number
    fontFamily: String
    fontStyle: FontStyle.Maybe
    fontWeight: FontWeight.Maybe
    lineBreakMode: LineBreakMode.Maybe

  multiline:
    width: Number
    fontSize: Number
    fontFamily: String
    fontStyle: FontStyle.Maybe
    fontWeight: FontWeight.Maybe
    lineBreakMode: LineBreakMode.Maybe
    letterSpacing: Number.Maybe
