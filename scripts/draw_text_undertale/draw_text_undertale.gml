/// @desc draw_text_undertale(text, x, y, Pack, [halign])
/// @function draw_text_undertale
/// @param text
/// @param x
/// @param y
/// @param Pack
/// @param [halign]

/************** 
	Stages:
		-get args
		-check if in the pos of the text(by "time") there is "("
		if there is, check if behind it there is an "+" //and after this is NOT "!" (if ! it will delete it)
		if not, check where is the ")" from after the "(" we found erlier and also save each character until the ")"
		make a speacil thing for the word you've found
		/////delete text that not spouse to be shown(1: "<" that don't have an ">" at the end ... 2: every "(" ,the word between and ")"
		
	
	
	
	
***************/
// 
var text = argument[0]
var givenText = text
var xx = argument[1]
var yy = argument[2]
var halign = fa_left
if argument_count>4 halign = argument[4]
//get the pack
var arg3 = argument[3]
var time = arg3[0]
var stopTime = arg3[1]
var textSpd = arg3[2]
var skipTypesArray_x = arg3[3]
var skipTypesArray_y = arg3[4]
var makeSpacesbigger = arg3[5]
var fakeTime = 0

#region make the spacesbigger and skip them
	if makeSpacesbigger {
		text = string_replace_all(text, " ", space)
		var skip = false
		while string_char_at(text,time) == " " && string_char_at(text,time+1) == " " //if now there is a space
		{
			time++
		}
	}
#endregion

#region increase time when "<" at time
	if string_char_at(text,time) == "<" 
	{
		while string_char_at(text,time) != ">"
		{
			time++
		}
	}
#endregion


if time==0 && stopTime == 0
{
	skipTypesArray_x = []
	skipTypesArray_y = []
}

__tTime = time
__tStopTime = stopTime
__tSkipTypesArray_x = skipTypesArray_x
__tSkipTypesArray_y = skipTypesArray_y
__tTextSpd = textSpd
//draw_set_halign(halign)
var txt = string_copy(text,0,time)
if textSpd == -1
	txt = text
ATEX_draw(xx, yy, txt, -1, fa_left)
time = __tTime
stopTime = __tStopTime
skipTypesArray_x = __tSkipTypesArray_x
skipTypesArray_y = __tSkipTypesArray_y
//if (undertale_length_text(givenText)<time-2)  {
//	stopTime = 0
//}




if stopTime<=0
	time+=textSpd
else
	stopTime-=1/60

return [time,stopTime,textSpd,skipTypesArray_x,skipTypesArray_y,makeSpacesbigger]

























/*
#region how many () there is
	var typeNum = 0
	for (var i = 0; i < time; i++) {
		if string_char_at(text,i+1) == "(" && string_char_at(text,i) == "+" {
			typeNum++
		}
	}
	fakeTime-=typeNum
	var allTypesNum = 0
	var inType = false
	for (var i = 0; i < string_length(text); i++) {
		if string_char_at(text,i) == "(" && string_char_at(text,i-1) != "+" {
			inType=true
			//show_strings(string_char_at(text,i), string_char_at(text,i-1))
		}
		if string_char_at(text,i-1) == ")" && inType==true {
			inType=false
		}
		if inType {
			typeNum++
		}
	}
	//show_message("Done")
#endregion

#region increase time when "<" at time
	if string_char_at(text,time) == "<" 
	{
		while true
		{
			time++
			if string_char_at(text,time) == ">"
			{
				time++
				break
			}
		}
	}
#endregion

#region () types

	var skipTypeByTime = false
	for (var i = 0; i < array_length_1d(skipTypesArray); ++i) {
		if skipTypesArray[i] == floor(time) {
			skipTypeByTime=true
			break;
		}
	}
	if string_char_at(text,time-typeNumPassed) == "(" && string_char_at(text,time-typeNumPassed-1) != "+" && skipTypeByTime == false && allTypesNum+time+typeNum<=string_length(text)//if now there is an "(" and behind him there is NO "+" //and after the "(" there is NO "!"
	{
		show_strings(string_char_at(text,time-typeNum), string_char_at(text,time-typeNum-1),time,typeNumPassed,time-typeNumPassed)
		var foundEnd = false
		var foundChar = ""
		var i = 0
		while foundEnd == false //it will loop every char in "text" from the number "time" char, if it found an end it be: foundEnd = true, foundChar = char between... if not it well crash
		{
			var theChar = string_char_at(text,time+i-typeNumPassed)
			if theChar == ")" {
				foundEnd=true
				break
			} else {
				foundChar += theChar
			}
			i++
		}
		show_debug_message("DELAYED")
		typeNumPassed+=string_length(foundChar)+1
		if string_startswith("(delay", foundChar) {
			time--
			var delayTime = real(string_delete(foundChar,1,6))
			show_debug_message(delayTime)
			stopTime = delayTime
			skipTypesArray[array_length_1d(skipTypesArray)] = floor(time)+1
		}
	}
	
#endregion

#region delete "(context)"
	var deleteChars = false
	var newText = text
	var charsToDelete = []
	for(var i = 0; i<string_length(text); i++) //finding the chars we need to delete and store their location in an array called "charsToDelete"
	{
		if (deleteChars) or (string_char_at(text,i+1)=="(" && string_char_at(text,i)=="+")
			charsToDelete[array_length_1d(charsToDelete)] = i
		
		if string_char_at(text,i)=="(" && string_char_at(text,i-1)!="+" {
			deleteChars = true
			charsToDelete[array_length_1d(charsToDelete)] = i
			//fakeTime--
		} else if string_char_at(text,i)==")" && deleteChars == true {
			deleteChars = false
			//fakeTime--
		}
	}
	//show_message(charsToDelete)
	for(var i = 0; i<array_length_1d(charsToDelete); i++)
	{
		var del = charsToDelete[i]-i
		//show_strings(del,string_char_at(newText,del))
		
		newText = string_delete(newText,del,1)
	}
	

#endregion

if makeSpacesbigger {
	#region make the spacesbigger and skip them
		newText = string_replace_all(newText, " ", space)
		var skiped = false
		while string_char_at(newText,time) == " "  //if now there is a space
		{
			time++
			skiped = true
			//if string_char_at(text,time+1) != " "
			//	fakeTime = -1
		}
		time-=skiped
	#endregion
}
ATEX_draw(xx, yy, string_copy(newText,0,time+fakeTime), -1, fa_left)
show_debug_message(string("a") + "    " + string(fakeTime)
)
//show_strings(stopTime, time)

if stopTime<=0
	time+=textSpd
else
	stopTime-=1/60

return [time,stopTime,textSpd,skipTypesArray,makeSpacesbigger,typeNumPassed]

