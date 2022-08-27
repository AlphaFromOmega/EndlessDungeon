/// @description ?

owner = obj_player;

d_width = display_get_gui_width();
d_height = display_get_gui_height();

hotbar_slot = 0;

selected_slot = -1;
selected_array = -1;

mouse_item = 0;
storage[24] = 0;

equip[7] = 0;

equip_allow[7] = EQUIP.BELT;
equip_allow[6] = EQUIP.RING;
equip_allow[5] = EQUIP.RING;
equip_allow[4] = EQUIP.AMULET;
equip_allow[3] = EQUIP.BOOTS;
equip_allow[2] = EQUIP.LEGGINGS;
equip_allow[1] = EQUIP.CHEST;
equip_allow[0] = EQUIP.HELMET;

cell_size = 64;

inventory_open = false

width = 9 * cell_size + 24;
height = (25 div 5) * cell_size + 24;

x = (d_width - width)/2;
y = (d_height - height)/2;

storage[0] = instance_create_depth(x, y, depth, item_ring);
storage[1] = instance_create_depth(x, y, depth, item_ring);
storage[2] = instance_create_depth(x, y, depth, item_ring);
storage[3] = instance_create_depth(x, y, depth, item_ring);
storage[4] = instance_create_depth(x, y, depth, item_ring);
storage[5] = instance_create_depth(x, y, depth, item_sword);
storage[6] = instance_create_depth(x, y, depth, item_spear);
storage[7] = instance_create_depth(x, y, depth, item_amulet);
storage[8] = instance_create_depth(x, y, depth, item_flail);