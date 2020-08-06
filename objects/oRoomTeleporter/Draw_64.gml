if place_meeting(x,y,oFrisk) or autoactivate
{
	if instance_exists(oFrisk)
		oFrisk.moveable=0
	fade+=0.05
}
draw_set_color(c_black)
draw_set_alpha(clamp(fade,0,1))
draw_rectangle(0,0,960,540,false)
draw_set_alpha(1)
if fade>=1.2
{
	oVariables.NewPos_x = nextpos_x
	oVariables.NewPos_y = nextpos_y
	oVariables.NewDir = nextdir
	oVariables.fade = 1
	room=nextroom
}