/*if y<oFrisk.y {
	show_debug_message("low")
	layer = layer_get_id("lNpclow1")
} else {
	show_debug_message("high")
	layer = layer_get_id("lNpchigh1")
}*/
//layer = y<oFrisk.y ? layer_get_id("lNpclow1") : layer_get_id("lNpchigh1")

var friskExists = instance_exists(oFrisk)

if friskExists
	player_direction = round(point_direction(x,y,oFrisk.x,oFrisk.y) / 90)
else
	player_direction = 0

/*var ptx = floor(oFrisk.x/(bbox_right-bbox_left))-floor(x/(bbox_right-bbox_left))
var pty = floor(oFrisk.y/(bbox_bottom-bbox_top))-floor(y/(bbox_bottom-bbox_top))

var hb_x = bbox_left
var hb_w = bbox_right-bbox_left
var hb_y = bbox_top
var hb_h = bbox_bottom-bbox_top
var hb_mid_x = (bbox_right+bbox_left)/2
var hb_mid_y = (bbox_bottom+bbox_top)/2

var frisk_hb_mid_x = (oFrisk.bbox_right+oFrisk.bbox_left)/2
var frisk_hb_mid_y = (oFrisk.bbox_bottom+oFrisk.bbox_top)/2

var ptx = (floor(frisk_hb_mid_x/hb_w)-floor(hb_mid_x/hb_w))/-1
var pty = (floor(frisk_hb_mid_y/hb_h)-floor(hb_mid_y/hb_h))/-1

show_debug_message(string(ptx) + " == " + string(oFrisk.lookRight) + "  &&  " + string(pty) + " == " + string(oFrisk.lookDown))

draw_set_color(c_yellow)
draw_rectangle(bbox_left-4,bbox_top-4,bbox_right+4,bbox_bottom+4,false)
draw_set_color(c_green)
draw_rectangle(oFrisk.bbox_left,oFrisk.bbox_top,oFrisk.bbox_right,oFrisk.bbox_bottom,false)*/

//show_debug_message(oFrisk.lookRight)

draw_set_color(c_white)

show_debug_message("oVariables.inviStage = " + string(oVariables.inviStage))

if (!textbox_enable && key_a_once && friskExists && oVariables.inviStage == -1 && (	(place_meeting(x-1,y,oFrisk)&&oFrisk.lookRight) or
							(place_meeting(x+1,y,oFrisk)&&oFrisk.lookRight==-1) or
							(place_meeting(x,y-1,oFrisk)&&oFrisk.lookDown) or
							(place_meeting(x,y+1,oFrisk)&&oFrisk.lookDown==-1)
						   )) or textbox_forcestart
{
	direction_x = -oFrisk.lookRight
	direction_y = -oFrisk.lookDown
	textbox_enable=1
	textbox_frame = 0
}


