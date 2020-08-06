/// @desc draw_rectangle_invi(x, y, width, height, outline)
/// @function draw_rectangle_invi
/// @param x
/// @param y
/// @param width
/// @param height
/// @param outline

var xx = argument[0]
var yy = argument[1]
var width = argument[2]
var height = argument[3]
var outline = argument[4]

var colors = [c_white, c_black]
for (var i = 0; i < 2; i++) {
	draw_set_color(colors[i])
	draw_rectangle(xx+outline*i,yy+outline*i,xx+width+1-outline*i,yy+height+1-outline*i,false)
}
draw_set_color(c_white)