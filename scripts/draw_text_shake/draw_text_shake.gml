/// @desc draw_text_shake(x, y, string, hardness, wordSpaceWidth, spaceWidth, lineHeight, halign)
/// @function draw_text_shake
/// @param x
/// @param y
/// @param string
/// @param hardness
/// @param wordSpaceWidth
/// @param spaceWidth
/// @param lineHeight
/// @param halign       0 = left        1 = middle          2 = right
/// @param valign	0 = top		1 = middle          2 = bottom

/*
	!!(WARNING: this will set the MAIN VARIABLES halign and the valign to what you chose in the script's arguments)!!
*/

var shakeText = argument[2]
var shakeX=argument[0]
var shakeY=argument[1]
var shakeWordsWidth = argument[4]
var shakeSpaceWidth = argument[5]
var shakeLineHeight = argument[6]
var shakeHardness = argument[3]
var preWordWidth = [0]
var halign = argument[7]
var valign = argument[8]
var line = 0

draw_set_halign(0)
draw_set_valign(0)

#region halign
if halign==fa_middle or halign==fa_right
{
	var array = 0
	for (var i = 1; i<=string_length(shakeText); i++)
	{
		var Word = string_char_at(shakeText,i)
		if i>1
		{
			var preChar = string_char_at(shakeText,i-1)
			if preChar==" "
				preWordWidth[array] += shakeSpaceWidth
			else
				preWordWidth[array] += shakeWordsWidth
			preWordWidth[array] += string_width(preChar)
			if preChar=="\n"
			{
				array++
				line++
				preWordWidth[array]=0
			}
		
		}
	}
	var maxValue = 0
	for (i = 0; i < array_length_1d(preWordWidth); i++)
	{
		if (preWordWidth[i] > preWordWidth[maxValue])
		{
			maxValue = i;
		}
	}
	var width = preWordWidth[maxValue]+string_width(string_char_at(shakeText,string_length(shakeText)))
	
	
	draw_set_color(c_white)
	draw_rectangle(shakeX,shakeY,shakeX+width,shakeY+50,false)
	draw_set_color(c_black)
	if halign==fa_middle
		shakeX-=width/2
	else
		shakeX-=width
}
#endregion

#region valign

if valign==fa_middle or valign==fa_bottom
{
	var height = string_count("\n",shakeText)*shakeLineHeight
	height += string_height(shakeText)
	
	draw_set_color(c_white)
	draw_rectangle(shakeX,shakeY,shakeX+180,shakeY+height,false)
	draw_set_color(c_black)
	if valign==fa_middle
		shakeY-=height/2
	else
		shakeY-=height
}

#endregion


preWordWidth = 0
line = 0
;
for (var i = 1; i<=string_length(shakeText); i++)
{
	var shakeMove = irandom_range(-shakeHardness,shakeHardness)
	var Word = string_char_at(shakeText,i)
	if i>1
	{
		var preChar = string_char_at(shakeText,i-1)
		if preChar==" "
			preWordWidth += shakeSpaceWidth
		else
			preWordWidth += shakeWordsWidth
		preWordWidth += string_width(preChar)
		if preChar=="\n"
		{
			preWordWidth=0
			line += 1
		}
		
	}
	//show_message("x = " + string(preWordWidth) + "\ny = " + string(shakeY) + "\ntext =" + string(Word))
	draw_text(shakeX+preWordWidth+shakeMove,shakeY+shakeMove+line*(string_height("\n")+shakeLineHeight),Word)
}

draw_set_halign(halign)
draw_set_valign(valign)