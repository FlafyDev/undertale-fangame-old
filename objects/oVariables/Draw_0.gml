draw_set_color(c_black)

draw_set_alpha(1)
var view_x = camera_get_view_x(view_camera[0])
var view_y = camera_get_view_y(view_camera[0])

depthSystemEnable=instance_exists(oFrisk)

if depthSystemEnable {
	#region Depth System
	//resize the grid 
	var normalDepthVaar = normalDepth
	var insts_num = 1+instance_number(oNpc);
	if ds_grid_height(depthSystemGrid) != insts_num
		ds_grid_resize(depthSystemGrid,2,insts_num)
		
	//set the instances and their y to the grid
	dontSortThem = []
	ds_grid_set(depthSystemGrid,0,0,oFrisk.id)
	ds_grid_set(depthSystemGrid,1,0,oFrisk.y)
	var i = 1; with (oNpc) {
		if depthSystemOn=false
			other.dontSortThem[array_length_1d(other.dontSortThem)]=id
		ds_grid_set(other.depthSystemGrid,0,i,id)
		ds_grid_set(other.depthSystemGrid,1,i,y)
		i++
	}
	
	//sort the grid by his second row numbers
	ds_grid_sort(depthSystemGrid,1,true)
	
	//draw the instances
	var minus = 0
	for (var i = 0; i<insts_num; i++) {
		with (ds_grid_get(depthSystemGrid,0,i)) {
			#region check if in dontSortThem array
				var contin = false
				for (var ii = 0; ii<array_length_1d(other.dontSortThem); ii++) {
					if other.dontSortThem[ii]==id {
						contin = true
						break
					}
				}
			#endregion
			
			//show_debug_message(string(depth) + " " + string(i-minus) + "    " + string(i) + "    " + string(normalDepthVaar-n) + "    : " + string(depth == 300 ? 0 : 1))
			if contin == false {
				var n = (i-minus-floor((insts_num-array_length_1d(other.dontSortThem))/2))
				depth=normalDepthVaar-n
			}
			else {
				minus++
			}
		}
	}
	//show_debug_message("----" + string(insts_num-minus))
	//show_strings(dontSortThem[0],dontSortThem[1],dontSortThem[2],dontSortThem[3])
	
#endregion
}

#region join to battle animation
if joinToBattle
{
	joinBattleSteps++
	var times = [40,80,120,121]
	if encounterBubble==false&&joinBattleSteps<=times[0]
		joinBattleSteps=times[0]+1

	
	//show_debug_message(joinBattleSteps<=times[2])
	
	if joinBattleSteps<=times[0] {
		
		draw_sprite_ext(sFrisk_Encounter,0,playerX,playerY-30,2,2,0,c_white,1)
	} else if joinBattleSteps<=times[1] {
		
		draw_rectangle(view_x,view_y,view_x+960,view_y+540,false)
		draw_sprite_ext(friskSpriteByDir(playerDir),1,playerX,playerY,oFrisk.SpriteSize,oFrisk.SpriteSize,0,c_white,1)
		if joinBattleSteps%10<6
			draw_sprite_ext(sHeart,0,playerX,playerY,1,1,0,heartColor,1)
	} else if joinBattleSteps<=times[2] {
		
		draw_rectangle(view_x,view_y,view_x+960,view_y+540,false)
		var stage = joinBattleSteps-times[1]-1
		var steps = times[2]-times[1]
		//show_debug_message(stage)
		var startX = playerX
		var endX = view_x+heartX
		var everystepX = (endX-startX)/steps
		
		var startY = playerY
		var endY = view_y+heartY
		var everystepY = (endY-startY)/steps
		
		draw_sprite_ext(sHeart,0,startX+everystepX*stage,startY+everystepY*stage,1,1,0,heartColor,1)
	} else if joinBattleSteps<=times[3] {
		
		room=rBattle
	}
}
else
{
	joinBattleSteps=0	
}
#endregion
