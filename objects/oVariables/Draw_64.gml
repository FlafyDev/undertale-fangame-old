draw_set_color(c_black)
draw_set_alpha(clamp(fade,0,1))
draw_rectangle(0,0,960,540,false)

draw_set_alpha(1)

draw_set_color(c_white)
//draw_text(0,0,flags_get("lastX"))
var key_c_once = keyboard_check_pressed(keyC)

var elsee = true
var usedItem = -1
while inviStage != -1 && instance_exists(oFrisk)
{
	#region invintory
		elsee = false
		oFrisk.moveable = false
		var key_up_once = keyboard_check_pressed(vk_up)
		var key_down_once = keyboard_check_pressed(vk_down)
		var key_left_once = keyboard_check_pressed(vk_left)
		var key_right_once = keyboard_check_pressed(vk_right)
		var key_a_once = keyboard_check_pressed(keyA)
		var key_b_once = keyboard_check_pressed(keyB)
		var yMenuSlots = [220,261,301]
		var yMenuSlotsItems = [324,103]
		var menuUsesText = ["use", "info", "drop"]
		var cell = false
		var outline = 4
	
		if inviLock==0
			if inviStage == 0 {
				inviSlot = clamp(key_down_once-key_up_once+inviSlot,0,array_length_1d(yMenuSlots)-1-abs(cell-1))
				inviSlotItem = [0,0]
				if key_a_once
					inviStage=inviSlot+1
				else if key_b_once or key_c_once {
					inviStage = -1
					oFrisk.moveable = true
					break;
				}
		}
		else	if inviStage == 1 {
				inviSlotItem = [clamp(key_down_once-key_up_once+inviSlotItem[0],0,undertale_number_item()-1),0] //[0] 0-8 ===== 0 means no items ===== 1 means 1 item
				if key_a_once&&undertale_number_item()!=0
					inviStage=1.5
				else if key_b_once
					inviStage=0
		}
		else	if inviStage == 1.5 {
				inviSlotItem[1] = clamp(key_right_once-key_left_once+inviSlotItem[1],0,2)
				if key_a_once {
					switch inviSlotItem[1] {
						case 0:
							usedItem=undertale_slot_item(inviSlotItem[0])
							inviStage = 1
							undertale_remove_item(inviSlotItem[0])
						break;
						case 1:
							inviLock=1
							inviNpc = instance_create_depth(0,0,depth-1,oNpc)
							inviNpc.depthSystemOn = false
							inviNpc.text = ds_list_find_value(global.ItemDesc,undertale_slot_item(inviSlotItem[0]))
							inviNpc.textbox_forcestart = 1
						break;
						case 2:
							if ds_list_find_value(global.ItemDropable, undertale_slot_item(inviSlotItem[0]))==true {
								inviStage = 1
								undertale_remove_item(inviSlotItem[0])
							}
						break;
					}
				}
				else if key_b_once
					inviStage=1
		}
		else	if inviStage == 2 {
			if key_b_once
				inviStage=0
		}
		
		if inviLock==1 && inviNpc.textbox_ended
			inviLock=0
	
	
		//mini profile
		draw_rectangle_invi(48,58,213-26,124,outline)
		draw_set_font(ft_8bito)
		draw_text(69,76,global.pName)
		draw_set_font(ft_8bitoTiny)
		undertale_pack = draw_text_undertale("LV "+string(global.pLevel)+"\n"+"HP "+string(global.pHp)+@"\"+string(global.pMaxHp)+"\n"+"G "+string(global.pGold), 69,112, undertale_pack)
		//menu
		draw_rectangle_invi(48,189,213-26,166,outline)
		draw_set_font(ft_8bito)
		var menY = 100
		undertale_pack = draw_text_undertale("ITEM", menY, yMenuSlots[0], undertale_pack)
		undertale_pack = draw_text_undertale("STAT", menY, yMenuSlots[1], undertale_pack)
		if cell
			undertale_pack = draw_text_undertale("CELL", menY, yMenuSlots[2], undertale_pack)
		//big menu
		if inviStage!=0 {
			draw_rectangle_invi(282-26,58,519,471,outline)
			if floor(inviStage)==1 {
				var dess1
				var dess2
				for (var i = 0; i < undertale_number_item(); ++i) { 
					dess1 = 40
					undertale_pack = draw_text_undertale(undertale_name_item_slot(i), yMenuSlotsItems[0], yMenuSlotsItems[1]+i*dess1, undertale_pack)
				}
				for (var i = 0; i < 3; i++) {
					//
					dess2 = 150
					undertale_pack = draw_text_undertale(menuUsesText[i], 324+dess2*i, yMenuSlotsItems[1]+9*40, undertale_pack)
				}
			}
		}
	
		//Heart
			if inviStage == 0
				draw_sprite_ext(sHeart,0,menY-sprite_get_width(sHeart)-5,yMenuSlots[inviSlot]+undertale_height_text("I")/2,1,1,0,c_red,1)
		else	if inviStage == 1 && undertale_number_item()!=0
				draw_sprite_ext(sHeart,0,yMenuSlotsItems[0]-sprite_get_width(sHeart)-5, yMenuSlotsItems[1]+inviSlotItem[0]*40+undertale_height_text("I")/2,1,1,0,c_red,1)
		else	if inviStage == 1.5 {
				draw_sprite_ext(sHeart,0,324+dess2*inviSlotItem[1]-sprite_get_width(sHeart)-5,yMenuSlotsItems[1]+9*40+undertale_height_text("I")/2,1,1,0,c_red,1)
				draw_sprite_ext(sHeart,0,yMenuSlotsItems[0]-sprite_get_width(sHeart)-5, yMenuSlotsItems[1]+inviSlotItem[0]*40+undertale_height_text("I")/2,1,1,0,c_red,0.5)
			}
	#endregion
	break;
}
if elsee && key_c_once && inviStage==-1 && instance_exists(oFrisk) && oFrisk.moveable
	inviStage = 0
	
switch usedItem // Items / Item Actions / Action When Using / Use Them / It
{
	case 0:
		undertale_add_hp(35)
		undertale_add_item(1)
	break;
	case 1:
		undertale_add_item(1)
	break;
}

//debug
//show_debug_message_plus(global.pHp, global.pMaxHp)