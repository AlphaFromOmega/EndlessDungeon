/// @description ?
hor_check = keyboard_check(right_key) - keyboard_check(left_key);
ver_check = keyboard_check(down_key) - keyboard_check(up_key);
if (change > 0)
{
	if (change > 10)
	{
		surface_resize(application_surface, window_get_width(), window_get_height());
		display_set_gui_size(window_get_width(), window_get_height());
		change = 0;
	}
	else
	{
		change++;
	}
}

if (keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen(!window_get_fullscreen());
	change = 1;
}