/// @desc get_sprite_colors_array(sprite, subimg, xscale, yscale)
/// @function get_sprite_colors_array
/// @param sprite
/// @param subimg
/// @param xscale
/// @param yscale

var sprite = argument[0]
var subimg = argument[1]
var xscale = argument[2]
var yscale = argument[3]

show_debug_message("start rendering:   sprite_index: " + string(sprite) + " image_index: " + string(subimg) + " xscale: " + string(xscale) + " yscale: " + string(yscale))

var spriteWidth = sprite_get_width(sprite)*xscale
var spriteHeight = sprite_get_height(sprite)*yscale

var surface = surface_create(spriteWidth,spriteHeight)
surface_set_target(surface)
	draw_clear_alpha(make_color_rgb(0,255,0),1)
	draw_sprite_ext(sprite,subimg,sprite_get_xoffset(sprite)*xscale,sprite_get_yoffset(sprite)*yscale,xscale,yscale,0,c_white,1)
surface_reset_target()

var colors = []

for (var i = 0; i<spriteWidth; i++) {
	for(var ii=0; ii<spriteHeight; ii++) {
		colors[i,ii] = surface_getpixel(surface,i,ii)
		show_debug_message(	"got pixel, x: "+string(i) + " y: "+string(ii) + "  out of x: " + string(spriteWidth) + " y:" + string(spriteHeight) + "\n "+
					"total pixels: " + string(spriteWidth*spriteHeight) + " pixels left: " + string(spriteWidth*spriteHeight-array_length_all(colors)) + "\n"
		)
	}
}

draw_surface(surface,0,0)
surface_free(surface)
var ds_list = ds_list_create()
ds_list_add(ds_list,colors)
var ds_list_writed = ds_list_write(ds_list)
ds_list_destroy(ds_list)
/*returns the
colors array
a copyable array to gml script
a ds list(writed) with the array
*/
clipboard_set_text(ds_list_writed)

return [colors, string_replace_all(string_replace_all(string(colors),"}","]"),"{","["),ds_list_writed]

