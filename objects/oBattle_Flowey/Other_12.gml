/// @desc Moves
switch (Fight)
{
	case 0:		
		if timer[0]!=-1
		{
			floweySprite=sFlowey_BattleWink
			timer_reset(0,-2)
		}
		if FightTimer=1
		{
			bullets=-1
			for (var i = 0; i<5; i++)
			{
				bullets[i] = instance_create_depth(room_width/2,room_height/2-40,depth+1,oFloweysFriendlinessPellets)
				bullets[i].spd=1.5
				bullets[i].image_xscale=1
				bullets[i].image_yscale=1
				bullets[i].targetx = locations_x[i]
				bullets[i].targety = locations_y[i]
				bullets[i].lastx=bullets[i].x
				bullets[i].lasty=bullets[i].y
				bullets[i].damage=19
			}
			timer_reset(0,-2)
		}
	break;
	case 1:
		if FightTimer<30
			floweySprite=sFlowey_BattleSassy
	break;
	case 2:
		if timer[0]!=-1
		{
			bullets=-1
			floweySprite=sFlowey_BattleNeutral
			for (var i = 0; i<5; i++)
			{
				bullets[i] = instance_create_depth(locations_x[i],locations_y[i],depth+1,oFloweysFriendlinessPellets)
				bullets[i].targetx = locations_x[i]
				bullets[i].targety = locations_y[i]
				bullets[i].lastx=bullets[i].x
				bullets[i].lasty=bullets[i].y
				bullets[i].spd=5
				bullets[i].damage=19
			}
			timer_reset(0,-2)
			bulletsgo=true
		}
		if FightTimer<30
			floweySprite=sFlowey_BattleMad
	break;
	case 4:
		oFlowey_bulletCrcleScript()
	break;
	case 5:
		//show_debug_message(FightTimer)
		if FightTimer=1800
		{
			with oFloweysFriendlinessPellets
				instance_destroy()
			floweyImageindex2=1
			global.pHp=global.pMaxHp;
		}
		if FightTimer=1700
		{
			floweySprite=sFlowey_BattleMad
		}
		
		if FightTimer<1601 && FightTimer>1499
		{
			if double(FightTimer,5)
				draw_sprite_ext(sToriel_Projectiles,0,864,170,2,2,0,c_white,1)
		}
		if FightTimer<1500 && FightTimer>1500-(abs(room_width/2-864)/4)
		{
			if FightTimer<1500-(abs(room_width/2-864)/4)+10
				floweySprite=sFlowey_BattleShocked2
			draw_sprite_ext(sToriel_Projectiles,(FightTimer % 16)/4,864+(FightTimer-1500)*4,170,2,2,0,c_white,1)	
			path_start(pth_floweyHit,8,path_action_stop,1)
		}
		if FightTimer<1500-(abs(room_width/2-864)/4)&&FightTimer>1230
		{
			floweySprite = sFlowey_BattleHurt
			floweyX = x
			floweyY = y
			floweyAngle++
		}
		if FightTimer<1230 && FightTimer>1230-(abs(room_width/2-1060)/4)
		{
			torielX=1060+(FightTimer-1230)*4
			torielSprite=sToriel_Carry
		}
		if FightTimer<1230-(abs(room_width/2-1060)/4)-30
		{
			FightTimer=0
		}
		if FightTimer>1800
		{
			bulletsgoALL=true
			floweySprite=sFlowey_BattleLaugh
			floweyImageindex2+=1/10
			with oFloweysFriendlinessPellets
			{
				//show_debug_message(distance_point(x,y,other.Heart_x,other.Heart_y))
				if distance_point(x,y,other.Heart_x,other.Heart_y) < 25
				{
					other.FightTimer=1801
					break
				}
			}
		}
	break;
	case 6:
		playerNewPos_x = flags_get("lastX")
		playerNewPos_y = flags_get("lastY")
		playerNewDir = flags_get("lastDir")
		exitBattleTo=rArea2;
}