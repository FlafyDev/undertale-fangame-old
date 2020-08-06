/*sprites = 
[
	sWaterFall_LeftTop,
	sWaterFall_MidTop,
	sWaterFall_RightTop,
	sWaterFall_LeftMid,
	sWaterFall_MidMid,
	sWaterFall_RightMid,
	sWaterFall_LeftBottom,
	sWaterFall_MidBottom,
	sWaterFall_RightBottom,
]*/

sprites[0,0] = sWaterFall_LeftTop
sprites[0,1] = sWaterFall_MidTop
sprites[0,2] = sWaterFall_RightTop
sprites[1,0] = sWaterFall_LeftMid
sprites[1,1] = sWaterFall_MidMid
sprites[1,2] = sWaterFall_RightMid
sprites[2,0] = sWaterFall_LeftBottom
sprites[2,1] = sWaterFall_MidBottom
sprites[2,2] = sWaterFall_RightBottom

spd = 6/60

sprScale = 2

spriteSize = 20*sprScale
xscale = floor(image_xscale)
yscale = floor(image_yscale)

imageIndex = 0

image_speed = 0

gridsX = xscale
gridsY = yscale
