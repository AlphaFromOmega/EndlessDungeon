//@function approach(base, target, amount)
function approach(_base, _target, _amount)
{
	if (_base < _target)
	{
	    return min(_base + _amount, _target); 
	}
	else
	{
	    return max(_base - _amount, _target);
	}
}

function normalized(_x, _y)
{
	var _dir = point_direction(0, 0, _x, _y);
	
	var _normalize;
	_normalize[X] = lengthdir_x(1, _dir);
	_normalize[Y] = lengthdir_y(1, _dir);
	return _normalize;
}