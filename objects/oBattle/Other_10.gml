/// @desc set msgs, gametexts and monsters

Msgs = [	"* FROGGIT - ATK 4 DEF 5 \n* Life is difficult for\n  this enemy.",
		"* Froggit didn't understand \n* what you said,<delay?0.4> but was \n  flattered anyway.",
		"* Froggit didn't understand \n* what you said,<delay?0.4> but was \n  scared anyway."
	]

frog = classMonster("Froggit", 30, ["* Check", "* Compliment", "* Threat"], 4, false, 426, 120)
monsters = [frog]

gameText = ["* Froggit hopped close!", "* Froggit hops to and fro.", "* Froggit seems reluctant\n  to fight you."] // main text

MonstersMsgs = ["<wave>Croak,\ncroak.","(Blushes\ndeeply.)\nRibbit..","<wave>Shiver,\nshiver.","<wave>Hop,\nhop."]
MonstersMsgsPos = [[500,130],[500,130],[500,130],[500,130]]
MonstersMsgsArrow = [2,2,2,2]  //0 = right --- 1 = up --- 2 = left --- 3 = down

Fight = 1

//battle_setSpaces()
//battle_create_textbackup()

//------

monsterFrogPlus_x = 0.1
monsterFrogPlus_y = 0.1

monsterFrog_x = 0
monsterFrog_y = 0