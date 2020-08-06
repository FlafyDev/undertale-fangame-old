key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)

var move_x;
var move_y;

move_x = key_right - key_left
move_y = key_down - key_up

if !moveable
{
	move_x = 0
	move_y = 0
}

if timer[0]==0
{
	prePos_x = x
	prePos_y = y
	if move_x!=0 or move_y!=0
		timer_reset(1,3)
	timer_reset(0,60)	
}
if move_x==0 && move_y==0
	timer[1]=-1


if !place_meeting(x+move_x*Speed,y,oSolid)
	x+=move_x*Speed
else
	while !place_meeting(x+move_x,y,oSolid)
		x+=move_x

if !place_meeting(x,y+move_y*Speed,oSolid)
	y+=move_y*Speed
else
	while !place_meeting(x,y+move_y,oSolid)
		y+=move_y

if move_x!=0
{
	lookRight = move_x
	lookDown = 0
	Sprite=sprites_x[move_x == -1 ? 1 : 0]
}
else if move_y!=0
{
	lookDown = move_y
	lookRight = 0
	Sprite=sprites_y[move_y == -1 ? 1 : 0]
}
else //if moving
{
	sprspdcounter = -1
}

if move_x!=0 or move_y!=0 // if moving
{
	if sprspdcounter <0 sprspdcounter = 0
}

