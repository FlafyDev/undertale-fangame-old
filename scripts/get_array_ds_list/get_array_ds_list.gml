/// @desc get_array_ds_list(name,
/// @function get_array_ds_list
/// @param name

var txt = file_text_open_read(working_directory + @"\" + argument[0])
var text = file_text_read_string(txt)
file_text_close(txt)

var ds_list = ds_list_create();
ds_list_read(ds_list,text)
var array = ds_list_find_value(ds_list,0)
ds_list_destroy(ds_list)

return array