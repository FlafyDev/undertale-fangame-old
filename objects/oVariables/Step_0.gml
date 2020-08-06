switch global.pLevel
{
	case 1:
		global.pMaxHp=20
		break;
}

carry = ds_list_size(global.pItems)



global.vDouble = global.vDouble == 1 ? 0 : 1
global.vFour += global.vFour == 1 ? -1 : 0.25
global.vEight += global.vEight == 1 ? -1 : 0.125

fade-=0.05

#region Old Camera system
/*
camera_set_view_target(view_camera[0],-1)

view_set_wport(view_camera[0],960)
view_set_hport(view_camera[0],540)
var p_camera_x = camera_get_view_x(view_camera[0])
var p_camera_y = camera_get_view_y(view_camera[0])
var boreder = p_camera_boreder//p_camera_scale
if p_camera_track!=-1 {
	
	var objX;
	var objY;
	if is_array(p_camera_track) {
		objX = p_camera_track[0]
		objY = p_camera_track[1]
	} else {
		objX = p_camera_track.x
		objY = p_camera_track.y
	}
	var x1 = 960/2/p_camera_scale-boreder+p_camera_x
	var y1 = 540/2/p_camera_scale-boreder+p_camera_y
	var x2 = 960/2/p_camera_scale+boreder+p_camera_x
	var y2 = 540/2/p_camera_scale+boreder+p_camera_y
	if !point_in_rectangle(is_undefined(objX)==true ? (x1+x2)/2 : objX, is_undefined(objY)==true ? (y1+y2)/2 : objY, x1, y1, x2, y2) {
		var left;
		var top;
		var right;
		var bottom;
		
		if is_undefined(objX) {
			right = 1
			left = 1
		} else {
			right = x2-objX
			left = objX-x1
		}
		if is_undefined(objY) {
			top = 1
			bottom = 1
		} else {
			top = objY-y1
			bottom = y2-objY
		}
		//show_debug_message_plus(left, top, right, bottom)
		if sign(left) = -1 {
			if p_camera_spd!=-1
				left = clamp(left,-p_camera_spd,p_camera_spd)
			p_camera_x+=left
		}
		if sign(top) = -1 {
			if p_camera_spd!=-1
				top = clamp(top,-p_camera_spd,p_camera_spd)
			p_camera_y+=top
		}
		if sign(right) = -1 {
			if p_camera_spd!=-1
				right = clamp(right,-p_camera_spd,p_camera_spd)
			p_camera_x-=right
		}
		if sign(bottom) = -1 {
			if p_camera_spd!=-1
				bottom = clamp(bottom,-p_camera_spd,p_camera_spd)
			p_camera_y-=bottom
		}
		
		//p_camera_x=objX-960/2
		//p_camera_y=objY-540/2
	}
}
//else {
//camera_set_view_target(view_camera[0],p_camera_track)
//}
//camera_set_view_border(view_camera[0],960/2-40,540/2-40)


if p_camera_x<0
	p_camera_x-=p_camera_x
if p_camera_x+960/p_camera_scale>room_width {
	p_camera_x-=p_camera_x+960/p_camera_scale-room_width
}
if p_camera_y<0
	p_camera_y-=p_camera_y
if p_camera_y+540/p_camera_scale>room_height {
	p_camera_y-=p_camera_y+540/p_camera_scale-room_height
}

camera_set_view_pos(view_camera[0], p_camera_x, p_camera_y)
//camera_set_view_speed(view_camera[0],p_camera_spd,p_camera_spd)
camera_set_view_size(view_camera[0],960/p_camera_scale,540/p_camera_scale)
*/
#endregion

var cam_width = p_camera_size[0]
var cam_height = p_camera_size[1]
if p_camera_track!=-1 && ( is_array(p_camera_track) or instance_exists(p_camera_track)){
	if is_array(p_camera_track) {
		if !is_undefined(p_camera_track[0])
			x = p_camera_track[0]
		if !is_undefined(p_camera_track[1])
			y = p_camera_track[1]
	} else {
		x = p_camera_track.x
		y = p_camera_track.y
	}
	camera_set_view_target(view, id)
}
camera_set_view_size(view, cam_width/p_camera_scale, cam_height/p_camera_scale)
view_set_wport(view,cam_width)
view_set_hport(view,cam_height)
camera_set_view_border(view,cam_width/2-p_camera_boreder,cam_height/2-p_camera_boreder)
camera_set_view_speed(view, p_camera_spd, p_camera_spd)



//debug
/*p_camera_x = oFrisk.x-sprite_get_xoffset(sFrisk_Hitbox)/2
p_camera_y = oFrisk.y-sprite_get_yoffset(sFrisk_Hitbox)/2

if keyboard_check_pressed(ord("L")) {
	if p_camera_track == -1
		p_camera_track = oFrisk
	else
		p_camera_track = -1
	
}*/

if keyboard_check_pressed(ord("R"))
	game_restart()


if keyboard_check(ord("G"))
{
	room_speed=4000
}
else
	room_speed=60
	
if keyboard_check_pressed(vk_f2)
{
	room++
}
else if keyboard_check_pressed(vk_f3)
{
	room--
}