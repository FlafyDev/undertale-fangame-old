view_enabled=true
view_visible[0]=true

p_camera_track = oFrisk
p_camera_boreder = 40
p_camera_spd = -1
p_camera_scale = 1
p_camera_size = [960, 540]

undertale_pack = undertale_pack_create(-1, true)
inviStage = -1
inviSlot = 0
inviSlotItem = [0,0]
inviLock = 0
inviNpc = 0

normalDepth = layer_get_depth(layer_get_id("lObjects")) // can be upper or lower in a range of 100.

camera_set_view_size(view_camera[0],960,540)

display_set_gui_size(960,540)

if instance_exists(oFrisk)
{
	if !is_undefined(NewPos_x)
		oFrisk.x = NewPos_x
	if !is_undefined(NewPos_y)
		oFrisk.y = NewPos_y
	//show_debug_message(string(oFrisk.x) + " " + string(NewPos_x))
	if !is_undefined(NewDir)
		if NewDir<2
			oFrisk.Sprite = oFrisk.sprites_x[NewDir]
		else
			oFrisk.Sprite = oFrisk.sprites_y[NewDir-2]
}
