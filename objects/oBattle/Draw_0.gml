draw_set_color(c_white)
draw_set_font(ft_8bito)

preStage=Stage

#region Only one time code in draw
if firsttimedraw==0
{
	firsttimedraw=1
	//remeMonstersMsgs = MonstersMsgs
}
#endregion

#region Variables

var move_x;
var move_x_once;
var move_y;
var move_y_once;
var btns = array_length_1d(btnSprites)
var dis = 100
var count = 0
var pos_x
var pos_y

var monDot = monstersDot
move_x_once = key_right_once - key_left_once
move_y_once = key_down_once - key_up_once
move_x = key_right - key_left
move_y = key_down - key_up

#endregion

#region Arena

if backSprite>=0
	draw_sprite(backSprite,0,480,249)

var arena_x1 = arena_x-arena_width/2
var arena_y1 = arena_y-arena_height/2
var arena_x2 = arena_x+arena_width/2
var arena_y2 = arena_y+arena_height/2

draw_rectangle(arena_x1-arena_thickness,arena_y1-arena_thickness,arena_x2+arena_thickness,arena_y2+arena_thickness,false)
draw_set_color(c_black)
draw_rectangle(arena_x1,arena_y1,arena_x2,arena_y2,false)

#endregion

#region Buttons

for (var i = 0; i<array_length_1d(btnPSize); i++)
{
	btnPSize[i] = lerp(btnPSize[i], i==btnSelect ? 0.2 : 0, 0.25)
}

if Stage = 0
	btnSelect=move_x_once+btnSelect>btns-1 ? 0 : (move_x_once+btnSelect<0 ? btns-1 : move_x_once+btnSelect)
for(var i = 0; i<btns; i++)
{
	if double(i,2)
	{
		count*=-1
		pos_x = dis*(i+1) 
	}
	else
	{
		count=-(count+1)
		pos_x = -pos_x
	}
	//show_message(count) //0 -1 +1 -2
	pos_y = btnPos_y
	
	var btnspr = btns/2+count
	draw_sprite_ext(btnSprites[btnspr],btnspr==btnSelect,btnPos_x+pos_x,pos_y,1.1+btnPSize[btnspr],1.1+btnPSize[btnspr],0,c_white,1)
	if btnSelect==btnspr && Stage = 0 {
		draw_sprite_ext(sprHeart,0,btnPos_x+pos_x-50,pos_y,1.1,1.1,0,heartColor,1)
		show_debug_message_plus(btnPos_x+pos_x-50,pos_y)
	}
}

if key_a_once && Stage == 0 {
	Stage = btnSelect+1==3 ? 5 : btnSelect+1
	if Stage==5&&ds_list_size(global.pItems)==0 {
		Stage=0
	}
}
//else if key_b_once && between(Stage,1, btns)
//	Stage = 0

#endregion

#region Player Information

draw_set_font(ft_Mars)
draw_set_color(c_white)

draw_text(player_info_x, player_info_y-3, string(HeartName))

draw_text(player_info_x+115, player_info_y-3, "     LV  " + string(global.pLevel))

draw_text(player_info2_x+40+2*global.pMaxHp+30, player_info_y-3, string(global.pHp) + " / " + string(global.pMaxHp))

draw_set_font(ft_MarsTiny)
draw_text(player_info2_x, player_info_y, "HP")
draw_healthbar(player_info2_x+40, player_info_y-2, player_info2_x+40+2*global.pMaxHp, player_info_y+20, (global.pHp / global.pMaxHp) * 100, make_color_rgb(255, 0, 0), c_yellow, c_yellow, 0, true, 0)

draw_set_color(c_black)
draw_set_font(ft_8bito)

#endregion

#region Custom Draw ( monsters etc... )

event_user(3)

#endregion

#region Text and Acts

draw_set_color(c_white)

if preStage!=Stage
{
	countText=0
	undertale_pack = undertale_pack_create(0.5, true)
}
else
{
	countText+=0.5
}

