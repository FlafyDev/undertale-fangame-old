/// @desc show_string(str1, str2, ...)
/// @function show_string
/// @param str1
/// @param str2
/// @param ...

var result = ""

for (var i = 0; i<argument_count; i++)
{
	result += string(argument[i])+"\n-------\n"
}

show_message(result)