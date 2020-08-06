/// @func ATEX_tag_link(arguments, properties, sizes, event, poslist)
/// @desc This is example of tag script, duplicate and edit it if you want to fast create new tag
/// @arg {list} arguments Arguments of tag, ds_list with values                                             0
/// @arg {map} properties Properties of tag, ds_map with keys and values                                    1
/// @arg {array} sizes Current width and height of string. 0 - width, 1 - height                            2
/// @arg {string} event Event for this tag                                                                  3
/// @arg {array} list of positions of text                                                                  4

var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return 0
if type=="names"
	return ["delay"]
if type=="type"
	return ATEX.ext
if type=="dynamic"
	return true
	
#endregion

if type=="position"
{
	return [0,0]
}
else
if type=="draw"
{
	var X=argument4, Y=argument5;
	var delayVal = real(ATEX_get_arg(args, 0, 0, 1, "delay the time in seconds"))
	var skipTypeByTime_x = false
	for (var i = 0; i < array_length_1d(__tSkipTypesArray_x); ++i) {
		if __tSkipTypesArray_x[i] == X {
			skipTypeByTime_x=true
			break;
		}
	}
	var skipTypeByTime_y = false
	for (var i = 0; i < array_length_1d(__tSkipTypesArray_y); ++i) {
		if __tSkipTypesArray_y[i] == Y {
			skipTypeByTime_y=true
			break;
		}
	}
	if skipTypeByTime_x==false && skipTypeByTime_y==false {
		__tStopTime = delayVal
		__tSkipTypesArray_x[array_length_1d(__tSkipTypesArray_x)] = X
		__tSkipTypesArray_y[array_length_1d(__tSkipTypesArray_y)] = Y
		__tTime-=__tTextSpd
	}
}
else
if type=="start"
{
	
}
else
if type=="end"
{
}
else
if type=="init"
{
	
}