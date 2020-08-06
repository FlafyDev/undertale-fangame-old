/// @desc wave(from, to, duration, offset, *current_time)
/// @function wave
/// @param from
/// @param to
/// @param duration
/// @param offset
/// @param *current_time
 
// Returns a value that will wave back and forth between [from-to] over [duration] seconds
// Examples
//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
// Or here is a fun one! Make an object be all squishy!! ^u^
//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)

var curtime = current_time
if argument_count==5 curtime = argument[4]
 
a4 = (argument[1] - argument[0]) * 0.5;
return argument[0] + a4 + sin((((curtime * 0.001) + argument[2] * argument[3]) / argument[2]) * (pi*2)) * a4;