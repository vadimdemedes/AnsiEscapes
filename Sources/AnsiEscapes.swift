import Foundation

let ESC = "\u{1B}["
let isTerminalApp = ProcessInfo.processInfo.environment["TERM_PROGRAM"] == "Apple_Terminal"

public struct AnsiEscapes {
	public static func cursorTo(x: Int? = nil, y: Int? = nil) -> String {
		if x == nil && y == nil {
			return "\(ESC)H"
		}
		
		if y == nil {
			return "\(ESC)\(x! + 1)G"
		}
		
		return "\(ESC)\(y! + 1);\(x! + 1)H"
	}
	
	public static func cursorMove(x: Int? = nil, y: Int? = nil) -> String {
		if x == nil || y == nil {
			return ""
		}
		
		var ret = ""
		
		if x! < 0 {
			ret += "\(ESC)\(-x!)D"
		}
		
		if x! > 0 {
			ret += "\(ESC)\(x!)C"
		}
		
		if y! < 0 {
			ret += "\(ESC)\(-y!)A"
		}
		
		if y! > 0 {
			ret += "\(ESC)\(y!)B"
		}
		
		return ret
	}
	
	public static func cursorUp(_ count: Int = 1) -> String {
		return "\(ESC)\(count)A"
	}
	
	public static func cursorDown(_ count: Int = 1) -> String {
		return "\(ESC)\(count)B"
	}
	
	public static func cursorForward(_ count: Int = 1) -> String {
		return "\(ESC)\(count)C"
	}
	
	public static func cursorBackward(_ count: Int = 1) -> String {
		return "\(ESC)\(count)D"
	}
	
	public static let cursorLeft = "\(ESC)G"
	public static let cursorSavePosition = "\(ESC)\(isTerminalApp ? "7": "s")"
	public static let cursorRestorePosition = "\(ESC)\(isTerminalApp ? "8" : "u")"
	public static let cursorGetPosition = "\(ESC)6n"
	public static let cursorNextLine = "\(ESC)E"
	public static let cursorPrevLine = "\(ESC)F"
	public static let cursorHide = "\(ESC)?25l"
	public static let cursorShow = "\(ESC)?25h"
	
	public static func eraseLines(_ count: Int) -> String {
		var clear = ""
		
		for i in 0..<count {
			clear += eraseLine + (i < count - 1 ? cursorUp() : "")
		}
		
		if count > 0 {
			clear += cursorLeft
		}
		
		return clear
	}
	
	public static let eraseEndLine = "\(ESC)K"
	public static let eraseStartLine = "\(ESC)1K"
	public static let eraseLine = "\(ESC)2K"
	public static let eraseDown = "\(ESC)J"
	public static let eraseUp = "\(ESC)1J"
	public static let eraseScreen = "\(ESC)2J"
	
	public static let scrollUp = "\(ESC)S"
	public static let scrollDown = "\(ESC)T"
	
	public static let clearScreen = "\u{1Bc}"
	public static let beep = "\u{7}"
}
