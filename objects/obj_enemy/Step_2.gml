/// @description ?
if (place_meeting(x + velocity[X], y, obj_solid))
{
	velocity[X] = 0;
}
if (place_meeting(x, y + velocity[Y], obj_solid))
{
	velocity[Y] = 0;
}
x += velocity[X];
y += velocity[Y];