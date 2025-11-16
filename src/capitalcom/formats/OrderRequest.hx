package capitalcom.formats;

typedef OrderRequest = PositionRequest & {
	level:Float,
	type:capitalcom.types.OrderType,
	?goodTillDate:String
}
