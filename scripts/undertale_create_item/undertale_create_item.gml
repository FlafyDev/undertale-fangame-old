/// @desc undertale_create_item(name, description, dropable)
/// @function undertale_create_item
/// @param name
/// @param description
/// @param dropable

ds_list_add(global.ItemIDs, argument[0])
ds_list_add(global.ItemDesc, argument[1])
ds_list_add(global.ItemDropable,argument[2])