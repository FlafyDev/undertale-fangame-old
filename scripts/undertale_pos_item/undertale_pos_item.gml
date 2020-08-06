/// @desc undertale_pos_item(ID)
/// @function undertale_pos_item
/// @param ID

// the closest slot the item ID is in the inventory

var ID = argument[0]
for (var i = 0; i < ds_list_size(global.pItems); ++i) {
	if ds_list_find_value(global.pItems, i) == ID
		return i
}
return -1;