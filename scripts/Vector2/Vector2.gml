//@function lengthdir(length, direction)
function lengthdir(_length, _direction)
{
	var _vel
	_vel[X] = lengthdir_x(_length, _direction);
	_vel[Y] = lengthdir_y(_length, _direction);
	return _vel
}
//@function lengthdir(X, Y)
function Vector2(_x, _y)
{
	var _V2
	_V2[X] = _x;
	_V2[Y] = _y;
	return _V2
}