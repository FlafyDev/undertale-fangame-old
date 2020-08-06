if textbox_enable
{
	if direction_x!=0
		if direction_x == 1
			Sprite = sprites_x[0]
		else
			Sprite = sprites_x[1]
	else if direction_y!=0
		if direction_y == 1
			Sprite = sprites_y[0]
		else
			Sprite = sprites_y[1]
}
