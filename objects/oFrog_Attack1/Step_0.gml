if between(steps,25,50) {
	direction = point_direction(x,y,battle.Heart_x,battle.Heart_y)
	speed=0
} else
	speed=2

image_index = steps/10
image_speed = 0
steps++