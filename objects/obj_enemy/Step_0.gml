/// @description ?
var target_h = 0;
var target_v = 0;

if (stun)
{
	if (abs(velocity[X]) < 1 && abs(velocity[Y]) < 1)
	{
		stun = false;
	}
}
else
{
	if (point_distance(x, y, obj_player.x, obj_player.y) < 1000)
	{
		if (collision_line(x, y, obj_player.x, obj_player.y, obj_solid, true, true) == noone)
		{
			target[X] = obj_player.x;
			target[Y] = obj_player.y;
		}
		else
		{
			if (round(target[X]/spd) == round(x/4) && round(target[X]/spd) == round(y/spd))
			{
				target[X] = home[X];
				target[Y] = home[Y];
			}
		}
	}
	else
	{
		target[X] = home[X]
		target[Y] = home[Y]
	}
	var p_dis = point_distance(x, y, target[X], target[Y])
	if (change_point < 0 && p_dis < 2000)
	{
		offset[X] = random(p_dis) - p_dis/2;
		offset[Y] = random(p_dis) - p_dis/2;
		change_point = 2000/p_dis;
	}
	else
	{
		change_point--;
	}
	p_dir = point_direction(x, y, target[X] + offset[X], target[Y] + offset[Y])
	var control_velocity = normalized(lengthdir_x(1, p_dir), lengthdir_y(1, p_dir));
	target_h = approach(velocity[X], control_velocity[X] * spd, accel);
	target_v = approach(velocity[Y], control_velocity[Y] * spd, accel);
}
velocity[X] = approach(velocity[X], target_h, fric/(stun + 1));
velocity[Y] = approach(velocity[Y], target_v, fric/(stun + 1));