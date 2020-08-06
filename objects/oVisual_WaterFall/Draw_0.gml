for(var i = 0; i<gridsX; i++) 
{
	for(var ii = 0; ii<gridsY; ii++)
	{
		var gI = i
		var gII = ii
		gII = gII==0 ? 0 : (gII!=gridsY-1 ? 1 : 2)
		gI = gI==0 ? 0 : (gI!=gridsX-1 ? 1 : 2)
		if gII==1&&gI==1
			continue
		draw_sprite_ext(sprites[gII,gI],imageIndex,x+spriteSize*i,y+spriteSize*ii,sprScale,sprScale,0,c_white,1)
	}
}
draw_sprite_ext(sprites[1,1],imageIndex,x+spriteSize,y+spriteSize,(gridsX-2)*sprScale,(gridsY-2)*sprScale,0,c_white,1)

imageIndex+=spd
if imageIndex>sprite_get_number(sprites[0,0])*2 imageIndex=0