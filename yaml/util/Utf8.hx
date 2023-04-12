package yaml.util;

import yaml_wrapper.Utf8 as Utf8_;

class Utf8
{
	public static function substring(value:String, startIndex:Int, ?endIndex:Null<Int>):String
	{
		var size = Utf8_.length(value);
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
		
		return Utf8_.sub(value, pos, length);
	}
}
