/// @description ?

if (held && mouse_check_button(CONTROL.fire_key) && !instance_exists(attack))
{
	attack = instance_create_depth(owner.x, owner.y, owner.depth - 1, obj_sword);
	attack.owner = owner;
	attack.sprite_index = sprite_duplicate(sprite_index);
	attack.start_dir = point_direction(owner.x, owner.y, mouse_x, mouse_y);
	attack.scale = 4;
	attack.dir_speed = 5;
	attack.max_dir = 120;
	attack.knockback = knockback * owner.knock_multi;
}