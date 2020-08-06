if steps>610 { //shadow
	draw_set_color(c_black)
	draw_set_alpha(.5)
	//show_strings(x,y)
		var size = 20
		var uparide = 65
		var plus_x = -2
		var waeve;
		if steps>610+uparide
			waeve = y-(y+plusY)-70//wave(0.0,10.0,1.0,0.0)
		else
			waeve = y-(y+(-(uparide+5)))-70+(610+uparide-steps)/4
		draw_ellipse(x-size-waeve+plus_x,y-size,x+size+waeve+plus_x,y+size,false )
	draw_set_alpha(1)
}