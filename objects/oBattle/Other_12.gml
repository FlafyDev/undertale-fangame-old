/// @desc Moves

switch (Fight)
{
	case 0:
		if timer[0]==0
		{
			bulletx = irandom_range(-arena_width/2,arena_width/2)
			instance_create_depth(arena_x+bulletx,arena_y-arena_height/2,depth-1,oFrog_Attack1)
			timer_reset(0,20)

		}
	break;
	case 1:
		if timer[0]==0
		{
			frogAT = instance_create_depth(arena_x+arena_width/2-24,arena_y+arena_height/2,depth-1,oFrog_Attack2)
			timer_reset(0,2000)
		}
		if instance_exists(frogAT)&&frogAT.x-20<=arena_x-arena_width/2 {
			instance_destroy(frogAT)
			FightTimer = 0
		}
	break;
}
