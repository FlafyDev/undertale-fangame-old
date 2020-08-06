var step = 2*pi/90;  // see note 1
var cX = room_width/2; 
var cY = room_height/2+60;
var r = 120;
rollchanger+=1/2
if rollchanger>=2 rollchanger=0

if (theta < 2*pi)
{
	var xx = cX + r*cos(theta);
	var yy = cY - r*sin(theta);    //note 2.
	theta+=step
	if rollchanger==floor(rollchanger) {
		bullets = instance_create_depth(xx,yy,depth-1,oFloweysFriendlinessPellets)
		bullets.roll=floor(rollchanger)
		bullets.targetx = xx
		bullets.targety = yy
		bullets.lastx=bullets.x
		bullets.lasty=bullets.y
	}
			
			
}