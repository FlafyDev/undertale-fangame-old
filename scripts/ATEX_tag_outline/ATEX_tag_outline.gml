/// @func ATEX_tag_TEMPLATE(arguments, properties, sizes, type)
/// @desc This is example of tag script, duplicate and edit it if you want to fast create new tag
/// @arg {list} arguments Arguments of tag, ds_list with values
/// @arg {map} properties Properties of tag, ds_map with keys and values
/// @arg {array} sizes Current width and height of string. 0 - width, 1 - height

var args=argument0, props=argument1, sizes=argument2, type=argument3;
var W=sizes[0], H=sizes[1];

#region tag data

if type=="depth" 
	return 1
if type=="names"
	return ["outline", "oline"]
if type=="type"
	return ATEX.drawer
	
#endregion

if type=="position"
{
	return [0, 0] // first value - width, second - height. You can write your values
}
else
if type=="draw"
{
	var text=argument4, X=argument5, Y=argument6;
	
	var col=draw_get_colour(), newcol=ATEX_get_prop(props, "c", c_black), W=min(ATEX_get_prop(props, "w", 1), string_width("A")*0.3);
	
	draw_set_colour(newcol)
	if W>0
	if W=1
	{
		draw_text(X+1, Y, text)
		draw_text(X, Y-1, text)
		draw_text(X, Y+1, text)
		draw_text(X-1, Y, text)
	}
	else
	{
		for(var w=1; w<W; w+=1)
		{
			w=min(W, w)
			draw_text(X+w, Y, text)
			draw_text(X, Y-w, text)
			draw_text(X, Y+w, text)
			draw_text(X-w, Y, text)
			draw_text(X+w*0.7, Y+w*0.7, text)
			draw_text(X+w*0.7, Y-w*0.7, text)
			draw_text(X-w*0.7, Y+w*0.7, text)
			draw_text(X-w*0.7, Y-w*0.7, text)
		}
	}
	draw_set_colour(col)
	
	return true
}
else
if type=="start"
{
	var poslist=argument4, textlist=argument5;
	/*
			start of the tag, it calling when "position" event return text
	*/
}
else
if type=="end"
{
	var poslist=argument4, textlist=argument5; // array with text coordinates. You can use it to detect collision with cursor
	/*
			end of the tag, it calling when text returned in "position" event already drawn
	*/
}
else
if type=="init"
{
	/*
		initialization, usually in CREATE event
	*/
}
/*
		You can use draw_set_... functions, you can draw your own things, you can doing what you want, really (just ask your mother for permission)
*/