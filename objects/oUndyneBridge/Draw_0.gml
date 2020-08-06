
var frisk_hited = 853

frisk_vsp+=frisk_grav
frisk_hsp-=frisk_grav
if frisk_hsp<0
	frisk_hsp=0
if steps>frisk_hited+200
	bridge_vsp+=bridge_grav
if steps=frisk_hited {
	frisk_vsp-=4
	frisk_sprite = sFrisk_Puched
	frisk_index = 0
	frisk_hsp+=8
}
if y+frisk_vsp>floor_y {
	frisk_vsp=0
	bridge_vsp=0
	if steps>frisk_hited
	{
		frisk_sprite = sFrisk_Lying
	}
}

if between(steps,frisk_hited+100,frisk_hited+200) {
	bridge_moreX = irandom_range(-2,2)
	bridge_moreY = irandom_range(-2,2)
	alarm[0] = 100
} else if steps>frisk_hited+200 {
	frisk_angle++
	floor_y=1000
	x++
	bridge_moreX++
}
show_debug_message(alarm[0])


y+=frisk_vsp
x+=frisk_hsp
bridge_moreY+=bridge_vsp
draw_sprite_ext(sUndyneBridge,0,560+bridge_moreX,280+bridge_moreY,1,1,0,c_white,1)
draw_sprite_ext(frisk_sprite,frisk_index,x,y,2,2,-frisk_angle,c_white,1)

if between(steps,50,500) {
	undyne_moreX++
	undyne_index+=0.04
} else if between(steps,501,580) {
	undyne_index=1.96
} else if between(steps,581,610) {
	undyne_moreX--
	undyne_index+=0.04
} else if between(steps,611,780) {
	undyne_index=1
} else if between(steps,781,860) {
	undyne_sprite=sUndyne_ArmorRaise
	undyne_index+=0.09
	spear_alpha+=0.05
	if undyne_index>sprite_get_number(sUndyne_ArmorRaise)-1 {
		undyne_index=sprite_get_number(sUndyne_ArmorRaise)-1
		spear_moveX+=8
	}

} else if steps>860{
	undyne_sprite=sUndyne_ArmorRight
	undyne_index=1
	spear_moveX+=8
}


draw_sprite_ext(undyne_sprite,undyne_index,-32+undyne_moreX,325-24+undyne_moreY,2,2,0,c_white,1)
draw_sprite_ext(sUndyne_SpearShadow,0,-32+undyne_moreX+spear_moveX,330-24+undyne_moreY,2,2,0,c_white,spear_alpha)

steps++