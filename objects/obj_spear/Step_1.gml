/// @description ?
if (!create)
{
	max_it = (scale * sqrt((sprite_width ^ 2) + (sprite_height ^ 2))) * 4 / spd;
	sprite_set_offset(sprite_index, sprite_width/2, sprite_height/2);
	image_xscale = scale;
	image_yscale = scale;
	direction = start_dir;
	create = true;
	velocity[X] = lengthdir_x(spd, direction);
	velocity[Y] = lengthdir_y(spd, direction);
}
else
{
	if (it > max_it)
	{
		instance_destroy();
	}
	else
	{
		it++;
	}
}
if (max_it div 2 == it)
{
	velocity[X] *= -1;
	velocity[Y] *= -1;
}

offset[X] += velocity[X];
offset[Y] += velocity[Y];
image_angle = direction - 45;

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
