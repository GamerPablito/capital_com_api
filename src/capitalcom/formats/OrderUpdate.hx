package capitalcom.formats;

typedef OrderUpdate = PositionUpdate & {
	?level:Float,
	?goodTillDate:String
}
