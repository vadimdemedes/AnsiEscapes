import XCTest
import AnsiEscapes

class AnsiEscapesTests: XCTestCase {
	func testCursorTo() {
		XCTAssertEqual(AnsiEscapes.cursorTo(), "\u{1B}[H")
		XCTAssertEqual(AnsiEscapes.cursorTo(x: 1), "\u{1B}[2G")
		XCTAssertEqual(AnsiEscapes.cursorTo(x: 1, y: 1), "\u{1B}[2;2H")
	}
	
	func testCursorMove() {
		XCTAssertEqual(AnsiEscapes.cursorMove(), "")
		XCTAssertEqual(AnsiEscapes.cursorMove(x: -1, y: 0), "\u{1B}[1D")
		XCTAssertEqual(AnsiEscapes.cursorMove(x: 1, y: 0), "\u{1B}[1C")
		XCTAssertEqual(AnsiEscapes.cursorMove(x: 0, y: -1), "\u{1B}[1A")
		XCTAssertEqual(AnsiEscapes.cursorMove(x: 0, y: 1), "\u{1B}[1B")
		XCTAssertEqual(AnsiEscapes.cursorMove(x: -1, y: -1), "\u{1B}[1D\u{1B}[1A")
		XCTAssertEqual(AnsiEscapes.cursorMove(x: 1, y: 1), "\u{1B}[1C\u{1B}[1B")
	}
	
	func testCursorUp() {
		XCTAssertEqual(AnsiEscapes.cursorUp(), "\u{1B}[1A")
		XCTAssertEqual(AnsiEscapes.cursorUp(2), "\u{1B}[2A")
	}
	
	func testCursorDown() {
		XCTAssertEqual(AnsiEscapes.cursorDown(), "\u{1B}[1B")
		XCTAssertEqual(AnsiEscapes.cursorDown(2), "\u{1B}[2B")
	}
	
	func testCursorForward() {
		XCTAssertEqual(AnsiEscapes.cursorForward(), "\u{1B}[1C")
		XCTAssertEqual(AnsiEscapes.cursorForward(2), "\u{1B}[2C")
	}
	
	func testCursorBackward() {
		XCTAssertEqual(AnsiEscapes.cursorBackward(), "\u{1B}[1D")
		XCTAssertEqual(AnsiEscapes.cursorBackward(2), "\u{1B}[2D")
	}
	
	func testEraseLines() {
		XCTAssertEqual(AnsiEscapes.eraseLines(0), "")
		XCTAssertEqual(AnsiEscapes.eraseLines(1), AnsiEscapes.eraseLine + AnsiEscapes.cursorLeft)
		XCTAssertEqual(AnsiEscapes.eraseLines(2), AnsiEscapes.eraseLine + AnsiEscapes.cursorUp() + AnsiEscapes.eraseLine + AnsiEscapes.cursorLeft)
	}
}
