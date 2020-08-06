/// @desc monsterDeath_create(sprite, subimg, x, y, image_xscale, image_yscale, colors, *secondsCreate)
/// @function monsterDeath_create
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param image_xscale
/// @param image_yscale
/// @param colors
/// @param *secondsCreate

var sprite = argument[0]
var subimg = argument[1]
var xx = argument[2]
var yy = argument[3]
var xscale = argument[4]
var yscale = argument[5]
var colors = argument[6]
var secondsCreate = 20

if argument_count>7 secondsCreate = argument[7]
 
var obj = instance_create_depth(xx,yy,depth-1,oMonsterDeath)
obj.sprite = sprite
obj.subimg = subimg
obj.x = xx
obj.y = yy
obj.xscale = xscale
obj.yscale = yscale
obj.readyColors = colors
obj.secondsCreate = secondsCreate

with obj {
	if array_length_1d(readyColors)>0 {
		maketodust = true
		self.colors = readyColors
	}
}

return obj