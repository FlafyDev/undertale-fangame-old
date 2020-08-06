

roll+=rollspd
if roll>=2 roll=0
image_angle = floor(roll)*90

if goto_mid==2
{
	//show_message("("+string(targetx)+"-"+string(lastx)+")/("+string(spd)+"*60")
	var spdx = (targetx-lastx)/(spd*60)
	var spdy = (targety-lasty)/(spd*60)
	//show_message(string(x) + ">=" + string(targetx) + " " + string(sign(spdx)) + " " + string(spdx))
	x+= spdx
	y+= spdy
	if (x>=targetx && sign(spdx)==1) or (x<=targetx && sign(spdx)==-1)
	{
		x=targetx
		y=targety
		goto_mid=0
	}
}
else if goto_mid==1
{
	var spdx = (targetAttack_x-lastx)/(spd*60)
	var spdy = (targetAttack_y-lasty)/(spd*60)
	x+= spdx
	y+= spdy
}
else
{
	lastx=x
	lasty=y
}
if goto_mid!=1
{
	targetAttack_x = oBattle_Manager.battle.Heart_x // no room_width/2
	targetAttack_y = oBattle_Manager.battle.Heart_y // no 346
}