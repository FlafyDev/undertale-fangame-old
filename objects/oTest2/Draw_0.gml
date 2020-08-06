if steps<=100
	draw_sprite(sTest, 0, x, y)
if steps == 101
	monsterDeath_create(sTest, 0, x, y, 1, 1, get_array_ds_list(@"MonstersSprites/TestSprite.txt"))
	
steps++