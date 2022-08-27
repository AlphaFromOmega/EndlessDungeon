/// @description ?
velocity[VECTOR2] = 0;
retreat = false
spd = 0;
create = false;
sprite_index = sprite_duplicate(sprite_index);
outrange = false;
chain = instance_create_depth(x,y, depth + 1,obj_chain);

hit = ds_list_create();
frames = ds_list_create();

retract = false

throwing = false
tileCollide = true;

with (chain)
{
	chain_text = spr_chain
	segments = other.chain_length div (sprite_get_width(chain_text) - 4);
	var chain_texts
	for (var i = 0; i < segments*2; i++)
	{
		if (i % 2)
		{
			chain_texts[i] = spr_chain;
		}
		else
		{
			chain_texts[i] = spr_chain2;
		}
	}
	arm_initialize(0, segments, chain_texts);
}
