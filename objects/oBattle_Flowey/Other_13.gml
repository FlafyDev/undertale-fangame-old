/// @desc draw ( monsters for example )

//if Stage>12
//show_debug_message(string(Stage) + " <<<<" + string(preStage))
if Stage>12
{
	if floweyStages!=3 && floweyStages!=7
	{
		Stage=11.5
		if floweyStages==0
		{
			floweySprite=sFlowey_BattleSide1
		}
		floweyStages++
		if floweyStages==9
			floweyStages=5
		timer_reset(0,0)
	}
	else
	{
		for (var i=0; i<array_length_1d(MonstersMsgsSelect); i++)
		{
			MonstersMsgsSelect[i] = 0	
		}
	}	
}
var currectfloweymsg = ""
if Stage==11.5
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

if undertale_pack[0]<undertale_length_text(currectfloweymsg)&&Stage==11.5
	floweyImageindex+=1/10
else
	floweyImageindex=0
draw_sprite_ext(floweySprite,floweyImageindex+floweyImageindex2,floweyX,floweyY,2,2,floweyAngle,c_white,1)
if torielSprite!=-1
	draw_sprite_ext(torielSprite,floweyImageindex,torielX,torielY,2,2,0,c_white,1)

/*(
draw_set_color(c_white)
draw_text(200,100,floweyStages)
draw_set_color(c_black)