/*if textbox_firsttime = 0
{
	for (var i = 0; i<array_length_1d(text); i++)
		text[i] = string_replace_all(text[i]," ",space)
	textbox_firsttime = 1
}*/
if textbox_enable && textbox_frame == floor(textbox_frame) && friskExists {
	textbox_forcestart=0
	if textbox_frame<array_length_1d(text) {
		var textfin = text[textbox_frame]
		if undertale_pack[0]<undertale_length_text(textfin)
			imageindex+=1/10
		else
			imageindex=0
	
		oFrisk.moveable = 0
		//Draw the textbox
		draw_set_color(c_white)
		draw_rectangle(textbox_x-textbox_width/2-textbox_outline,textbox_y-textbox_height/2-textbox_outline,textbox_x+textbox_width/2+textbox_outline,textbox_y+textbox_height/2+textbox_outline,false)
		draw_set_color(c_black)
		draw_rectangle(textbox_x-textbox_width/2,textbox_y-textbox_height/2,textbox_x+textbox_width/2,textbox_y+textbox_height/2,false)
		draw_set_color(c_white)
		draw_set_font(ft_8bito)
	
		//Draw the image if there is
		var img;
		if textbox_frame<array_length_1d(images) {
			draw_sprite_ext(images[textbox_frame],imageindex,textbox_x-textbox_width/2+imageX+22,textbox_y,imageXscale,imageYscale,0,c_white,1)
			img =images[textbox_frame]
		} else {
			img = -1
		}	
		//Draw the text
		undertale_pack = draw_text_undertale(textfin,textbox_x-textbox_width/2+22+text_x_image*sign(img+1)/2,textbox_y-textbox_height/2+22,undertale_pack)
		var completedMsgText = (undertale_length_text(textfin)<undertale_pack[0])

		#region question 
			var question = noone;
			var questionOp1 = ""
			var questionOp2 = ""
			var que;
			var op_x = 100 
			var op_y = 20
			var op_plus_x = 0
			for (var i = 0; i < array_length_1d(questions); ++i) {
				que = questions[i]
				if textbox_frame == que[2] && que[3] == true {
					question = i
					break;
				}
			}
			if question != noone 
			{
				que = questions[question]
				questionOp1 = que[0]
				questionOp2 = que[1]
				//op_plus_x = (undertale_width_text(questionOp1, true)+undertale_width_text(questionOp2, true))/2
				var op_loc = []
				op_loc[0] = textbox_x-op_x-undertale_width_text(questionOp1, true)
				op_loc[1] = textbox_x+op_x+undertale_width_text(questionOp2, true)/2
				if completedMsgText
					undertale_pack2 = draw_text_undertale(questionOp1,op_loc[0],textbox_y+op_y,undertale_pack2)
				if (undertale_length_text(questionOp1)<undertale_pack2[0])
					undertale_pack3 = draw_text_undertale(questionOp2,op_loc[1],textbox_y+op_y,undertale_pack3)
			}
		#endregion


		var completedFullText = completedMsgText && (undertale_length_text(questionOp1)<undertale_pack2[0])&& (undertale_length_text(questionOp2)<undertale_pack3[0])
		if question == noone {
			completedFullText = completedMsgText
		}

		//If you click a && text filled, skip text
		//show_strings(string_copy(textfin,0,undertale_pack[0]),string_copy(undertale_normal_text(textfin),0,undertale_pack[0]))
		if completedFullText && question != noone{
			var op_selected = questionSelect==0 ? questionOp1 : questionOp2
			draw_sprite_ext(sHeart,0,op_loc[questionSelect]-sprite_get_xoffset(sHeart)*2,textbox_y+op_y+undertale_height_text(op_selected, true)/2,1,1,0,heartColor,1)
		}
		if (key_left_once or key_right_once) && completedFullText {
			questionSelect = !questionSelect
		}
		if key_a_once && completedFullText
		{
			//answer = []
			if question != noone {
				answer = [question, questionSelect]
			}
			textbox_frame++
			undertale_pack = undertale_pack_reset(undertale_pack)
			undertale_pack2 = undertale_pack_reset(undertale_pack2)
			undertale_pack3 = undertale_pack_reset(undertale_pack3)
			questionSelect=0
		}
		//If you click b, skip text
		if key_b_once && textbox_skipText
		{
			undertale_pack[0]=undertale_length_text(textfin)+1
			undertale_pack2[0]=undertale_length_text(questionOp1)+1
			undertale_pack3[0]=undertale_length_text(questionOp2)+1
		}
		//If no frame left, end the textbox
	}
	if textbox_frame==array_length_1d(text) or !(textbox_frame<array_length_1d(text))
	{
		textbox_ended=1
		textbox_enable=0
		oFrisk.moveable = 1
		textbox_frame=0
	}
	//ATEX_draw(textbox_x-textbox_width/2+22+text_x_image*sign(img+1)/2,textbox_y-textbox_height/2+22,string_copy(text[textbox_frame],0,textbox_counter),-1,0)
/*	if key_b_once
	{
		textbox_counter=string_length(text[textbox_frame])
		var pos = -2
		while pos !=-1
		{
			var searchfrom = 0
			for (var i=0; i<string_length(text[textbox_frame]); i++)
			{
				if string_char_at(text[textbox_frame],i) == "("
				{
					searchfrom=i
					break	
				}
			}
			pos=-1
			var word=""
			for(var i = 1; i<string_length(text[textbox_frame])-searchfrom+1; i++)
			{
				if string_char_at(text[textbox_frame],searchfrom+i) == ")"
				{
					pos = searchfrom+i
					break
				}
				word += string_char_at(text[textbox_frame],searchfrom+i)
			}
			if pos!=-1
			{
				text[textbox_frame] = string_replace(text[textbox_frame],"(" +word+ ")","")	
			}
		}
	}
	if key_a_once
	{
		if string_length(text[textbox_frame])<textbox_counter-1
		{
			textbox_frame++
			textbox_counter=0
		}
	}
	else
	{
		textbox_counter+=(textbox_textstop<1)
		textbox_textstop--
		if string_char_at(text[textbox_frame],textbox_counter)=="<"
		{
			while string_char_at(text[textbox_frame],textbox_counter)!=">"
				textbox_counter++
		}
		if string_char_at(text[textbox_frame],textbox_counter)==" "
		{
			repeat string_length(space)-1
				textbox_counter++
		}
		if string_char_at(text[textbox_frame],textbox_counter)=="("
		{
			var pos = -1
			var word=""
			for(var i = 1; i<string_length(text[textbox_frame])-textbox_counter+1; i++)
			{
				if string_char_at(text[textbox_frame],textbox_counter+i) == ")"
				{
					pos = textbox_counter+i
					break
				}
				word += string_char_at(text[textbox_frame],textbox_counter+i)
			}
			if pos!=-1
			{
				//show_debug_message(word)
				text[textbox_frame] = string_replace(text[textbox_frame],"(" +word+ ")","")	
				textbox_counter--
				if string_startswith("delay",word)
				{
					textbox_textstop = real(string_replace(word,"delay",""))*60
				}
			}
		}
		
	}*/
}