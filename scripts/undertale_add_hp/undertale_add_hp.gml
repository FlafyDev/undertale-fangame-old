/// @desc undertale_add_hp(amount)
/// @function undertale_add_hp
/// @param amount


global.pHp = clamp(global.pHp+argument[0],global.pHp+argument[0]-1,global.pMaxHp)