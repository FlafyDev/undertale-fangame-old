sprite_index = sFlowey_Hitbox
mask_index = sFlowey_Hitbox
Sprite = sFlowey_Down
SpriteSize_x = 2
SpriteSize_y = 2
SpriteSpeed = 10
if flags_get("floweyTalk")!=0
	instance_destroy();

sprspdcounter = 0

moveable = 1

sprites_x = [sFlowey_Down,sFlowey_Sink]
sprites_y = [sFlowey_Down,sFlowey_Down]

text =	[
		"* Howdy!<delay?0.7>\n* I'm<col "+string(c_yellow)+"> FLOWEY<col "+string(c_white)+">.<delay?0.7>\n*<col "+string(c_yellow)+"> FLOWEY<col "+string(c_white)+"> the<col "+string(c_yellow)+"> FLOWER<col "+string(c_white)+">!",
		"* Hmm...<delay?0.1>",
		"* You're new to the UNDERGROUND,<delay?0.5> aren't cha?",
		"* Golly,<delay?0.5> you must be so confused.",
		"* Someone ought to teach you how things\n  work around here!",
		"* I guess little old me will have to do.",
		"* Ready?<delay?0.3> \n* Here we go!"
	]
images =[
		sFlowey_BattleNeutral,
		sFlowey_BattleNeutral,
		sFlowey_BattleNeutral,
		sFlowey_BattleNeutral,
		sFlowey_BattleNeutral,
		sFlowey_BattleNeutral,
		sFlowey_BattleNeutral
	]
imageXscale = 2
imageYscale = 2
