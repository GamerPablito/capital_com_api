package formats;

typedef OrderUpdate = PositionUpdate &
{
	?level:Float,
	?goodTillDate:String
}
