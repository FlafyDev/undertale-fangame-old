switch (textNum) {

	case 0:
		text = [
			"* (Seems like a regular training dummy.)",
			"* (Do you want to beat it up?)",
			"* (You stare into each other's eyes\n  for a moment...)",
			"* (You punch the dummy at full force.)",
			"* (Feels good.)"
		]
		questions = [["Yes", "No", 1, true]]
		if array_length_1d(answer) != 0
			if answer[1]==0 {
				text = removeArraySlot(text, [2])
				hitType = 1
			}
			else {
				text = removeArraySlot(text, [3,4])
				hitType = 2
			}
		if textbox_ended = true {
			textNum = 1
			textbox_ended = false
		}
	break;
	case 1:
		text = [
			"* (You've had enough of the dummy.)"
		]
		textbox_ended = false
	break;
	case 2:
		text = [		
			"* Hahaha...<delay?0.5>\n* It's just like you to run away.", //if you don't talk
			"* FOOL!<delay?0.5>\n* You think you can hurt ME???", //hit
			"* Hahaha...<delay?0.5>\n* Too intimidated to fight\n  me, huh!?", //when you not hit
			"* I am a ghost that lives inside\n  a DUMMY.",	
			"* My cousin used to live inside a\n  DUMMY,<delay?0.5> too.\n* Until...",
			"* YOU CAME ALONG!",
			"* Not only did YOUR actions cause\n  them to leave their home...",
			"* But now all of their neighbors are gone,<delay?0.5> too!",
			"* Despicable.<delay?0.5>\n* Despicable!<delay?0.5>\n* DESPICABLE!!!",
			"* You're the worst person I've ever met!<delay?0.5>\n* I've NEVER been more mad!!!", //Madder
			"* Guooooohhhh!!!!<delay?0.5>\n* My mannequin levels are going OFF\n  THE CHARTS!!!" //flash
		]
		if hitType == 0
			text = removeArraySlot(text, [1,2])
		else if hitType == 1
			text = removeArraySlot(text, [0,2])
		else
			text = removeArraySlot(text, [0,1])
		questions = []
		
	break;
	case 3:
		text = [
			"* ...?", //Suprise
			"* This...<delay?0.5>\n* This feeling...?",
			"* Eureka.<delay?0.5>\n* Eureka!<delay?0.5>\n* EUREKA!<delay?0.5>", //smile
			"* Human.<delay?0.5>\n* That moment of unbridled emotion.",
			"* It allowed me to finally\n  fuse with my body!",
			"* I'm fully corporeal now!<delay?0.5>\n* My lifelong dream,<delay?0.5> realized!",
			"* In return,<delay?0.5> I guess I won't stomp you.",
			"* How's that sound?"
		]
	break;
}

if oFrisk.y<=321
{
	if steps == 80 {
		oFrisk.Sprite = oFrisk.sprites_y[0]
		oVariables.p_camera_track=[undefined,y]
		oVariables.p_camera_spd=1
		oVariables.p_camera_boreder=40
	}
	else if between(steps,300,320) {
		var a = (steps-300)/20+1
		oVariables.p_camera_spd=10
		oVariables.p_camera_boreder=0
		//show_debug_message(a)
		oVariables.p_camera_scale = a
		oVariables.p_camera_track=[x,y]
	}
	else if steps==370 {
		Sprite=sDummyMad
	}
	else if between(steps,460,480) {
		var a = 2-(steps-460)/20
		//show_debug_message_plus(a)
		oVariables.p_camera_scale = a
		oVariables.p_camera_track=[undefined,y]
	}
	else if between(steps,540,550) {
		var a = (steps-540)/2.5+1
		//show_debug_message(a)
		plusX+=irandom_range(-a,a)
		plusY+=irandom_range(-a,a)
		
	} 
	else if steps==551 {
		Sprite=-1
		instance_create_depth(x,y+28,depth-1,oWaterPillar)
	}
	else if between(steps,570,580) {
		oVariables.p_camera_spd=5
		oVariables.p_camera_track=oFrisk
	}
	else if steps == 610 {
		x = 544
		y = 256
		instance_create_depth(x,y+28,depth-1,oWaterPillar)
		Sprite = sDummyMad
		oFrisk.Sprite = oFrisk.sprites_y[1]
		plusX=0
	}
	var uparide = 65
	if between(steps,610,610+uparide) {
		//plusY = -(steps-610+1+wave(0, 10.0, 1.0, 0.0))
		plusY = -(steps-605+1)
	}
	if steps > 610+uparide { //flying
		if is_undefined(remeCurrentTime) {
			remeCurrentTime=current_time
		}
		var waeve = wave(0, 10.0, 1.0, 0.0,current_time-remeCurrentTime)
		plusY = -(uparide+waeve)
	}
	if steps > 610+uparide+40 {
		if textbox_frame == 7 && textNum == 2 {
			Sprite = sDummyMadToot
			SpriteSpeed = 0
			SpriteImg = 0
		}
		if textNum == 1 or textNum == 0 {
			textNum = 2
			textbox_enable = true
		}
		else if textNum == 2 {
			if textbox_ended {
				if msgDelay==0 {
					flash()
					Sprite = sDummySurprise
				}
				msgDelay++
				if msgDelay>=50 {
					textNum = 3
					textbox_enable = true
					textbox_ended = false
				}
			}
		}
		else if textNum == 3 {
			if textbox_frame==2
				Sprite = sDummyGlad
			if textbox_ended {
				flags_set("madDummyEnc",1)
				get_battle_heart_pos()
				global.BattleID = battle_GladDummy
				joinBattle(oFrisk.x, oFrisk.y, oFrisk.dir, _heart_fightpos_x, _heart_fightpos_y, false, c_red)
			}
		}
	}
	steps++
	oFrisk.moveable = false
}
show_debug_message(textbox_ended)