/// @description ?
var channeling = mouse_check_button(CONTROL.fire_key)
/*
if (retreat)
{
	velocity = lengthdir(spd, point_direction(x, y, owner.x, owner.y))
	if (point_distance(x, y, owner.x, owner.y) <= spd * 2)
	{
		instance_destroy()
	}
}
else
{
	if (abs(velocity[X]) < 1 && abs(velocity[Y]) < 1)
	{
		retreat = !mouse_check_button(CONTROL.fire_key);
	}
	else
	{
		direction = point_direction(x, y, x + velocity[X], y + velocity[Y]);
	}
	velocity[X] *= 0.98;
	velocity[Y] *= 0.98;
	if (point_distance(x, y, owner.x, owner.y) > start_force)
	{
		velocity = lengthdir(point_distance(x, y, owner.x, owner.y) - start_force, point_direction(x, y, owner.x, owner.y))
		if (point_distance(x, y, owner.x, owner.y) > start_force + (owner.spd + spd) * 2)
		{
			retreat = true;
		}
		outrange = true;
	}
	else if (outrange)
	{
		velocity[X] = 0;
		velocity[Y] = 0;
		outrange = false
	}
}
*/
/* Cosmetic
if (type == 25)
{
	if (Main.rand.Next(15) == 0)
	{
		Dust.NewDust(position, width, height, 14, 0f, 0f, 150, default(Color), 1.3f);
	}
}
else if (type == 26)
{
	var num203 = Dust.NewDust(position, width, height, 172, velocity[X] * 0.4f, velocity[Y] * 0.4f, 100, default(Color), 1.5f);
	Main.dust[num203].noGravity = true;
	Main.dust[num203].velocity[X] /= 2f;
	Main.dust[num203].velocity[Y] /= 2f;
}
else if (type == 35)
{
	var num204 = Dust.NewDust(position, width, height, 6, velocity[X] * 0.4f, velocity[Y] * 0.4f, 100, default(Color), 3f);
	Main.dust[num204].noGravity = true;
	Main.dust[num204].velocity[X] *= 2f;
	Main.dust[num204].velocity[Y] *= 2f;
}
else if (type == 154)
{
	var num205 = Dust.NewDust(position, width, height, 115, velocity[X] * 0.4f, velocity[Y] * 0.4f, 140, default(Color), 1.5f);
	Main.dust[num205].noGravity = true;
	Dust dust36 = Main.dust[num205];
	Dust dust2 = dust36;
	dust2.velocity *= 0.25f;
}
*/

if !(instance_exists(owner))
{
	instance_destroy();
	return;
}
//owner.itemAnimation = 10;
//owner.itemTime = 10;
/* Hor Facing
if (x + (sprite_width / 2) > owner[X] + (owner.sprite_width / 2))
{
	owner.ChangeDir(1);
	direction = 1;
}
else
{
	owner.ChangeDir(-1);
	direction = -1;
}
*/
var mountedCenter2 = Vector2(owner.x, owner.y);
// x + sprite_width * 0.5;
// y + sprite_height * 0.5;
var vector18 = Vector2(x, y);
var num206 = mountedCenter2[X] - vector18[X];
var num207 = mountedCenter2[Y] - vector18[Y];
var player_dis = point_distance(vector18[X], vector18[Y], mountedCenter2[X], mountedCenter2[Y]);

