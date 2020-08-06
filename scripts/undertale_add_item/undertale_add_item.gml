/// @desc undertale_add_item(ID, [slot])
/// @function undertale_add_item
/// @param ID
/// @param [slot] 0 to 7 int

var ID = argument[0]
var slot = undefined
if argument_count>1 slot = argument[1]

if undertale_number_item()>7
	return -1;

if !is_undefined(slot) && ds_list_size(global.pItems)>=slot+1 {
	ds_list_replace(global.pItems,slot,ID)
	return;
}
	ds_list_add(global.pItems, ID)