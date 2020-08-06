/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_dkgray)
var step = 2*pi/20;  // see note 1
var cX = y; 
var cY = x;
var r = 50;

for(var theta=0;  theta < 2*pi;  theta+=step)
{
	var xx = cX + r*cos(theta);
	var yy = cY - r*sin(theta);    //note 2.
	draw_circle(xx,yy,5,false)
}



draw_set_color(c_black)
draw_circle(x,y,10,true)
