/// @description The player object
sprites_x = [sFrisk_Right,sFrisk_Left]
sprites_y = [sFrisk_Down,sFrisk_Up]

sprite_index = sFrisk_Hitbox
mask_index = sFrisk_Hitbox
Sprite = sFrisk_Down
SpriteSize = 2
SpriteSpeed = 10
SpriteAlpha=1

sprspdcounter = 0

Speed = 3

moveable = 1

prePos = x
prePos = y

lookRight = false
lookDown = true

waterActive = false // if you in water
waterDown = 8 // how many px it will draw you below your current pos if waterActive is true


for (var i=0; i<12; i++)
	timer[i]=0
	