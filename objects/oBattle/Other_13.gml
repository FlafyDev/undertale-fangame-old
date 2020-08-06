/// @desc draw ( monsters for example )


if Stage!=12 {
	with oFrog_Attack1
		instance_destroy()
}

if Stage!=14 { 
	if timer[2]==0
	{
		monsterFrogPlus_x *= -1	
		timer_reset(2,100)
	}
	if timer[3]==0
	{
		monsterFrogPlus_y *= -1
		timer_reset(3,80)	
	}
	monsterFrog_x+=monsterFrogPlus_x
	monsterFrog_y+=monsterFrogPlus_y
	//show_debug_message(FightHit)
	if FightHit && monstersSelect==0 {
		draw_sprite(sFrog,4,430+HitShake,182-10)
	} else {
		draw_sprite(sFrog,monsterFrogPlus_x+3,426,225)
		draw_sprite(sFrog,monsterFrogPlus_x+1,430+monsterFrog_x,182+monsterFrog_y)
	}
}
else {
	if monsters[0].mode=1&&undertale_pack[0]==undertale_pack[2]
	{
		monsterDeath_create(sFrog,4,430,182-10,1,1,get_array_ds_list(@"MonstersSprites\Froggit.txt"))
	}
	if monsters[0].mode=2
	{
		if undertale_pack[0]==1
			battle_dust_effect(426,225)
		draw_set_alpha(0.5)
		draw_sprite(sFrog,monsterFrogPlus_x+3,426,225)
		draw_sprite(sFrog,monsterFrogPlus_x+1,430+monsterFrog_x,182+monsterFrog_y)
		draw_set_alpha(1)
	}	
}

var surface_x = arena_x-arena_width/2
var surface_y = arena_y-arena_height/2
with oFrog_Attack1
{
	surface_set_target(other.arena_surface)
		draw_sprite(sprite_index,image_index,x-surface_x,y-surface_y)
	surface_reset_target()
}
with oFrog_Attack2
{
	surface_set_target(other.arena_surface)
		draw_sprite(sprite_index,image_index,x-surface_x,y-surface_y)
	surface_reset_target()
}