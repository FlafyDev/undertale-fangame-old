/// @desc battle_dust_effect(x, y)
/// @function battle_dust_effect
/// @param x
/// @param y


var xx = argument[0]
var yy = argument[1]

repeat 15
	instance_create_depth(xx, yy, depth-1,oBattle_DustCloud)