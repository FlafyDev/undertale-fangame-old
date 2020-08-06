/// @desc array_reset_length(newLength)
/// @function array_reset_length
/// @param newLength

//returns an array with length(arg0) and all his slots are 0
var a = []

for (var i = 0; i<argument[0]; i++) {
	a[i] = 0
}

return a
