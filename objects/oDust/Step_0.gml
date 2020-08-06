
image_xscale = lerp(image_xscale,0,0.05)
image_yscale = image_xscale
image_angle = lerp(image_angle,360,0.03)
image_alpha = lerp(image_alpha,-0.1,0.01)

if image_alpha<=0
	instance_destroy()
		
y-=image_alpha/5