if Stage = 0 //main
{	
	spareSelect=0
	Fought=0
	spared=0
	actSelect=0
	
	var gtTxt = gameText[useText]
	//gtTxt = string_replace_all(gtTxt," ",space)
	//draw_text(arena_x1+15,arena_y1+16,string_copy(gtTxt,0,countText))
	undertale_pack = draw_text_undertale(gtTxt, arena_x1+15, arena_y1+16, undertale_pack)
	if key_b_once
	{
		undertale_pack[0]=undertale_length_text(gtTxt)+1
	}
	monstersSelect=0
	//timer_reset()
}
else if Stage = 1 //select monster for fight
{
	var names = array_length_1d(monsters)
	var modeCounter = 0
	for (var i = 0; i<names; i++)
	{
		if monsters[i].mode!=0 {
			modeCounter++
			continue
		}
		if monsters[i].spare=true
			draw_set_color(c_yellow)
		//draw_text(arena_x1+FightPos_x,arena_y1+FightPos_y[i-modeCounter],monDot + monsters[i].name)
		undertale_pack_noTxtCount = draw_text_undertale(monDot + monsters[i].name, arena_x1+FightPos_x,arena_y1+FightPos_y[i-modeCounter], undertale_pack_noTxtCount)
		draw_set_color(c_white)
		draw_healthbar(arena_x1+FightPos_x+140+200, arena_y1+FightPos_y[i-modeCounter]+10, arena_x1+FightPos_x+250+200, arena_y1+FightPos_y[i-modeCounter]+25,monsters[i].hp/monsters[i].maxhp*100, make_color_rgb(255, 0, 0), make_color_rgb(0, 255, 0), make_color_rgb(0, 255, 0), 0, true, 0)
		if monstersSelect == i-modeCounter
		{
			draw_sprite_ext(sprHeart,0,arena_x1+FightPos_x-24,arena_y1+FightPos_y[i-modeCounter]+16,1,1,0,heartColor,1)	
		}
	}
	monstersSelect=move_y_once+monstersSelect>names-1-modeCounter ? 0 : (move_y_once+monstersSelect<0 ? names-1-modeCounter : move_y_once+monstersSelect)
	
	if preStage == Stage
	{
		if key_a_once
		{
			Stage = 3
			FightPos=0
			HitShake = 2.5
			FightEffectCounter = 0
			subimg_stick = 0
			missed = 0
		}
		else if key_b_once
		{
			Stage = 0
		}
	}
}
else if Stage = 3 //Fight
{
	if !FightHit
		FightPos+=FightSpd
	draw_sprite(sAttackBar,0,90,258)
	
	
	var mon = monsters[monstersSelect]
	
	var def = mon.defense-0.1 //monster's defense
	var damagedeal = ( (sin(pi*(2*(FightPos/770)-0.5))+1) * ((global.pAttack+2)*3) / power(def,1/4) )*2 + 1
	damagedeal = round(damagedeal)
	
	if key_a_once && (FightHit==0 && missed==0)
	{
		FightHit = 1
		FightMonHp=mon.hp
		BeforeDownHp = mon.hp
		mon.hp-=clamp(damagedeal,0,BeforeDownHp)
		delay=0
	}
	if (FightHit==0 && missed==0) {
		delay=0
	}
	
	
	missed=FightPos>780
	
	if FightHit
	{
		subimg_stick+=stick_spdimg
		if FightMonHp>mon.hp
		{
			FightEffectCounter+=FightEffectSpd
			if FightEffectCounter<sprite_get_number(FightEffectSprite)
				draw_sprite(FightEffectSprite, FightEffectCounter, mon.x, mon.y+10)
			FightMonHp-=clamp(damagedeal,0,BeforeDownHp)/FightHpDownTime
			if global.vEight HitShake*=-1
		}
		else
		{
			HitShake=0
			delay+=1
			if delay>60
			{
				if mon.hp<=0 {
					mon.mode=1
					var everyoneGone = true
					for (var i = 0; i<array_length_1d(monsters); i++)
						everyoneGone=mon.mode
					if everyoneGone>=1
						Stage=14
					else
						Stage=11
				} else
					Stage=11
				FightHit=0
				countText=0
				Fought=2
			}
		}
		draw_set_font(ft_hachicro)
		draw_set_color(c_red)
		draw_set_halign(fa_middle)
		draw_set_valign(fa_bottom)
		draw_text(mon.x,mon.y-13,damagedeal)
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		draw_set_color(c_white)
		draw_set_font(ft_8bito)
		draw_healthbar(mon.x-FightHpBar_Width/2, mon.y-10, mon.x+FightHpBar_Width/2, mon.y+5, FightMonHp/mon.maxhp*100,make_color_rgb(64, 64, 64),make_color_rgb(0, 255, 0),make_color_rgb(0, 255, 0),0,true,true)
	}
	else if missed {
		Fought=1
		draw_set_font(ft_hachicro)
		draw_set_color(c_gray)
		draw_set_halign(fa_middle)
		draw_set_valign(fa_bottom)
		draw_text(mon.x,mon.y+7,"MISS")
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		draw_set_color(c_white)
		draw_set_font(ft_8bito)
			delay+=1
			if delay>60
			{
				if mon.hp<=0 {
					mon.mode=1
					var everyoneGone = true
					for (var i = 0; i<array_length_1d(monsters); i++)
						if monsters[i].mode==0 {
							everyoneGone=false
							break
						}
					if everyoneGone>=1
						Stage=14
					else
						Stage=11
				} else
					Stage=11
				FightHit=0
				countText=0
			}
	}
	if !missed
		draw_sprite_ext(stick_sprite,subimg_stick,arena_x1+FightPos,arena_y1,1,1,0,c_white,1) //arena_x1+FightPos,arena_y1,arena_x1+FightPos+5,arena_y2,false
	//draw_text(arena_x1+FightPos+30,arena_y1-10,damagedeal)
	
}
else if Stage = 2 //select monster for act
{
	var names = array_length_1d(monsters)
	var modeCounter = 0
	for (var i = 0; i<names; i++)
	{
		if monsters[i].mode!=0 {
			modeCounter++
			continue
		}
		if monsters[i].spare=true
			draw_set_color(c_yellow)
		//draw_text(arena_x1+FightPos_x,arena_y1+FightPos_y[i-modeCounter],monDot + monsters[i].name)
		undertale_pack_noTxtCount = draw_text_undertale(monDot + monsters[i].name, arena_x1+FightPos_x,arena_y1+FightPos_y[i-modeCounter], undertale_pack_noTxtCount)
		draw_set_color(c_white)
		//draw_healthbar(arena_x1+FightPos_x+140+200, arena_y1+FightPos_y[i-modeCounter]+10, arena_x1+FightPos_x+250+200, arena_y1+FightPos_y[i-modeCounter]+25,monsters[i].hp/monsters[i].maxhp*100, make_color_rgb(255, 0, 0), make_color_rgb(0, 255, 0), make_color_rgb(0, 255, 0), 0, true, 0)
		if monstersSelect == i-modeCounter
		{
			draw_sprite_ext(sprHeart,0,arena_x1+FightPos_x-24,arena_y1+FightPos_y[i-modeCounter]+16,1,1,0,heartColor,1)
		}
	}
	monstersSelect=move_y_once+monstersSelect>names-1-modeCounter ? 0 : (move_y_once+monstersSelect<0 ? names-1-modeCounter : move_y_once+monstersSelect)
	
	if preStage == Stage
	{
		if key_a_once
		{
			undertale_pack = undertale_pack_create(0.5, true)
			Stage = 9
		}
		else if key_b_once
		{
			Stage = 0
		}
	}
}
else if Stage = 4 //spare
{
	var nums = 2
	var modeCounter = 0
	var sparetxt = spareTexts
	//for (var i = 0; i<array_length_1d(sparetxt); i++)
	//	sparetxt[i]= string_replace_all(sparetxt[i]," ",space)
		
	var canSpare = false
	for (var i = 0; i<array_length_1d(monsters); i++)
		if monsters[i].spare==true {
			canSpare = true
			break
		}
		
	for (var i = 0; i<nums; i++)
	{
		if flee==false&&i=1 {
			modeCounter++
			continue
		}
		var txtcol = c_white
		if canSpare&&i=0 
			txtcol = c_yellow
		draw_set_color(txtcol)
		//draw_text(arena_x1+FightPos_x,arena_y1+FightPos_y[i-modeCounter],sparetxt[i])
		undertale_pack_noTxtCount = draw_text_undertale(sparetxt[i], arena_x1+FightPos_x,arena_y1+FightPos_y[i-modeCounter], undertale_pack_noTxtCount)
		draw_set_color(c_white)
		if spareSelect == i-modeCounter
		{
			draw_sprite_ext(sprHeart,0,arena_x1+FightPos_x-24,arena_y1+FightPos_y[i-modeCounter]+16,1,1,0,heartColor,1)	
		}
	}
	if move_y_once!=0&&flee=true
		spareSelect=!spareSelect
	
	if preStage == Stage
	{
		if key_a_once
		{
			if spareSelect==0 {
				for (var i = 0; i<array_length_1d(monsters); i++)
					if monsters[i].spare==true
						monsters[i].mode=2
				
				var everyoneGone = true
				for (var i = 0; i<array_length_1d(monsters); i++)
					if monsters[i].mode==0 {
						everyoneGone=false
						break
					}
				if everyoneGone>=1
					Stage=14
				else
					Stage=11
				spared=true
			}
			else if spareSelect==1 {
				Stage=15
			}
			countText=0
			undertale_pack = undertale_pack_create(0.5, true)
		}
		else if key_b_once
		{
			Stage = 0
		}
	}
}
else if Stage = 5 //items
{
	
}
else if Stage = 9 //select act
{
	var acts = array_length_1d(monsters[monstersSelect].actText)
	for (var i = 0; i<acts; i++)
	{
		//draw_text(arena_x1+TextPos_x[i],arena_y1+TextPos_y[i],monsters[monstersSelect].actText[i])
		undertale_pack_noTxtCount = draw_text_undertale(monsters[monstersSelect].actText[i], arena_x1+TextPos_x[i], arena_y1+TextPos_y[i], undertale_pack_noTxtCount)
		if actSelect == i
		{
			draw_sprite_ext(sprHeart,0,arena_x1+TextPos_x[i]-24,arena_y1+TextPos_y[i]+16,1,1,0,heartColor,1)	
		}
	}
	
	if move_y_once=1 && between(actSelect,0,1)
		actSelect+=2
	if move_y_once=-1 && between(actSelect,2,3)
		actSelect-=2
	actSelect=move_x_once+actSelect>acts-1 ? 0 : (move_x_once+actSelect<0 ? acts-1 : move_x_once+actSelect)
	if preStage == Stage
	{
		if key_a_once
		{
			Stage = 10
			monsters[monstersSelect].actTimes[actSelect]++
			undertale_pack = undertale_pack_create(0.5, true)
			countText = 0
		}
		else if key_b_once
		{
			Stage = 2
			actSelect=0
		}
	}
}
if Stage = 10 //msg
{		
	if MsgSelect==-1 
	{
		Stage = 11
	}
	else
	{
/*		var textt = remeMsgs[MsgSelect]
		if string_char_at(textt,countText)=="("
		{
			var pos = -1
			var word=""
			for(var ii = 1; ii<string_length(textt)-countText+1; ii++)
			{
				if string_char_at(textt,countText-1) == "+" {
					break
				} else {
					pos = countText+ii
					break
				}
				word += string_char_at(textt,countText+ii)
			}
			if pos!=-1
			{
				//show_debug_message(word)
				textt = string_replace(textt,"(" +word+ ")","")	
				//var arrayhandler = string_split("<c>",MonstersMsgs[i],true);
				//arrayhandler[MonstersMsgsPage] = textt
				//MonstersMsgs[i] = string_unsplit("<c>", arrayhandler, true)
				countText--
				if string_startswith("delay",word)
				{
					countTextStop = real(string_replace(word,"delay",""))*60
					//show_message(countTextStop)
				}
			}
		}
		
		if string_char_at(textt,countText)=="<"
		{
			var pos = -1
			var word=""
			for(var ii = 1; ii<string_length(textt)-countText+1; ii++)
			{
				if string_char_at(textt,countText+ii) == ">"
				{
					pos = countText+ii
					break
				}
				word += string_char_at(textt,countText+ii)
			}
			if pos!=-1
			{
				//show_debug_message(string(word) + " " + string(pos) + " " + string(countText))
				if word!="c"
					countText=pos
			}
		}
		remeMsgs[MsgSelect]=textt*/
		//ATEX_draw(arena_x1+15,arena_y1+13,string_copy(remeMsgs[MsgSelect],0,countText),10000,fa_left)
		undertale_pack = draw_text_undertale(Msgs[MsgSelect], arena_x1+15, arena_y1+13, undertale_pack)
		//while string_char_at(remeMsgs[MsgSelect],countText)==" "
		//{
		//	countText++
		//}
		if key_b_once
		{
			undertale_pack[0] = undertale_length_text(Msgs[MsgSelect])+1
			/*countText=string_length(remeMsgs[MsgSelect])
			var pos = -2
			while pos !=-1
			{
				var searchfrom = 0
				for (var i=0; i<string_length(remeMsgs[MsgSelect]); i++)
				{
					if string_char_at(remeMsgs[MsgSelect],i) == "("
					{
						searchfrom=i
						break	
					}
				}
				pos=-1
				var word=""
				for(var i = 1; i<string_length(remeMsgs[MsgSelect])-searchfrom+1; i++)
				{
					if string_char_at(remeMsgs[MsgSelect],searchfrom+i) == ")"
					{
						pos = searchfrom+i
						break
					}
					word += string_char_at(remeMsgs[MsgSelect],searchfrom+i)
				}
				if pos!=-1
				{
					remeMsgs[MsgSelect] = string_replace(remeMsgs[MsgSelect],"(" +word+ ")","")	
				}
			}*/
		
		}
		if key_a_once && undertale_pack[0]>undertale_length_text(Msgs[MsgSelect]) && preStage==Stage
		{
			Stage = 11
		}
	}
}
if Stage == 11 //before fighing, changing the arena size if ineeded
{
	undertale_pack = undertale_pack_create(0.5, true)
	MonstersMsgsPage=0
	Stage += (arena_width==arena_width_to && arena_height == arena_height_to)/2

	for (var i = 0; i<arena_change_spd; i++)
	{
		arena_width += (arena_width < arena_width_to)

		arena_width-= (arena_width > arena_width_to)

		arena_height += (arena_height < arena_height_to && arena_width==arena_width_to)

		arena_height -= (arena_height > arena_height_to && arena_width==arena_width_to)
	}
		
	Heart_x = arena_x
	Heart_y = arena_y
}
if Stage == 11.5 && preStage == Stage //before, monsters msg
{
	draw_set_font(MonstersMsgsFont)
	var MonstersMsgsPages;
	var Skip = true
	var noBubbles = true
	//var noText = true
	var maxMsgsPages = 0
	for(var i=0; i<array_length_1d(MonstersMsgsSelect); i++)
	{
		//show_message(string(MonstersMsgsSelect) + " " + string(MonstersMsgsSelect[i]) + " " + string(i))
		if MonstersMsgsSelect[i]==0 continue
		noBubbles=false
		//noText=false
		MonstersMsgsPages[i]=string_count("<c>",MonstersMsgs[i])
		if MonstersMsgsPages[i]<MonstersMsgsPage continue
		var poss = MonstersMsgsPos[i]
		var textt
		textt = string_split("<c>",MonstersMsgs[i],true);
		textt = textt[MonstersMsgsPage]
		
	/*	if string_char_at(textt,countText)=="("
		{
			var pos = -1
			var word=""
			for(var ii = 1; ii<string_length(textt)-countText+1; ii++)
			{
				if string_char_at(textt,countText+ii) == ")"
				{
					if string_char_at(textt,countText-1) == "+" {
						break
						//textt = string_delete(textt,countText-1,countText-1)
					} else {
						pos = countText+ii
						break
					}
				}
				word += string_char_at(textt,countText+ii)
			}
			if pos!=-1
			{
				//show_debug_message(word)
				textt = string_replace(textt,"(" +word+ ")","")	
				var arrayhandler = string_split("<c>",remeMonstersMsgs[i],true);
				arrayhandler[MonstersMsgsPage] = textt
				remeMonstersMsgs[i] = string_unsplit("<c>", arrayhandler, true)
				countText--
				if string_startswith("delay",word)
				{
					countTextStop = real(string_replace(word,"delay",""))*60
					//show_message(countTextStop)
				}
			}
		}
		
		if string_char_at(textt,countText)=="<"
		{
			var pos = -1
			var word=""
			for(var ii = 1; ii<string_length(textt)-countText+1; ii++)
			{
				if string_char_at(textt,countText+ii) == ">"
				{
					pos = countText+ii
					break
				}
				word += string_char_at(textt,countText+ii)
			}
			if pos!=-1
			{
				//show_debug_message(string(word) + " " + string(pos) + " " + string(countText))
				if word!="c"
					countText=pos
			}
		}*/
		
		#region Bubble
		var bubbleX = poss[0]
		var bubbleY = poss[1]
		var bubbleArrowSide = MonstersMsgsArrow[i] //0 = right --- 1 = up --- 2 = left --- 3 = down
		var bubbleSpr = sBubbleBox
		draw_set_font(MonstersMsgsFont)
		draw_set_color(c_black)
		var bubbleText = textt
		/*
		var pos = -2
		while pos !=-1
		{
			var searchfrom = -1
			for (var ii=0; ii<string_length(bubbleText); ii++)
			{
				if string_char_at(bubbleText,ii) == "("
				{
					if string_char_at(bubbleText,ii-1) == "+" {
						bubbleText = string_delete(bubbleText,ii-1,ii-1)
					} else {
						searchfrom=ii
						break
					}
				}
			}
			if searchfrom==-1
				break
			pos=-1
			var word=""
			for(var ii = 1; ii<string_length(bubbleText)-searchfrom+1; ii++)
			{
				if string_char_at(bubbleText,searchfrom+ii) == ")"
				{
					pos = searchfrom+ii
					break
				}
				word += string_char_at(bubbleText,searchfrom+ii)
			}
			if pos!=-1
			{
				bubbleText = string_replace(bubbleText,"(" +word+ ")","")
			}
		}*/

		var bubblePartWidth = sprite_get_width(bubbleSpr)
		var bubblePartHeight = sprite_get_height(bubbleSpr)
		
		var bubbleTextSpaceX = bubblePartWidth-5
		var bubbleTextSpaceY = bubblePartHeight-5
		var bubbleWidth = undertale_width_text(bubbleText, 0)+2*bubbleTextSpaceX
		var bubbleHeight = undertale_height_text(bubbleText, 0)+2*bubbleTextSpaceY+10
		if MonstersBubble_width<0
		{
			bubbleWidth = bubbleWidth<bubblePartWidth*2 ? bubblePartWidth*2 : bubbleWidth
			bubbleHeight = bubbleHeight<bubblePartHeight*2 ? bubblePartHeight*2 : bubbleHeight
		}
		else
		{
			bubbleWidth = MonstersBubble_width
			bubbleHeight = MonstersBubble_height
		}
		var bubbleArrowPosX = [bubbleWidth,	bubbleWidth/2,	0,		bubbleWidth/2]
		var bubbleArrowPosY = [bubbleHeight/2,0,		bubbleHeight/2,	bubbleHeight]



		for (var ii = 0; ii<2; ii++)
		{
			var down = (bubbleHeight)*ii
			// top and bottom left
			draw_sprite_ext(bubbleSpr,0,bubbleX,bubbleY+down,1,(ii*2-1)/-1,0,c_white,1)

			// top and bottom middle
			draw_sprite_ext(bubbleSpr,1,bubbleX+bubblePartWidth,bubbleY+down,bubbleWidth-2*bubblePartWidth,(ii*2-1)/-1,0,c_white,1)

			// top and bottom right
			draw_sprite_ext(bubbleSpr,0,bubbleX+bubbleWidth,bubbleY+down,-1,(ii*2-1)/-1,0,c_white,1)
		}

		// center
		draw_sprite_ext(bubbleSpr,1,bubbleX,bubbleY+bubblePartHeight,bubbleWidth,(bubbleHeight-2*bubblePartHeight)/bubblePartHeight,0,c_white,1)

		draw_sprite_ext(bubbleSpr,2,bubbleX+bubbleArrowPosX[bubbleArrowSide],bubbleY+bubbleArrowPosY[bubbleArrowSide],1,1,bubbleArrowSide*90,c_white,1)

		//ATEX_draw(bubbleX+bubbleTextSpaceX,bubbleY+bubbleTextSpaceY,string_copy(bubbleText,0,countText),-1,0)
		undertale_pack[5] = false
		undertale_pack = draw_text_undertale(bubbleText, bubbleX+bubbleTextSpaceX, bubbleY+bubbleTextSpaceY, undertale_pack)
		undertale_pack[5] = true
		#endregion
	
		if undertale_pack[0]<=undertale_length_text(bubbleText)
			Skip=false
		if maxMsgsPages<MonstersMsgsPages[i]
			maxMsgsPages=MonstersMsgsPages[i]
	}
	if Skip && key_a_once
	{
		MonstersMsgsPage++
		undertale_pack = undertale_pack_create(0.5, true)
	}
	if MonstersMsgsPage>maxMsgsPages or noBubbles
	{
		Stage+=1/2
	}
	if key_b_once && MonstersMsgsSkip
	{
		undertale_pack[0] = undertale_length_text(bubbleText)+1
	}
	hitboxHeart = MonstersMsgsMoveableHeart
	moveableHeart = MonstersMsgsMoveableHeart
	enableHeart=true
	draw_set_font(ft_8bito)
	draw_set_color(c_white)
}
if Stage == 12 //Fight
{
	hitboxHeart = true
	moveableHeart = true
	undertale_pack = undertale_pack_create(0.5, true)
	if preStage == Stage event_user(2)
	arena_width_to=arena_width_default
	arena_height_to=arena_height_default
	
	//show_debug_message( string(FightTimer) + " " + string(between(FightTimer,noone+1,0)) + " " + string(noone+1))
	
	Stage += (between(FightTimer,noone+1,0))/2
	undertale_pack = undertale_pack_create(0.5, true)
	MonstersMsgsPage=0
	FightTimer-=FightTimer>0
}
else if Stage == 12.5 && preStage == Stage//after, monsters msg
{
	draw_set_font(MonstersMsgsFont)
	var MonstersMsgsPages;
	var Skip = true
	var noBubbles = true
	//var noText = true
	var maxMsgsPages = 0
	if MonstersMsgsDisableAfterBattle==false
		for(var i=0; i<array_length_1d(MonstersMsgsSelect); i++)
		{
			//show_message(string(MonstersMsgsSelect) + " " + string(MonstersMsgsSelect[i]) + " " + string(i))
			if MonstersMsgsSelect[i]==0 continue
			noBubbles=false
			//noText=false
			MonstersMsgsPages[i]=string_count("<c>",MonstersMsgs[i])
			if MonstersMsgsPages[i]<MonstersMsgsPage continue
			var poss = MonstersMsgsPos[i]
			var textt
			textt = string_split("<c>",MonstersMsgs[i],true);
			textt = textt[MonstersMsgsPage]
		
		/*	if string_char_at(textt,countText)=="("
			{
				var pos = -1
				var word=""
				for(var ii = 1; ii<string_length(textt)-countText+1; ii++)
				{
					if string_char_at(textt,countText+ii) == ")"
					{
						if string_char_at(textt,countText-1) == "+" {
							break
							//textt = string_delete(textt,countText-1,countText-1)
						} else {
							pos = countText+ii
							break
						}
					}
					word += string_char_at(textt,countText+ii)
				}
				if pos!=-1
				{
					//show_debug_message(word)
					textt = string_replace(textt,"(" +word+ ")","")	
					var arrayhandler = string_split("<c>",remeMonstersMsgs[i],true);
					arrayhandler[MonstersMsgsPage] = textt
					remeMonstersMsgs[i] = string_unsplit("<c>", arrayhandler, true)
					countText--
					if string_startswith("delay",word)
					{
						countTextStop = real(string_replace(word,"delay",""))*60
						//show_message(countTextStop)
					}
				}
			}
		
			if string_char_at(textt,countText)=="<"
			{
				var pos = -1
				var word=""
				for(var ii = 1; ii<string_length(textt)-countText+1; ii++)
				{
					if string_char_at(textt,countText+ii) == ">"
					{
						pos = countText+ii
						break
					}
					word += string_char_at(textt,countText+ii)
				}
				if pos!=-1
				{
					//show_debug_message(string(word) + " " + string(pos) + " " + string(countText))
					if word!="c"
						countText=pos
				}
			}*/
		
			#region Bubble
			var bubbleX = poss[0]
			var bubbleY = poss[1]
			var bubbleArrowSide = MonstersMsgsArrow[i] //0 = right --- 1 = up --- 2 = left --- 3 = down
			var bubbleSpr = sBubbleBox
			draw_set_font(MonstersMsgsFont)
			draw_set_color(c_black)
			var bubbleText = textt
			/*
			var pos = -2
			while pos !=-1
			{
				var searchfrom = -1
				for (var ii=0; ii<string_length(bubbleText); ii++)
				{
					if string_char_at(bubbleText,ii) == "("
					{
						if string_char_at(bubbleText,ii-1) == "+" {
							bubbleText = string_delete(bubbleText,ii-1,ii-1)
						} else {
							searchfrom=ii
							break
						}
					}
				}
				if searchfrom==-1
					break
				pos=-1
				var word=""
				for(var ii = 1; ii<string_length(bubbleText)-searchfrom+1; ii++)
				{
					if string_char_at(bubbleText,searchfrom+ii) == ")"
					{
						pos = searchfrom+ii
						break
					}
					word += string_char_at(bubbleText,searchfrom+ii)
				}
				if pos!=-1
				{
					bubbleText = string_replace(bubbleText,"(" +word+ ")","")
				}
			}*/

			var bubblePartWidth = sprite_get_width(bubbleSpr)
			var bubblePartHeight = sprite_get_height(bubbleSpr)
		
			var bubbleTextSpaceX = bubblePartWidth-5
			var bubbleTextSpaceY = bubblePartHeight-5
			var bubbleWidth = undertale_width_text(bubbleText, 0)+2*bubbleTextSpaceX
			var bubbleHeight = undertale_height_text(bubbleText, 0)+2*bubbleTextSpaceY+10
			if MonstersBubble_width<0
			{
				bubbleWidth = bubbleWidth<bubblePartWidth*2 ? bubblePartWidth*2 : bubbleWidth
				bubbleHeight = bubbleHeight<bubblePartHeight*2 ? bubblePartHeight*2 : bubbleHeight
			}
			else
			{
				bubbleWidth = MonstersBubble_width
				bubbleHeight = MonstersBubble_height
			}
			var bubbleArrowPosX = [bubbleWidth,	bubbleWidth/2,	0,		bubbleWidth/2]
			var bubbleArrowPosY = [bubbleHeight/2,0,		bubbleHeight/2,	bubbleHeight]



			for (var ii = 0; ii<2; ii++)
			{
				var down = (bubbleHeight)*ii
				// top and bottom left
				draw_sprite_ext(bubbleSpr,0,bubbleX,bubbleY+down,1,(ii*2-1)/-1,0,c_white,1)

				// top and bottom middle
				draw_sprite_ext(bubbleSpr,1,bubbleX+bubblePartWidth,bubbleY+down,bubbleWidth-2*bubblePartWidth,(ii*2-1)/-1,0,c_white,1)

				// top and bottom right
				draw_sprite_ext(bubbleSpr,0,bubbleX+bubbleWidth,bubbleY+down,-1,(ii*2-1)/-1,0,c_white,1)
			}

			// center
			draw_sprite_ext(bubbleSpr,1,bubbleX,bubbleY+bubblePartHeight,bubbleWidth,(bubbleHeight-2*bubblePartHeight)/bubblePartHeight,0,c_white,1)

			draw_sprite_ext(bubbleSpr,2,bubbleX+bubbleArrowPosX[bubbleArrowSide],bubbleY+bubbleArrowPosY[bubbleArrowSide],1,1,bubbleArrowSide*90,c_white,1)

			//ATEX_draw(bubbleX+bubbleTextSpaceX,bubbleY+bubbleTextSpaceY,string_copy(bubbleText,0,countText),-1,0)
			undertale_pack[5] = false
			undertale_pack = draw_text_undertale(bubbleText, bubbleX+bubbleTextSpaceX, bubbleY+bubbleTextSpaceY, undertale_pack)
			undertale_pack[5] = true
			#endregion
	
			if undertale_pack[0]<=undertale_length_text(bubbleText)
				Skip=false
			if maxMsgsPages<MonstersMsgsPages[i]
				maxMsgsPages=MonstersMsgsPages[i]
		}
	if Skip && key_a_once
	{
		MonstersMsgsPage++
		undertale_pack = undertale_pack_create(0.5, true)
	}
	if MonstersMsgsPage>maxMsgsPages or noBubbles
	{
		Stage+=1/2
	}
	if key_b_once && MonstersMsgsSkip
	{
		undertale_pack[0] = undertale_length_text(bubbleText)+1
	}
	hitboxHeart = false
	moveableHeart = MonstersMsgsMoveableHeart
	draw_set_font(ft_8bito)
	draw_set_color(c_white)
}
if Stage == 13 //after fighing, changing the arena size if ineeded
{
	enableHeart=false
	Stage = arena_width==arena_width_to && arena_height == arena_height_to ? 0 : Stage
	for (var i = 0; i<arena_change_spd; i++)
	{
		arena_width += (arena_width < arena_width_to)

		arena_width-= (arena_width > arena_width_to)

		arena_height += (arena_height < arena_height_to && arena_width==arena_width_to)

		arena_height -= (arena_height > arena_height_to && arena_width==arena_width_to)
	}
	undertale_pack = undertale_pack_create(0.5, true)
}
if Stage=14 //Winning 
{
	var wintext = string_split("<c>",winMsg, true)
	var pages = array_length_1d(wintext)-1
	wintext = wintext[clamp(winPage,0,pages)]
	wintext = string_replace_all(wintext,"{xp}",string(gainedXP))
	wintext = string_replace_all(wintext,"{gold}",string(gainedGOLD))
	//draw_text(arena_x1+15,arena_y1+13,string_copy(wintext,0,countText))
	undertale_pack = draw_text_undertale(wintext, arena_x1+15, arena_y1+13, undertale_pack)
	if undertale_pack[0]>undertale_length_text(wintext)&&key_a_once {
		winPage++
		if winPage>pages { // if there are not any pages left
			winAction = true
		} else {
			undertale_pack = undertale_pack_reset(undertale_pack)
		}
	}
}
if Stage=15 { //fleeing
	var fleetxt = fleeMessages[fleeMessageSelect]
	//draw_text(arena_x1+FightPos_x,arena_y1+FightPos_y[0],fleetxt)
	undertale_pack_noTxtCount = draw_text_undertale(fleetxt, arena_x1+FightPos_x, arena_y1+FightPos_y[0], undertale_pack_noTxtCount)
	if countText>fleeDelay
		fleeAction = true
	draw_sprite_ext(sprHeartFlee,countText/3,arena_x1+FightPos_x-24-countText*3,arena_y1+FightPos_y[1]+16,1,1,0,heartColor,1)	
}
/*
if Stage!=11.5 && Stage!=12.5 {
	remeMonstersMsgs = MonstersMsgs
}
if Stage!=10 {
	for (var i = 0; i<array_length_1d(Msgs); i++)
	{
		remeMsgs[i] = string_replace_all(Msgs[i]," ",space)
	}
}
*/
#endregion
//if Stage>12 && preStage == Stage
//show_debug_message(string(Stage) + " >>>>> " + string(preStage))

