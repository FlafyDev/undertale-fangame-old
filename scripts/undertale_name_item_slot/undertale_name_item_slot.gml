/// @desc undertale_name_item_slot(slot)
/// @function undertale_name_item_slot
/// @param slot

// returns the name of item by his slot

return ds_list_find_value(global.ItemIDs,ds_list_find_value(global.pItems, argument[0]))