/// @desc classMonster(name, maxhp, acts, defense, spare, x, y)
/// @function classMonster
/// @param name 0
/// @param maxhp 1
/// @param acts 2
/// @param defense 3
/// @param spare 4
/// @param x 5
/// @param y 6

/*// variables:

	name
	maxhp
	hp
	actText
	actTimes
	defense
	spare
	x
	y
	mode - 0=alive 1=died 2=spared
*/

var monster = instance_create_depth(0,0,0,classobject)

with monster
{
	name = argument[0]

	maxhp = argument[1]
	hp = maxhp

	actText = argument[2]
	actTimes = [0,0,0,0]

	defense = argument[3]

	spare = argument[4]

	x = argument[5]
	y = argument[6]

	mode = 0

//	for (var i = 0; i<array_length_1d(actText); i++)
//	{
//		actText[i] = string_replace_all(actText[i]," ",space)
//	}
	
	instance_deactivate_object(id)
}




return monster