#region arena surface

	var surface_x = arena_x-arena_width/2
	var surface_y = arena_y-arena_height/2
	draw_surface(arena_surface,surface_x,surface_y)

#endregion

#region Heart control

if enableHeart
{
	if moveableHeart
	{
		Heart_x += move_x*Heart_spd
		Heart_y += move_y*Heart_spd
	}

	Heart_x = clamp(Heart_x,arena_x1+bboxLeftHeart,arena_x2-bboxRightHeart)
	Heart_y = clamp(Heart_y,arena_y1+bboxUpHeart,arena_y2-bboxDownHeart)

	if double(floor(HeartInvisibility/10),2)
		draw_sprite_ext(sprHeart,0,Heart_x,Heart_y,1,1,0,heartColor,1)
	
	var boxleft = Heart_x-bboxLeftHeart
	var boxup = Heart_y-bboxUpHeart
	var boxright = Heart_x+bboxRightHeart
	var boxdown = Heart_y+bboxDownHeart
	
	damage = 0
	HeartInvisibility-=HeartInvisibility>0
	if HeartInvisibility==0
	if hitboxHeart
		with oBattleBullet
		{
			//show_message(	string(bbox_left) + " " + string(bbox_right) + " " + string(bbox_top) + " " + string(bbox_bottom) + "\n" +
			//		string(x) + " " + string(x+8) + " " + string(y) + " " + string(y+8)
			//		)
			if rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, boxleft, boxup, boxright, boxdown)
			{
				other.damage = damage
				if hitdestroy instance_destroy()
				if invisibility=true
				{
					other.HeartInvisibility=other.HeartInvisTime
					break;
				}
			}
		}
	global.pHp -= damage
	
	
}
else
{
	HeartInvisibility=0	
}
#endregion
/*//debug


draw_text(0,0,	  "1. "+string(FightTimer) + "\n2. " +
			//string(maxhp) + "\n3. " +
			//string(monsters) + "\n4. " +
			//string(monstersName) + "\n5. " +
			string(actSelect) + "\n6. " +
			//string(floweyStages) + "\n7. " +
			string(Stage) + "\n8. " +
			//string("none") + "\n9. " +
			string(monsters[0].spare)
)//*/