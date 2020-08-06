Msgs =	[	
		"* GLAD DUMMY - ATK 0 DEF 0\n* Wipe that smile off your face.", 
		"* Dummy tires of your aimless shenanigans."
	]

dummy = classMonster("Glad Dummy", 5, ["* Check"], 4, true, 426, 120)
monsters = [dummy]

gameText = [	"* Dummy looks like it's going to fall over.",
		"* Dummy stands around absentmindedly.",
	]

MonstersMsgs = [
		"<wave?1>Thanks!", 
		"<wave?1>Thank you!", 
		"<wave?1>Great work!",
		"<wave?1>Bravo!", 
		"<wave?1>OK!",
		"<wave?1>..."
		]
		
FightTimer = 0

MonstersMsgsDisableAfterBattle=true

MonstersBubble_width = 110
MonstersBubble_height = 120

boredLimit = 8 // when reaches 0. the dummy leaves
		
MonstersMsgsPos = [[500,130],[500,130],[500,130],[500,130],[500,130],[500,130]]
MonstersMsgsArrow = [2,2,2,2,2,2]  //0 = right --- 1 = up --- 2 = left --- 3 = down

flee = false

//////

dummyPlusY=0