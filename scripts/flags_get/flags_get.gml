/// @desc flags_get(name)
/// @function flags_get
/// @param name

var name = argument[0]

var res = global.flags[? name]

if is_undefined(res)
	show_debug_message("WARNING: '" + string(name) + "' is undefinded(not an existing flag)")

return res