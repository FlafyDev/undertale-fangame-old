sprspdcounter+=1/SpriteSpeed

var img = floor(sprspdcounter<0 ? 1 : sprspdcounter)
var sprWidth = sprite_get_width(Sprite)
var sprHeight = sprite_get_height(Sprite)
var sprXoffset = sprite_get_xoffset(Sprite)
var sprYoffset = sprite_get_yoffset(Sprite)

waterActive=position_meeting(x,y+sprYoffset,oWaterActive)


var yDown = waterDown*waterActive
draw_sprite_part_ext(Sprite,img,0,0,sprWidth,sprHeight-yDown,x-sprWidth+1,y+yDown-sprHeight+1,SpriteSize,SpriteSize,c_white,1)
if waterActive
	draw_sprite_ext(sWaterripple,0,x,y,2,2,0,c_white,1)

//draw_sprite_ext(Sprite,img,x,y,SpriteSize,SpriteSize,0,c_white,0.5)

if Sprite==sprites_x[0]
	dir=0
else if Sprite==sprites_x[1]
	dir=1
else if Sprite==sprites_y[0]
	dir=2
else if Sprite==sprites_y[1]
	dir=3

if timer[1]==0&&(prePos_x!=x or prePos_y!=y)
{
	instance_create_depth(prePos_x,prePos_y+sprite_get_width(sprite_index)/2,depth+1,oDust)
	timer[1]=-1
}

