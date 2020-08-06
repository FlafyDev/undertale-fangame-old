draw_self()
/*with oBattle
{
	var arena_x1 = arena_x-arena_width/2
	var arena_y1 = arena_y-arena_height/2
	var arena_x2 = arena_x+arena_width/2
	var arena_y2 = arena_y+arena_height/2
}

var spr_x1 = arena_x1-x+spd//,0,sprite_get_width(sprite_index))
var spr_x2 = 1.5*oBattle.arena_width+spr_x1
var spr_y1 = clamp(arena_y1-y+spd,0,8)
var spr_y2 = 8//1.5*oBattle.arena_height+spr_y1
//show_message(string(spr_x1) + " " + string(spr_y1))
//var spr_y1 = clamp(arena_y1-y,0,sprite_get_height(sprite_index)+1)
//var spr_y2 = clamp(arena_y2-y,0,sprite_get_height(sprite_index)+1)

draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,0.5)
draw_sprite_part(sprite_index,image_index,spr_x1,spr_y1,spr_x1+spr_x2,8,x,y)

//17:20