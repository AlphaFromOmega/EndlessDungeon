/// @description ?

if (held && mouse_check_button_pressed(CONTROL.fire_key) && !instance_exists(attack))
{
	var spd = 25
	var vel = lengthdir(spd ,point_direction(owner.x, owner.y, mouse_x, mouse_y));
	attack = create_projectile(owner.x, owner.y, proj_flail, vel);
	attack.velocity[X] += owner.velocity[X];
	attack.velocity[Y] += owner.velocity[Y];
	attack.spd = spd;
	attack.knockback = knockback * owner.knock_multi;
}