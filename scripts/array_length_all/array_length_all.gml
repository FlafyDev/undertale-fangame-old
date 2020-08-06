/// @desc array_length_all(array)
/// @function array_length_all
/// @param array

var array = argument[0]
var arrayLength = array_length_1d(array)
var res = 0

for (var i = 0; i<arrayLength; i++) {
	for (var ii = 0; ii<array_length_2d(array,i); ii++) {
		res+=1
	}
}

return res
