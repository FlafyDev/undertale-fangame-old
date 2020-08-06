/// @desc
draw_set_color(c_black)
draw_set_alpha(clamp(blackScreenAlpha,0,1))
draw_rectangle(0,0,960,540,false)
draw_set_alpha(1)

if blackScreenAlpha>=1
{
	oVariables.NewPos_x = playerNewPos_x
	oVariables.NewPos_y = playerNewPos_y
	oVariables.NewDir = playerNewDir
}

if blackScreenAlpha>=1.2
{
	oVariables.fade = 1
	room=exitBattleTo
}