//@function item_setup(Name, Description, Sprite, Type, Object)
function item_setup(_name, _desc, _sprite, _type)
{
	var info;
	
	info[ITEM_DATA.NAME] = _name;
	info[ITEM_DATA.DESCRIPTION] = _desc;
	info[ITEM_DATA.SPRITE] = _sprite;
	info[ITEM_DATA.TYPE] = _type;
	
	if (argument_count > 4)
	{
		info[ITEM_DATA.EXT_DATA] = argument[4];
	}
	else
	{
		info[ITEM_DATA.EXT_DATA] = noone;
	}
	return info;
}

//@function calculate_knockback(Knockback, Direction)
function calculate_knockback(_knockback, _dir)
{
	velocity[X] = lengthdir_x(_knockback, _dir);
	velocity[Y] = lengthdir_y(_knockback, _dir);
	stun = true;
}

//@function create_projectile(x, y, object, velocity)
function create_projectile(_x, _y, _object, _velocity)
{
	var ins = instance_create_depth(_x, _y, depth, _object);
	ins.owner = id;
	if (variable_instance_exists(id, "owner"))
	{
		ins.owner = owner;
	}
	ins.velocity = _velocity;
	return ins;
}