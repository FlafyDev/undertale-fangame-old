/// Start after the create event
// example of the variables.
Sprite = sBroBro_Stand
sprites_x = [sBroBro_Walk,sBroBro_Walk]
sprites_y = [sBroBro_Stand,sBroBro_Stand]
mask_index = sBroBro_Hitbox
SpriteSpeed = 10
sprspdcounter = 0
SpriteSize_x = 2
SpriteSize_y = 2
SpriteImg=-1

textbox_y = textbox_down

textNum = flags_get("BroBro")
if textNum == 0
	undertale_pack[2] = 0.2
textbox_skipText=false

itemSlot = -1