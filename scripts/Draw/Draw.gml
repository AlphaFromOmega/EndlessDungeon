/// @description Checks if a given position is below the floor height, returns the floor depth
/// @function nine_slice(sprite, x1, y1 ,x2, y2);
function nine_slice(_sprite, _x1, _y1, _x2, _y2)
{
	// Variables
	var _size = sprite_get_width(_sprite) / 3;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;
	// Middle
	draw_sprite_part_ext(_sprite, 0, _size, _size, 1, 1, _x1 + _size, _y1 + _size, _w - (_size * 2), _h - (_size * 2), c_white, 1);
	
	// Corners
	// Top Left
	draw_sprite_part(_sprite, 0, 0, 0, _size, _size, _x1, _y1);
	
	// Top Right
	draw_sprite_part(_sprite, 0, _size * 2, 0, _size, _size, _x1 + _w - _size, _y1);
	
	// Bottom Left
	draw_sprite_part(_sprite, 0, 0, _size * 2, _size, _size, _x1, _y1 + _h - _size);
	
	// Botttom Right
	draw_sprite_part(_sprite, 0, _size * 2, _size * 2, _size, _size, _x1 + _w - _size, _y1 + _h - _size);
	
	// Edges
	// Left Edges
	draw_sprite_part_ext(_sprite, 0, 0, _size, _size, 1, _x1, _y1 + _size, 1, _h - (_size * 2), c_white, 1);
	// Right Edges
	draw_sprite_part_ext(_sprite, 0, _size * 2, _size, _size, 1, _x1 + _w - _size, _y1 + _size, 1, _h - (_size * 2), c_white, 1);
	
	// Top Edges
	draw_sprite_part_ext(_sprite, 0, _size, 0, 1, _size, _x1 + _size, _y1, _w - (_size * 2), 1, c_white, 1);
	// Right Edges
	draw_sprite_part_ext(_sprite, 0, _size, _size * 2, 1, _size, _x1 + _size, _y1 + _h - _size, _w - (_size * 2), 1, c_white, 1);
}