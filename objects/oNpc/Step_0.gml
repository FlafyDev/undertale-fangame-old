key_a_once = keyboard_check_pressed(keyA)
key_b_once = keyboard_check_pressed(keyB)
key_left_once = keyboard_check_pressed(vk_left)
key_right_once = keyboard_check_pressed(vk_right)
key_up_once = keyboard_check_pressed(vk_up)
key_down_once = keyboard_check_pressed(vk_down)

event_user(1)

var move_x;
var move_y;

move_x = key_right - key_left
move_y = key_down - key_up


//show_debug_message(string(move_x)+" move_x")
//show_debug_message(string(move_y)+" move_y")
//show_debug_message(string(Speed)+" speed")

if moveable==0 {
	move_x=0
	move_y=0
}


if !place_meeting(x+move_x*Speed,y,oSolid) or !collision
	x+=move_x*Speed
else
	while !place_meeting(x+move_x,y,oSolid)
		x+=move_x

if !place_meeting(x,y+move_y*Speed,oSolid) or !collision
	y+=move_y*Speed
else
	while !place_meeting(x,y+move_y,oSolid)
		y+=move_y

if move_x!=0 {
	if array_length_1d(sprites_x)!=0
		Sprite=sprites_x[move_x == -1 ? 1 : 0]
} else if move_y!=0 {
	if array_length_1d(sprites_y)!=0
		Sprite=sprites_y[move_y == -1 ? 1 : 0]
} else //if not moving
{
	sprspdcounter = -1
}

if move_x!=0 or move_y!=0 // if moving
{
	if sprspdcounter <0 sprspdcounter = 0
}

