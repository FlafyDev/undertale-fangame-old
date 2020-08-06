sprite_index = sToriel_Hitbox
mask_index = sToriel_Hitbox
Sprite = sToriel_Down
SpriteSize_x = 2
SpriteSize_y = 2
SpriteSpeed = 10

if flags_get("floweyTalk")!=1
	instance_destroy();

sprspdcounter = 0

moveable = 1

sprites_x = [sToriel_Right,sToriel_Left]
sprites_y = [sToriel_Down,sToriel_Up]

text =	[
		"* This way."
	]
images =[
		sToriel_headNormal
	]
imageXscale = 2
imageYscale = 2

//------------

talked = 0 //0 - didn't talked already === 1 - talking now === 2 - done talking