var spd = real(speedd)
var grav = .1
var startStep = 70


hsp=move*spd;
vsp+=grav;
if steps=startStep {
	vsp-=real(jumpheight)
	move = -1
}

if steps>startStep {
	x+=hsp
	y+=vsp
	image_index=1
}

steps++