/// @desc STEP what to do when x is y

//show_message(Heart_x)
//show_message(Heart_y)

MonstersMsgsSkip = true

var currectfloweymsg = ""
if Stage==11.5 && firsttimedraw
for(var i = 0; i<array_length_1d(MonstersMsgsSelect); i++)
{
	if MonstersMsgsSelect[i]==1
	{
		currectfloweymsg = MonstersMsgs[i]
		currectfloweymsg = string_split("<c>",currectfloweymsg,false)
		currectfloweymsg = currectfloweymsg[MonstersMsgsPage]
		break
	}
}

if Stage<12 //			prev attack
{
	if Stage==0
	{
		Stage=11.5
		if floweyStages=8
		{
			floweyStages=5
		}
		else
		{
			floweyStages++
		}
		timer_reset(0,0)	
	}
	switch(floweyStages)
	{
		case 0:
			MonstersMsgsSelect = [1]
			FightTimer = 100
			Fight=0
		break;
		case 1:
			Fight=1
			MonstersMsgsSelect = [0,1]
			FightTimer = 210
			MonstersMsgsSkip = false
			switch (MonstersMsgsPage)
			{
				case 1:
					if undertale_pack[0]==16
						floweySprite=sFlowey_BattleSide2
				break;
				case 2:
					if undertale_pack[0]==0
						floweySprite=sFlowey_BattleNeutral
				break;
				case 3:
					if undertale_pack[0]>=20
						bulletsgo=1
					if undertale_pack[0]>undertale_length_text(currectfloweymsg)+30
						Stage=12
				break;
			}
		break;
		case 2:
			MonstersMsgsSelect = [0,0,1]
			Fight=2
			FightTimer=250
			bulletsgo=false
			
		break;
		case 3:
			var currectfloweymsg = "Is this a joke?<delay?0.3>\nAre you braindead?<delay?0.3>\nRUN. <delay?0.3>INTO. <delay?0.3>THE.<delay?0.3>\nBULLETS!!!"
			MonstersMsgsSelect = [0,0,0,1]
			Fight=3
			FightTimer=250
			MonstersMsgsSkip=false
			bulletsgo=false
			
			
			
			if undertale_pack[0]>=undertale_length_text(currectfloweymsg)+25
			{
				if undertale_pack[0]=undertale_length_text(currectfloweymsg)+25
				{
					bullets=-1
					for (var i = 0; i<5; i++)
					{
						bullets[i] = instance_create_depth(locations_x[i],locations_y[i],depth+1,oFloweysFriendlinessPellets)
						bullets[i].targetx = locations_x[i]
						bullets[i].targety = locations_y[i]
						bullets[i].lastx=bullets[i].x
						bullets[i].lasty=bullets[i].y
						bullets[i].spd=8
						bullets[i].damage=19
					}
					
					MonstersMsgs[3]="Is this a joke?<delay?0.3>\nAre you braindead?<delay?0.3>\nRUN. <delay?0.3>INTO. <delay?0.3>THE.<delay?0.3>\nfriendliness pellets!!!"
				}
				bulletsgo=true
				floweySprite=sFlowey_BattleNeutral
			}
			else if undertale_pack[0]>undertale_length_text(currectfloweymsg)-10
				floweySprite=sFlowey_BattleShocked1
				
				
			key_a_once=undertale_pack[0]>undertale_length_text(currectfloweymsg)+70
		break;
		case 4:
			bulletsgo=false
			Fight=4
			floweySprite=sFlowey_BattleEvil
			FightTimer=150
			MonstersMsgsSelect = [0,0,0,0,1]
			bullets=-1
		break;
		case 5:
			Fight=5
			MonstersMsgsSelect = [0,0,0,0,0,1]
			MonstersMsgsFont=ft_BigNormal
			FightTimer=2000
			MonstersBubble_width=-1
			MonstersMsgsSkip=false
		break;
		case 6:
			Fight=6
			MonstersMsgsSelect = [0,0,0,0,0,0,1]
			MonstersMsgsFont=ft_FixedsysTiny
			FightTimer=noone
			MonstersBubble_width=230
			MonstersBubble_height=90
			if MonstersMsgsPage==1
				torielSprite = sToriel_Stand
		break;
		case 7: 
			MonstersMsgsSkip=false
			bulletsgo=false
			Fight=3
			floweySprite=sFlowey_BattleLaugh
			FightTimer=20
			MonstersBubble_width=230
			MonstersBubble_height=90
			MonstersMsgsFont=ft_FixedsysTiny
			MonstersMsgsSelect = [0,0,0,0,0,0,0,1]
			bullets=-1
			show_debug_message("7 activated")
		break;
		case 8:
			show_debug_message("8 activated")
			Fight=4
			MonstersMsgsSelect = [0,0,0,0,0,0,0,0]
			FightTimer=150
		break;
			
			
	}
}
else if Stage==12 //		in attack
{
	if floweyStages=2
	{
	}
}
else //				after attack
{

}
if bulletsgoALL
{
	with oFloweysFriendlinessPellets
	{
		goto_mid=true
		spd=6
	}
}
if bulletsgo
{
	var finbreak = 0
	for (var i = 0; i<array_length_1d(bullets); i++)
	{
		if !instance_exists(bullets[i])	
		{
			with oFloweysFriendlinessPellets
				instance_destroy()
			finbreak=1
			timer_reset(2,100)
			FightTimer=1000
			floweySprite=sFlowey_BattleLaugh
			show_debug_message("Pellets died")
			break;
		}
	}
	if timer[2]=1
	{
		floweyStages=7
		Stage=11.5
		MonstersMsgsPage=0
		timer_reset(2,-1)
		show_debug_message("timer[1]=1")
	}
	
	if finbreak == 0
	{
		var spdrate = [1.5,2,2.5,2.5,2.5]
		var math
			//math = round(timer[0]/(100/array_length_1d(bullets)))-1
			//if between(math,0,4)
		for (math = 0; math<array_length_1d(bullets); math++)
			if instance_exists(bullets[math])
			{
				bullets[  math	].goto_mid=true
				bullets[math].depth=depth-1
				bullets[math].spd=spdrate[math]
			}
	}
}show_debug_message(string(floweyStages)+" 7")