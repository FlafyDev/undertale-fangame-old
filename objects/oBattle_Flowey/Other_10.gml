/// @desc set msgs, gametexts and monsters

Msgs = ["* He looks angry   \n* Maybe try been honest with him..","* You're talking with him about sad things    \n* He's intesting in what you saying..."]

flowey = classMonster("Flowey",1, [""], 0, false, 426, 120)

monsters = [flowey]

gameText = [""] // main text


MonstersMsgs =	[
			"See that heart?<delay?0.5>\nThat is your SOUL,<delay?0.5>\nthe very culmination\nof your begin!<c>Your SOUL starts off weak,\n<delay?0.5>but you can grow \nstrong if you gain \na lot of LV.<c>What's LV stand for?\n<delay?0.5>Why, <delay?0.5>LOVE, <delay?0.5>of course!<c>You want some LOVE,\n<delay?0.5>don't you?<c>Don't worry,\n<delay?0.5>I'll share some\nwith you!",
			"Down here,<delay?0.5> LOVE is\nshared through...<c>Little white...<delay?0.5>\n\"friendliness pellets\"<c>Are you ready?<c>Move around!<delay?0.5>\nGet as many as\nyou can!",
			"Hey buddy,<delay?0.5>\nyou missed them.<c>Let's try again,<delay?0.5>\nokay?",
			"Is this a joke?<delay?0.3>\nAre you braindead?<delay?0.3>\nRUN. <delay?0.3>INTO. <delay?0.3>THE.<delay?0.3>\nBULLETS!!!",
			"<shake 1>You know what’s\ngoing on here,<delay?0.5>\ndon’t you?<c><shake 1>You just wanted to\nsee me suffer.",
			"D<delay?0.1>i<delay?0.1>e<delay?0.1>.",
			"What a terrible\ncreature, <delay?0.5>torturing\nsuch a poor,<delay?0.2>\ninnocent youth...<c>Ah, do not be\nafraid,<delay?0.3> my child<c>I am <color?"+string(c_blue)+">TORIEL<color?"+string(c_black)+">,\ncaretaker of the <color?"+string(c_red)+">\nRUINS<color?"+string(c_black)+">.<c>I pass through this\nplace every day to\nsee if anyone has\nfallen down.<c>You are the first\nhuman to come here\nin a long time.<c>Come!\nI will guide you\nthrough the\ncatacombs.",
			"<shake 1>You idiot.<c><shake 1>In this world, <delay?0.8>it's\nkill or be killed.<c><shake 1>Why would ANYONE pass\nup an opportunity\nlike this!?"
		]
MonstersMsgsPos = [[570,140],[570,140],[570,140],[570,140],[570,140],[570,140],[570,60],[570,140]]
MonstersMsgsSelect = [0,0,0,0,0,0,0,0]
MonstersMsgsArrow = [2,2,2,2,2,2,2,2]  //0 = right --- 1 = up --- 2 = left --- 3 = down
MonstersMsgsSkip = true


backSprite=-1

arena_width = 160
arena_height = 160

Stage = 11.5

btnSprites=[]

MonstersMsgsMoveableHeart=true

arena_width_default=100
arena_height_default=100

MonstersBubble_width=230
MonstersBubble_height=90

HeartName = ""

player_info_x-=70

//------

floweyAngle = 0

theta=0

rollchanger = 0

locations_x = [362,407,475,553,598]
locations_y = [184-40,142-40,107-40,142-40,184-40]

floweyStages = 0
floweySprite=sFlowey_BattleNeutral
floweyImageindex = 0
floweyImageindex2 = 0
floweyX = room_width/2
floweyY = 200

torielSprite=-1
torielX = 1060
torielY = 70+101

prevCountText = countText

bulletsgo = 0
bulletsgoALL=0