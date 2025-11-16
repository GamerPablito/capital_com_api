package formats;

typedef PositionRequest = PositionUpdate &
{
	direction:Direction,
	epic:String,
	size:Float
}
