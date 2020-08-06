var xx, yy
xx = x
yy = y

if !surface_exists(surface)&&steps<sprite_get_height(sprite)*yscale {
	surface = surface_create(sprite_get_width(sprite)*xscale,sprite_get_height(sprite)*yscale)
	surface_set_target(surface)
		draw_clear_alpha(c_white,0)
		draw_sprite_ext(sprite,subimg,sprite_get_xoffset(sprite)*xscale,sprite_get_yoffset(sprite)*yscale,xscale,yscale,0,c_white,1)
	surface_reset_target()
}

if maketodust
{
	if steps<sprite_get_height(sprite)*yscale {
		draw_sprite_part_ext(sprite,subimg,	0,steps/yscale,sprite_get_width(sprite)*xscale,sprite_get_height(sprite)*yscale,	xx-sprite_get_xoffset(sprite)*xscale,yy+steps-sprite_get_yoffset(sprite)*yscale	    ,xscale,yscale,c_white,1)

		for(var i = 0; i<sprite_get_width(sprite)*xscale; i++) {
			var blue = (colors[i,steps] >> 16) & 255;
			var green = (colors[i,steps] >> 8) & 255;
			var red = colors[i,steps] & 255;
			//show_debug_message(string(blue) + " " + string(green) + " " + string(red))
			if blue==0 && green==255 && red==0
				continue
			var dust = instance_create_depth(xx+i+minusOdd(steps)*100-sprite_get_xoffset(sprite)*xscale,yy+steps-sprite_get_yoffset(sprite)*yscale,depth-1,oMonsterDust)
			dust.image_blend = colors[i,steps]
			dust.speed=(clamp(steps,30,sprite_get_height(sprite)*yscale)/10)/2
		}
		steps+=2
	} else { 
		surface_free(surface)
		readyColors=[]
		colors=[]
		instance_destroy()
	}
}
/*else {
	var seconds = secondsCreate
	repeat(ceil(sprite_get_width(sprite)*xscale*(sprite_get_height(sprite)*yscale)/(seconds*60))) {
		if colorsI>=sprite_get_width(sprite)*xscale {
			colorsSteps+=2
			colorsI=0
		}
		if colorsSteps>=sprite_get_height(sprite)*yscale {
			maketodust=true
			break
		}
		colors[colorsI] = surface_getpixel_ext(surface,colorsI,steps)
		if (colors[colorsI] >> 24) & 255==0 {
			colorsI++
			continue
		}
		colorsI++
	}
	show_debug_message("checks in: " + string(colorsI) + "..... line number: " + string(colorsSteps) + "..... numbers of lines:" + string(sprite_get_height(sprite)*yscale))
}*/