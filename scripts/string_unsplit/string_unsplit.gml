/// @description string_unsplit(substr, array, ignoreLastConnecter)
/// @function string_unsplit
/// @param substr
/// @param array
/// @param ignoreLastConnecter

var array = argument[1]
var connectstr = argument[0]
var ignore = argument[2]
var fullstring = ""

for(var i = 0; i<array_length_1d(array); i++)
{
	fullstring += array[i] + connectstr
}

if ignore
	fullstring = string_delete(fullstring,string_length(fullstring)-string_length(connectstr)+1,string_length(connectstr))

return fullstring 