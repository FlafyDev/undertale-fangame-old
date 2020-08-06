var op1 = "Yes"
var op2 = "No"


var arrayPos = 0
	
if textNum == 0 
{
	
	text = [
		"* (It's a cooler.<delay?0.5>\n* It has no brand, and shows no signs of wear...)",
		"* (Inside are a couple of freeze-dried\n  space food bars.)",
		"* (Take one?)",
		"* " + carryToMuchText,
		"* (You got the Astronaut Food.)"
	]
	questions = [
		[op1, op2, 2, true]
	]
	arrayPos=3
	if textbox_ended {
		textNum = 1
		textbox_ended=false
	}
}
else if textNum == 1 
{

	text = [
		"* (Take a space food bar from the cooler?)",
		"* " + carryToMuchText,
		"* (You got the Astronaut Food.)"
	]
	//show_debug_message("text reseted")
	questions = [
		[op1, op2, 0, true]
	]
	arrayPos = 1
	if textbox_ended {
		if gotNumber==2
			textNum=2
		textbox_ended=false
	}
}
else if textNum == 2 
{

	text = [
		"* (The cooler is empty.)"
	]
	questions = []
}

if textNum!=2 {
	//show_debug_message(string(textNum)+" Asdsadas"+string(irandom(5)))
	//show_debug_message("Answer: " + string(answer))
	if !(carryToMuchBoolean) {
		text = removeArraySlot( text, [arrayPos])
	}
	else
		text = removeArraySlot( text, [arrayPos+1])
		
	if array_length_1d(answer)!=0 {
		if answer[1]==1 {//No
			text = removeArraySlot( text, [arrayPos])
			//textbox_enable = false
			textNum = 1
		}
		//show_debug_message("Carry too much?: " + string(!(carryToMuchBoolean)))
		if answer[1]==0 && !(carryToMuchBoolean) {
			//show_debug_message("has to")
			gotNumber++
			undertale_add_item(2)
			flags_set("NBCooler", gotNumber)
		}
		answer=[]
		
	}
}
//show_debug_message("Next: " + string(text))
//show_debug_message("ANSWER: " + string(answer))