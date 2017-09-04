# AnsiEscapes [![Build Status](https://travis-ci.org/vadimdemedes/AnsiEscapes.svg?branch=master)](https://travis-ci.org/vadimdemedes/AnsiEscapes)

> [ANSI escape codes](http://www.termsys.demon.co.uk/vtansi.htm) for manipulating the terminal

Port to Swift of [ansi-escapes](https://github.com/sindresorhus/ansi-escapes) by [Sindre Sorhus](https://github.com/sindresorhus).


## Install

Using [SPM](https://swift.org/package-manager/):

```swift
.Package(url: "https://github.com/vadimdemedes/AnsiEscapes", majorVersion: 1)
```


## Usage

```swift
import AnsiEscapes

print(AnsiEscapes.eraseLines(2))
print(AnsiEscapes.beep)
```


## API

### cursorTo(x: Int?, y: Int?)

Set the absolute position of the cursor. `x0` `y0` is the top left of the screen.

Specify either both `x` & `y`, only `x`, or nothing.

### cursorMove(x: Int?, y: Int?)

Set the position of the cursor relative to its current position.

### cursorUp(Int)

Move cursor up a specific amount of rows. Default is `1`.

### cursorDown(Int)

Move cursor down a specific amount of rows. Default is `1`.

### cursorForward(Int)

Move cursor forward a specific amount of rows. Default is `1`.

### cursorBackward(Int)

Move cursor backward a specific amount of rows. Default is `1`.

### cursorLeft

Move cursor to the left side.

### cursorSavePosition

Save cursor position.

### cursorRestorePosition

Restore saved cursor position.

### cursorGetPosition

Get cursor position.

### cursorNextLine

Move cursor to the next line.

### cursorPrevLine

Move cursor to the previous line.

### cursorHide

Hide cursor.

### cursorShow

Show cursor.

### eraseLines(Int)

Erase from the current cursor position up the specified amount of rows.

### eraseEndLine

Erase from the current cursor position to the end of the current line.

### eraseStartLine

Erase from the current cursor position to the start of the current line.

### eraseLine

Erase the entire current line.

### eraseDown

Erase the screen from the current line down to the bottom of the screen.

### eraseUp

Erase the screen from the current line up to the top of the screen.

### eraseScreen

Erase the screen and move the cursor the top left position.

### scrollUp

Scroll display up one line.

### scrollDown

Scroll display down one line.

### clearScreen

Clear the terminal screen.

### beep

Output a beeping sound.


## License

MIT © [Vadim Demedes](https://github.com/vadimdemedes)