var start_force = chain_length * 0.95
if !(throwing)
{
	tileCollide = true;
	if !(channeling) || (player_dis > chain_length)
	{
		throwing = true;
	}
	else
	{
		velocity[X] *= 0.9;
		velocity[Y] *= 0.9;
	}
}
else
{
	var num210 = 14 / owner.meleeSpeed;
	var num211 = 0.9 / owner.meleeSpeed;
	var num212 = chain_length * 1.1;
	/*
	if (type == 63)
	{
		num212 *= 1.5;
		num210 *= 1.5;
		num211 *= 1.5;
	}
	if (type == 247)
	{
		num212 *= 1.5;
		num210 = 15.9;
		num211 *= 2;
	}
	*/
	var num213 = abs(num206);
	var num214 = abs(num207);
	if (retract)
	{
		tileCollide = false;
		if (player_dis < 20)
		{
			instance_destroy();
		}
	}
	else
	{
		retract = (!channeling || player_dis > num212)
	}
	if (!tileCollide)
	{
		num211 *= 2;
	}
	/*
	if (type == 247)
	{
		start_force = 100;
	}
	*/
	if (retract)
	{
		player_dis = num210 / player_dis;
		num206 *= player_dis;
		num207 *= player_dis;
		vector19[VECTOR2] = Vector2(velocity[X], velocity[Y]);
		var num216 = num206 - velocity[X];
		var num217 = num207 - velocity[Y];
		var num218 = sqrt(num216 * num216 + num217 * num217);
		num218 = num211 / num218;
		num216 *= num218;
		num217 *= num218;
		velocity[X] *= 0.98;
		velocity[Y] *= 0.98;
		velocity[X] += num216;
		velocity[Y] += num217;
	}
	else
	{
		if (abs(velocity[X]) + abs(velocity[Y]) < 6)
		{
			velocity[X] *= 0.96;
			velocity[Y] *= 0.96;
		}
		if (owner.velocity[X] == 0)
		{
			velocity[X] *= 0.96;
		}
	}
}
/* Flower Pow Shooty Shit
if (type == 247)
{
	if (velocity[X] < 0f)
	{
		rotation -= (abs(velocity[X]) + abs(velocity[Y])) * 0.01f;
	}
	else
	{
		rotation += (abs(velocity[X]) + abs(velocity[Y])) * 0.01f;
	}
	var num219 = position[X];
	var num220 = position[Y];
	var num221 = 600f;
	bool flag4 = false;
	if (owner == Main.myPlayer)
	{
		localretract += 1f;
		if (localretract > 20f)
		{
			localretract = 20f;
			for (var num222 = 0; num222 < 200; num222++)
			{
if (Main.npc[num222].CanBeChasedBy(this))
{
	var num223 = Main.npc[num222].position[X] + (var)(Main.npc[num222].width / 2);
	var num224 = Main.npc[num222].position[Y] + (var)(Main.npc[num222].height / 2);
	var num225 = abs(position[X] + (var)(width / 2) - num223) + abs(position[Y] + (var)(height / 2) - num224);
	if (num225 < num221 && Collision.CanHit(position, width, height, Main.npc[num222].position, Main.npc[num222].width, Main.npc[num222].height))
	{
		num221 = num225;
		num219 = num223;
		num220 = num224;
		flag4 = true;
	}
}
			}
		}
	}
	if (flag4)
	{
		localretract = 0f;
		var num226 = 14f;
		vector18 = new Vector2(position[X] + (var)width * 0.5f, position[Y] + (var)height * 0.5f);
		num206 = num219 - vector18[X];
		num207 = num220 - vector18[Y];
		player_dis = (var)sqrt(num206 * num206 + num207 * num207);
		player_dis = num226 / player_dis;
		num206 *= player_dis;
		num207 *= player_dis;
		var num227 = NewProjectile(vector18[X], vector18[Y], num206, num207, 248, (var)((double)damage / 1.5), knockBack / 2f, Main.myPlayer);
	}
}
else
{*/
direction = point_direction(x, y, x + velocity[X], y + velocity[Y]) - (retract ? 180: 0); /*
}*/
if (instance_position(x + velocity[X], y + velocity[Y], obj_solid))
{
	if (velocity[X] != velocity[X])
	{
		x += velocity[X];
		velocity[X] = velocity[X] * -0.2;
	}
	if (velocity[Y] != velocity[Y])
	{
		y += velocity[Y];
		velocity[Y] = velocity[Y] * -0.2;
	}
}