/// @desc flash([color],[speed])
/// @function flash
/// @param [color] the color of the flash. default is c_white
/// @param [speed] every frame it will get down by the speed. default is 0.05

var objflash = instance_create_depth(0,0,0,oFlash)
if argument_count>0
	objflash.flashColor = argument[0]
if argument_count>1
	objflash.alphaFlashSpd = argument[1]