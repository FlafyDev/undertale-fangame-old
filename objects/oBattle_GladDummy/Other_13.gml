/// @description Insert description here
// You can write your code in this editor

if Stage==14 && monsters[0].mode=1{
	if undertale_pack[0]==undertale_pack[2]&&winPage == 0 {
		monsterDeath_create(sGladDummy_battle,1,424,194,2,2,get_array_ds_list(@"MonstersSprites\GladDummy.txt"))
		flags_set("gladDummyDied",1)
	}
} else {
	if Stage==14 && monsters[0].mode==0 {
		dummyPlusY-=2
	}
	var img = FightHit
	draw_sprite_ext(sGladDummy_battle,FightHit,424+HitShake*FightHit,194+dummyPlusY,2,2,0,c_white,1)
}

if winAction == true {
	exitBattleTo = rWF_TrashZone2
	playerNewPos_x = flags_get("lastX")
	playerNewPos_y = flags_get("lastY")
	playerNewDir = flags_get("lastDir")
}