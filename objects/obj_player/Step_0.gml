/// @description ?
var target_h = 0;
var target_v = 0;
if (CONTROL.keyboard)
{
	// Keyboard movement
	if (CONTROL.hor_check != 0 || CONTROL.ver_check != 0)
	{
		var control_velocity = normalized(CONTROL.hor_check, CONTROL.ver_check)
		
		target_h = CONTROL.hor_check != 0 ? approach(velocity[X], control_velocity[X] * spd, accel) : 0;
		target_v = CONTROL.ver_check != 0 ? approach(velocity[Y], control_velocity[Y] * spd, accel) : 0;
	}
}
else
{
	// Controller movement (or some dumb case)
}

velocity[X] = approach(velocity[X], target_h, fric);
velocity[Y] = approach(velocity[Y], target_v, fric);