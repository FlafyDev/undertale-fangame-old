image_yscale = sc
image_xscale = 1.5-sc

sc+=0.1*up

if sc>=1
	up=-1
if sc<0
	instance_destroy()