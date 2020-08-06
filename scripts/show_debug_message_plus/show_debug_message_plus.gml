/// @desc show_debug_message_plus(val, val, ...)
/// @function show_debug_message_plus
/// @param val
/// @param val
/// @param ...

var stringg = ""
for (var i = 0; i<argument_count; i++) {
	stringg += string(argument[i]) + " -- "
}
show_debug_message(stringg)