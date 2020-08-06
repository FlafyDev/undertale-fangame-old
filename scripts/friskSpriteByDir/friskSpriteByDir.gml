/// @desc friskSpriteByDir(dir)
/// @function friskSpriteByDir
/// @param dir

/******************

	the object "oFrisk" needs to be in the game while the script activate.

*******************/


if argument[0]<2
	return oFrisk.sprites_x[argument[0]]
else
	return oFrisk.sprites_y[real(argument[0])-2]