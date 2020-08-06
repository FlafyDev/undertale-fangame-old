/// @description string_startswith(substr, str)
/// @function string_startswith
/// @param substr
/// @param str

var _substr = argument[0]
var _str = argument[1]

for (var i = 0; i < string_length(_substr); i++)
{
	if string_char_at(_substr,i+1)==string_char_at(_str,i+1)
	{
		continue; //same letter
	}
	else
	{
		i=-1
		break; //wrong letter
	}
}

