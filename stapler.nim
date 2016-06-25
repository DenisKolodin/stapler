# Stapler Nim Package Manager
# © 2016 Denis Kolodin

import strutils
import parseopt2

type
  StaplerCommand = enum
    create,
    build

var
  cm: StaplerCommand

for kind, key, val in getopt():
  case kind
  of cmdArgument:
    try:
      cm = parseEnum[StaplerCommand](key)
      echo "Command ", $cm
    except ValueError:
      echo "Command `", $key, "` not found"
  of cmdLongOption, cmdShortOption:
    discard
  of cmdEnd:
    discard
