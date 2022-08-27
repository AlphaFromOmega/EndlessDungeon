/// @description ?
if (instance_number(obj_controls) > 1)
{
	instance_destroy();
}

change = 0;
keyboard = true;

up_key = ord("W");
down_key = ord("S");
left_key = ord("A");
right_key = ord("D");

inv_key = ord("E");

fire_key = mb_left;
use_key = mb_right;

hor_check = keyboard_check(right_key) - keyboard_check(left_key);
ver_check = keyboard_check(down_key) - keyboard_check(up_key);