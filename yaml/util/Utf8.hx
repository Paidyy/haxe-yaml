package yaml.util;

import cpp.NativeString;

class Utf8
{
	public static function substring(value:String, startIndex:Int, ?endIndex:Null<Int>):String
	{
		var size = new UnicodeString(value).length;
		var pos = startIndex;
		var length = 0;
		
		if (endIndex == null)
		{
			length = size - pos;
		}
		else 
		{
			if (startIndex > endIndex)
			{
				pos = endIndex;
				endIndex = startIndex;
			}
			length = endIndex - pos;
		}
		
		return new UnicodeString(value).substring(pos, length);
	}
}
