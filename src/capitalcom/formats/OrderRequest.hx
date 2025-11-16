package capitalcom.formats;

typedef OrderRequest = PositionRequest & {
	level:Float,
	type:OrderType,
	?goodTillDate:String
}
