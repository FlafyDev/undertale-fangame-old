/// @desc STEP what to do when x is y

if monsters[0].actTimes[0]>0 { //if you selected 'Check' once
	useText=1
}
if monsters[0].actTimes[1]>0 or monsters[0].actTimes[2]>0 { //if you selected 'Compliment' or 'Threat' once
	useText=2
	monsters[0].spare=true
}

MsgSelect=actSelect
if Stage<12 { //before attack
	if Fought==false {
		if actSelect = 0
			MonstersMsgsSelect = [1,0,0,0]
		if actSelect = 1
			MonstersMsgsSelect = [0,1,0,0]
		if actSelect = 2
			MonstersMsgsSelect = [0,0,1,0]
	} else
		MonstersMsgsSelect = [0,0,0,1]
} else if Stage>12 { //after attack
	MonstersMsgsSelect = [0]
}
if Stage!=12
{
	timer[0]=0
	FightTimer=300
	Fight = irandom(1)
}
if Stage==0
{
	arena_width_to = 170
	arena_height_to = 170	
}
if Stage=11.5{
	MonstersMsgsTimer++
	if MonstersMsgsTimer>100
		key_a_once=true
} else
	MonstersMsgsTimer = 0
	
if winAction or fleeAction {
	exitBattleTo=rArea1
}
	
//show_debug_message(string(Msgs[1]) + "-----" + string(backup.Msgs[1]))