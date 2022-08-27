// CONSTANTS

// Used for Vector Arrays
#macro X 0
#macro Y 1
#macro Z 2

#macro VECTOR2 1
#macro VECTOR3 2

#macro WALK_SPEED 8
#macro DESC_WIDTH 360

enum ITEM_DATA
{
	NAME,
	DESCRIPTION,
	SPRITE,
	TYPE,
	EXT_DATA
}
enum EQUIP
{
	NONE,
	HELMET,
	CHEST,
	LEGGINGS,
	BOOTS,
	AMULET,
	RING,
	BELT
}

// SHORTCUTS
#macro CONTROL obj_controls
#macro ITEM obj_init