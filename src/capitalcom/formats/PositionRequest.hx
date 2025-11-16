package capitalcom.formats;

typedef PositionRequest = PositionUpdate & {
	direction:capitalcom.types.Direction,
	epic:String,
	size:Float
}
