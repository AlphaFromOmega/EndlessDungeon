/// @description ?
for (var i = 20; i < array_length(storage); i++)
{
	var _x = (d_width - cell_size*5)/2 + (i % 5) *cell_size;
	var _y = 0;

	draw_set_alpha(1);
	draw_set_color(c_dkgray);
	draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, false);
	draw_set_color(c_gray);
	draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, true);
	if (storage[i] != 0)
	{
		var _w = sprite_get_width(storage[i].sprite_index);
		var _h = sprite_get_width(storage[i].sprite_index);
		var _s = max((cell_size * 7/8) / _w, (cell_size * 7/8) / _h);
		draw_sprite_ext(storage[i].sprite_index, 0, _x + cell_size/2 - _s * _w/2, _y + cell_size/2 - _s * _h/2, _s, _s, 0, c_white, 1);
	}
	
	draw_set_alpha(0.25);
	if (hotbar_slot + 20 == i)
	{
		draw_set_color(c_white);
		draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, false);
	}
}
draw_set_alpha(1);

if (inventory_open)
{
	draw_set_color(c_white);
	nine_slice(spr_inv, x - 16, y - 16, x + width + 16, y + height + 16);
	draw_set_color(c_black);
	draw_set_alpha(0.25);
	draw_rectangle(0, 0, d_width, d_height, false);

	for (var i = 0; i < array_length(storage); i++)
	{
		var _x = x + (i % 5) * cell_size;
		var _y = y + (i div 5) * cell_size + (i > 19) * 24;
	
		draw_set_alpha(1);
		draw_set_color(c_dkgray);
		draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, false);
		draw_set_color(c_gray);
		draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, true);
		if (storage[i] != 0)
		{
			var _w = sprite_get_width(storage[i].sprite_index);
			var _h = sprite_get_width(storage[i].sprite_index);
			var _s = max((cell_size * 7/8) / _w, (cell_size * 7/8) / _h);
			draw_sprite_ext(storage[i].sprite_index, 0, _x + cell_size/2 - _s * _w/2, _y + cell_size/2 - _s * _h/2, _s, _s, 0, c_white, 1);
		}
		
		draw_set_alpha(0.25);
		if (selected_array == 0 && selected_slot == i)
		{
			draw_set_color(c_white);
			draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, false);
		}
	}
	
	for (var i = 0; i < array_length(equip); i++)
	{
		var _x = x + 5 * cell_size + ((i div 4) * cell_size) + 24 + i div 4 * cell_size*2;
		var _y = y + (i % 4) * cell_size;
	
		draw_set_alpha(1);
	
		draw_set_color(c_dkgray);
		draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, false);
		draw_set_color(c_gray);
		draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, true);
		if (equip[i] == 0)
		{
			draw_sprite_ext(spr_inv_icons, i, _x, _y, 4, 4, 00, c_white, 1)
		}
		else
		{
			var _w = sprite_get_width(equip[i].sprite_index);
			var _h = sprite_get_width(equip[i].sprite_index);
			var _s = max((cell_size * 7/8) / _w, (cell_size * 7/8) / _h);
			draw_sprite_ext(equip[i].sprite_index, 0, _x + cell_size/2 - _s * _w/2, _y + cell_size/2 - _s * _h/2, _s, _s, 0, c_white, 1);
		}
		draw_set_alpha(0.25);
		if (selected_array == 1 && selected_slot == i)
		{
			draw_set_color(c_white);
			draw_rectangle(_x, _y, _x + cell_size, _y + cell_size, false);
		}
	}
	draw_set_alpha(1);
	draw_set_color(c_dkgray);
	draw_rectangle(x + 6 * cell_size + 24, y, x + 8 * cell_size + 24, _y + cell_size, false);
	draw_set_color(c_gray);
	draw_rectangle(x + 6 * cell_size + 24, y, x + 8 * cell_size + 24, _y + cell_size, true);
	
	if (selected_slot != -1)
	{
		var ui_mouse_x = (device_mouse_x_to_gui(0) div 64) * 64;
		var ui_mouse_y = (device_mouse_y_to_gui(0) div 64) * 64;;
		var selected = 0;
		if (selected_array)
		{
			selected = equip[selected_slot];
			ui_mouse_x = cell_size + x + 5 * cell_size + ((selected_slot div 4) * cell_size) + 24 + selected_slot div 4 * cell_size*2;
			ui_mouse_y = y + (selected_slot % 4) * cell_size;
		}
		else
		{
			selected = storage[selected_slot];
			ui_mouse_x = cell_size + x + (selected_slot % 5) * cell_size;
			ui_mouse_y = y + (selected_slot div 5) * cell_size + (selected_slot > 19) * 24;
		}
		if (selected != 0)
		{
			draw_set_font(fn_name);
			var name = selected.name
			var desc = selected.description
			draw_set_color(c_dkgray);
			draw_rectangle(ui_mouse_x, ui_mouse_y, ui_mouse_x + max(string_width(name), min(DESC_WIDTH, string_width(desc))), ui_mouse_y + string_height(name) + ((string_width(desc) div DESC_WIDTH) + 1) * string_height(desc) + 4, false);
			draw_set_color(c_gray);
			draw_rectangle(ui_mouse_x, ui_mouse_y, ui_mouse_x + max(string_width(name), min(DESC_WIDTH, string_width(desc))), ui_mouse_y + string_height(name) + ((string_width(desc) div DESC_WIDTH) + 1) * string_height(desc) + 4, true);
			draw_set_color(c_white);
			draw_text(ui_mouse_x + 2, ui_mouse_y, name);
			draw_text_ext(ui_mouse_x + 2, ui_mouse_y + string_height(name), desc, string_height(desc), DESC_WIDTH);
		}
	}
	
	if (mouse_item != 0)
	{
		var _w = sprite_get_width(mouse_item.sprite_index);
		var _h = sprite_get_width(mouse_item.sprite_index);
		var _s = max(cell_size/_w, cell_size/_h);
		draw_sprite_ext(mouse_item.sprite_index, 0, device_mouse_x_to_gui(0) + cell_size/2 - _s * _w, device_mouse_y_to_gui(0) + cell_size/2 - _s * _h, _s, _s, 0, c_white, 1);
	}
}