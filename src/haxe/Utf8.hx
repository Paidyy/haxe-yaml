package haxe;

class Utf8 {
    private static var _string:UnicodeString;
    private static function newUnicodeString(string:String) { return _string = new UnicodeString(string); }

	public static function encode(string:String):UnicodeString {
		return newUnicodeString(string);
	}

	public static function length(string:String):Int {
		return string.length;
	}

	public static function charCodeAt(string:String, index:Int):Int {
		return string.charCodeAt(index);
	}

    // idk what to do here so it's just a string
	public static function decode(string:UnicodeString):String {
		return string.toString();
	}

	public static function sub(string:String, pos:Int, length:Int):String {
		return string.substr(pos, length);
	}
}