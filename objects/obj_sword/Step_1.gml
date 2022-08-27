/// @description ?
if (!create)
{
	max_it = max_dir div dir_speed;
	start_dir -= 45 + ((max_it + 1) * dir_speed) / 2;
	sprite_set_offset(sprite_index, -2, sprite_height + 2);
	image_xscale = scale;
	image_yscale = scale;
	direction = start_dir;
	create = true;
}
else
{
	if (it >= max_it)
	{
		instance_destroy();
	}
	else
	{
		it++;
	}
}

direction += dir_speed;
image_angle = direction;

for (var i = 0; i < ds_list_size(hit); i++)
{
	if (frames[| i] > 0)
	{
		frames[| i] --;
	}
	else if (frames[| i] == 0)
	{
		ds_list_delete(frames, i);
		ds_list_delete(hit, i);
	}
}