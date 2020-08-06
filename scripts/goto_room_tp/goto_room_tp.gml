/// @desc goto_room_tp(room)
/// @funciton goto_room_tp
/// @param room

var inst = instance_create( 0, 0, oRoomTeleporter)
inst.nextpos_x = undefined
inst.nextpos_y = undefined
inst.nextdir = undefined
inst.nextroom = argument0
inst.autoactivate = true
inst.destroy = true