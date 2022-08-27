/// @description ?
if (!create)
{
	sprite_set_offset(sprite_index, sprite_width/2, sprite_height/2);
	create = true;
}
image_xscale = scale;
image_yscale = scale;
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
