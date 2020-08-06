if talked==0
{
	textbox_enable=1
	oFrisk.Sprite = oFrisk.sprites_y[1]
	oFrisk.moveable=false
	talked=1
	flags_set("floweyTalk",2)
}

if textbox_ended
{
	if talked==1
	{
		oFrisk.moveable=true
		talked = 2
	}
}
if talked == 2
{
	moveable=true
	key_up = 1
	key_down=0
	key_left=0
	key_right=0
}
if place_meeting(x,y,oRoomTeleporter)
{
	SpriteAlpha-=0.05
	if SpriteAlpha<=0
		instance_destroy()
}

/*if textbox_frame==array_length_1d(text)-1&&key_a_once&&string_length(text[textbox_frame])<textbox_counter-1
{
	key_left=1
	moveable=0
	textbox_frame+=0.1
	textbox_counter=0
}