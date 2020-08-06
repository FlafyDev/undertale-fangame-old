/// @desc show_ds_grid
/// @function show_ds_grid
/// @param id

// will something like: "0: ( 1, 1, 1, 1) 1: ( 2, 2, 2, 2);"

var idd = argument[0]
var val = ""

for(var i = 0; i<ds_grid_width(idd); i++) {
	val += string(i) + ": ("
	for(var ii = 0; ii<ds_grid_height(idd); ii++) {
		val+=" " + string(ds_grid_get(idd,i,ii)) + ","
	}
	val = string_delete(val,string_length(val),string_length(val))
	val += ") "
}
val += ";"

return val