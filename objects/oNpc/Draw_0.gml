event_user(2)

if SpriteSpeed==0
	sprspdcounter=0
else
	sprspdcounter+=1/SpriteSpeed


var img = floor(sprspdcounter<0 ? 1 : sprspdcounter)

if SpriteImg!=-1
	img = SpriteImg

if Sprite!=-1
	draw_sprite_ext(Sprite,img,x+plusX,y+plusY,SpriteSize_x,SpriteSize_y,0,c_white,SpriteAlpha)
