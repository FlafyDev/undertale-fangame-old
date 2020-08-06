if Stage==10 && preStage!=10 {
	
	MonstersMsgsSelect = array_reset_length(array_length_1d(MonstersMsgs)) 
	MonstersMsgsSelect[clamp(8-boredLimit,0,5)] = 1
	boredLimit--
	useText=irandom(1)
	if boredLimit==0 {
		FightTimer=1
	}
}

if Stage==12 {
	winMsg="* Dummy tires of you aimless\n  shenanigans.<c>"+winMsg
	Stage=14
	enableHeart = false
}