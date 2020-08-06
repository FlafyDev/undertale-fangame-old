if !textbox_enable&&oFrisk.y<y+120&&textbox_ended==0
{
	textbox_enable=1
	oFrisk.Sprite = oFrisk.sprites_y[1]
}

if textbox_ended==1
{
	flags_set("floweyTalk", 1)
	global.BattleID=battle_Flowey1
	get_battle_heart_pos()
	joinBattle(oFrisk.x,oFrisk.y,oFrisk.dir, _heart_middlepos_x, _heart_middlepos_y,0,c_red)
//	if sprspdcounter>sprite_get_number(Sprite)-1 {
//		instance_destroy()
//		oFrisk.moveable=true
//	}
}

/*if textbox_frame==array_length_1d(text)-1&&key_a_once&&string_length(text[textbox_frame])<textbox_counter-1
{
	key_left=1
	moveable=0
	textbox_frame+=0.1
	textbox_counter=0
}