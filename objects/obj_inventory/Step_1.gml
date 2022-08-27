/// @description ?
d_width = display_get_gui_width();
d_height = display_get_gui_height();
x = (d_width - width)/2;
y = (d_height - height)/2;

if (keyboard_check_pressed(CONTROL.inv_key))
{
	inventory_open = !inventory_open;
}
if (keyboard_check_pressed(vk_escape))
{
	inventory_open = false;
}

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

if (inventory_open)
{
	storage[hotbar_slot + 20].held = false;
	/// Highlight Mouse Cell
	
	if (selected_array) // Get x and y of selected cell
	{
		var _x = x + 5 * cell_size + ((selected_slot div 4) * cell_size) + 24 + selected_slot div 4 * cell_size*2;
		var _y = y + (selected_slot % 4) * cell_size;
	}
	else
	{
		var _x = x + (selected_slot % 5) * cell_size;
		var _y = y + (selected_slot div 5) * cell_size + (selected_slot > 19) * 24;
	}
	
	if !(point_in_rectangle(mx, my, _x, _y, _x + cell_size, _y + cell_size)) // Check if selected cell is still selected
	{
		selected_slot = -1;
		selected_array = -1;
	}
	for (var i = 0; i < array_length(storage); i++)
	{
		var _x = x + (i % 5) * cell_size;
		var _y = y + (i div 5) * cell_size + (i > 19) * 24;
		if point_in_rectangle(mx, my, _x, _y, _x + cell_size, _y + cell_size)
		{
			selected_slot = i;
			selected_array = 0;
			break;
		}
	}
	for (var i = 0; i < array_length(equip); i++)
	{
		var _x = x + 5 * cell_size + ((i div 4) * cell_size) + 24 + i div 4 * cell_size*2;
		var _y = y + (i % 4) * cell_size;
		if point_in_rectangle(mx, my, _x, _y, _x + cell_size, _y + cell_size)
		{
			selected_slot = i;
			selected_array = 1;
			break;
		}
	}
	
	if (mouse_check_button_pressed(mb_left) && selected_slot != -1) // Moving selected items
	{
		if (keyboard_check(vk_shift))
		{
			if (selected_array)
			{
				if (equip[selected_slot] != 0)
				{
					if (equip[selected_slot] != noone)
					{
						equip[selected_slot].equipped = false;
					}
					for (var i = 0; i < array_length(storage); i++)
					{
						if (storage[i] == 0)
						{
							break;
						}
					}
					if (i < array_length(storage))
					{
						storage[i] = equip[selected_slot];
						equip[selected_slot] = 0;
					}
				}
			}
			else
			{
				if (storage[selected_slot] != 0)
				{
					if (storage[selected_slot].equip != EQUIP.NONE)
					{
						for (var i = 0; i < array_length(equip); i++)
						{
							if (equip_allow[i] == storage[selected_slot].equip && equip[i] == 0)
							{
								equip[i] = storage[selected_slot];
								storage[selected_slot] = 0;
								if (equip[i] != noone)
								{
									equip[i].equipped = true;
								}
								break;
							}
						}
					}
					else
					{
						if (selected_slot < array_length(storage) - 5)
						{
							for (var i = 20; i < array_length(storage); i++)
							{
								if (storage[i] == 0)
								{
									break;
								}
							}
							if (i < array_length(storage))
							{
								storage[i] = storage[selected_slot];
								storage[selected_slot] = 0;
							}
						}
						else
						{
							for (var i = 0; i < array_length(storage) - 5; i++)
							{
								if (storage[i] == 0)
								{
									break;
								}
							}
							if (i < array_length(storage) - 5)
							{
								storage[i] = storage[selected_slot];
								storage[selected_slot] = 0;
							}
						}
					}
				}
			}
		}
		else
		{
			var mouse_tenp = mouse_item;		
			if (selected_array)
			{
				if (mouse_item == 0 || mouse_item.equip == equip_allow[selected_slot])
				{
					if (equip[selected_slot] != 0)
					{
						equip[selected_slot].equipped = false;
					}
					mouse_item = equip[selected_slot];
					mouse_item.held = false;
					equip[selected_slot] = mouse_tenp;
					if (equip[selected_slot] != 0)
					{
						equip[selected_slot].equipped = true;
					}
				}
			}
			else
			{
				mouse_item = storage[selected_slot];
				mouse_item.held = false;
				storage[selected_slot] = mouse_tenp;
			}
		}
	}
}
else
{
	var change = mouse_wheel_down() - mouse_wheel_up();
	storage[hotbar_slot + 20].held = false;
	hotbar_slot = (hotbar_slot + change + 5) % 5;
	storage[hotbar_slot + 20].held = true;
}