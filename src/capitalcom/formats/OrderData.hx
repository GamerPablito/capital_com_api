package capitalcom.formats;

typedef OrderData = {
	dealId:String,
	direction:capitalcom.types.Direction,
	epic:String,
	orderSize:Float,
	leverage:Int,
	orderLevel:Float,
	timeInForce:String,
	goodTillDate:String,
	goodTillDateUTC:String,
	createdDate:String,
	createdDateUTC:String,
	guaranteedStop:Bool,
	orderType:capitalcom.types.OrderType,
	stopDistance:Float,
	profitDistance:Float,
	trailingStop:Bool,
	currencyCode:String
}
