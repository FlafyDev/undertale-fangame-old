switch(textNum) 
{
	case 0:
		text =	[
				"* Hehehe..",
				"* You want to continue,<delay?1> uh?",
				"* Well....<delay?1>\n  I'll do move out of the way......",
				"* But only if you would...",
				"* You would..........<delay?2>\n* Give me a cake!"
			]
		if textbox_frame == 4 && undertale_pack[0]==22
			undertale_pack[2] = 1
		if textbox_ended {
			textbox_ended = false
			textNum = 1
			flags_set("BroBro", 1)
		}
	break;
	case 1:
		undertale_pack[2] = 0.5
		text =	[
				"* oof...",
				"* You don't have a cake for me?"
			]
		itemSlot = undertale_pos_item(0)
		if itemSlot == -1
			itemSlot = undertale_pos_item(1)
		if itemSlot != -1
			textNum=2
	break;
	case 2:
		text =	[
				"* Ohhh a cake!",
				"* Thannkkk you!"
			]
		if textbox_ended {
			oFrisk.moveable = false
			moveable=true
			//Walks to the right....
			key_right=true
			if SpriteSize_x>0
				SpriteSize_x*=-1
			undertale_remove_item(itemSlot)
		}
	
	break;
	
}

