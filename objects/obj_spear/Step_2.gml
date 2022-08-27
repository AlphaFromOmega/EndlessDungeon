/// @description ?

x = owner.x + offset[X];
y = owner.y + offset[Y];
depth = owner.depth;

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