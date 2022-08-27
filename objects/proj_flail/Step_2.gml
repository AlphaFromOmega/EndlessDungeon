/// @description ?
if (!retract)
{
	if (tileCollide)
	{
		if (place_meeting(x + velocity[X], y, obj_solid))
		{
			velocity[X] = 0;
		}
		if (place_meeting(x, y + velocity[Y], obj_solid))
		{
			velocity[Y] = 0;
		}
	}
	if (point_distance(x + velocity[X], y + velocity[Y], owner.x, owner.y) > chain_length * 1.1)
	{
		retract = true;
	}
	if (point_distance(x + velocity[X], y + velocity[Y], owner.x, owner.y) > chain_length)
	{
		velocity = lengthdir((point_distance(x + velocity[X], y + velocity[Y], owner.x, owner.y) - chain_length) * 0.9, point_direction(x, y, owner.x, owner.y));
	}
	else if (point_distance(x, y, owner.x, owner.y) > chain_length * 0.95 && point_distance(x + velocity[X], y + velocity[Y], owner.x, owner.y) > point_distance(x, y, owner.x, owner.y))
	{
		velocity[X] *= 0.2;
		velocity[Y] *= 0.2;
	}
}
x += velocity[X];
y += velocity[Y];

with (chain)
{
	arm_move_to(other.x, other.y, true, other.owner.x, other.owner.y);
	arm_set_length(point_distance(other.x, other.y, other.owner.x, other.owner.y), segments)
}

image_angle = direction;

var attack_list = ds_list_create();
var attack_num = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_enemy, true, true, attack_list, true);

for (var i = 0; i < attack_num; i++)
{
	var skip = false;
	with (attack_list[| i])
	{
		for (var j = 0; j < ds_list_size(other.hit); j++)
		{
			if (other.hit[| j] == attack_list[| i])
			{
				skip = true;
				break;
			}
		}
		if (skip)
		{
			continue
		}
		calculate_knockback(other.knockback, other.direction);
		other.hit[| j] = id;
		other.frames[| j] = 6;
	}
}