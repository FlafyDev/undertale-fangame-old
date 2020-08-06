global.pName = "Frisk"
global.pLevel = 1
global.pMaxHp = 20
global.pHp = global.pMaxHp
global.pAttack = 1
global.pDefense = 1
global.pItems = ds_list_create()
global.pGold = 0

global.vDouble = 0 //gets to 1 every 2 frames
global.vFour = 0 //gets to 1 every 4 frames
global.vEight = 0 //gets to 1 every 8 frames


global.BattleID = battle_Froggit
#region Battle ID Objects

	global.BattleID_Map = ds_map_create()
		ds_map_add(global.BattleID_Map,battle_Froggit	,oBattle)				#macro battle_Froggit "Froggit"		// Example Froggit's battle
		ds_map_add(global.BattleID_Map,battle_Flowey1	,oBattle_Flowey)		#macro battle_Flowey1 "Flowey1"		// Flowey's first encouter battle
		ds_map_add(global.BattleID_Map,battle_GladDummy	,oBattle_GladDummy)		#macro battle_GladDummy "GladDummy"		// Glad dummy battle like in the original

#endregion

global.ItemIDs = ds_list_create()
global.ItemDesc = ds_list_create()
global.ItemDropable = ds_list_create()
#region Items ID
	undertale_create_item("Cake", ["* Sweat Cake.<delay?0.5>\n* Heals 35 HP."],false)
	undertale_create_item("Eaten Cake", ["* Eaten Cake.\n<delay?0.5>* No one would want to eat that."],false)
	undertale_create_item("Astronaut Food", ["For feeding a pet astronaut."],true)
#endregion

global.flags = ds_map_create()
flags_set("floweyTalk",0)
flags_set("madDummyEnc",0)
flags_set("gladDummyDied",0)
flags_set("lastX",0)
flags_set("lastY",0)
flags_set("lastDir",0)
flags_set("BroBro",0)
flags_set("BroBroCake",0)
flags_set("NBCooler",0)

depthSystemEnable = false
depthSystemGrid = ds_grid_create(2,1)

/***********

	frisk's dir:	    oFrisk.dir	       oFrisk.Sprite = 
	
		right -		0		sprites_x[0]
		left -		1		sprites_x[1]
		down -		2		sprites_y[0]
		up -		3		sprites_y[1]
		
			       get                  set

***********/

randomize();

depth=-999

NewPos_x = undefined
NewPos_y = undefined
NewDir = undefined

joinToBattle = false
joinBattleSteps = 0
playerX = 0
playerY = 0
heartX = 0
heartY = 0
playerDir = 0 
encounterBubble = 0
heartColor = c_red

carry = ds_list_size(global.pItems)
maxCarry = 8


fade = 0

ATEX_init();

#macro view view_camera[0]
#macro space "   "
#macro carryToMuchText "(You're carrying too much.)"
#macro carryToMuchBoolean oVariables.carry>=oVariables.maxCarry
#macro keyA ord("Z")
#macro keyB ord("X")
#macro keyC ord("C")