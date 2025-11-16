package capitalcom.formats;

typedef PositionData = {
	contractSize:Float,
	createdDate:String,
	createdDateUTC:String,
	dealId:String,
	dealReference:String,
	workingOrderId:String,
	size:Float,
	leverage:Int,
	upl:Float,
	direction:Direction,
	level:Float,
	currency:String,
	guaranteedStop:Bool
}
