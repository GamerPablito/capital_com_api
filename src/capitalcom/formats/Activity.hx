package capitalcom.formats;

typedef Activity = {
	date:String,
	dateUTC:String,
	epic:String,
	dealId:String,
	source:capitalcom.types.FilterSource,
	type:capitalcom.types.FilterType,
	status:capitalcom.types.FilterStatus,
	?details:{
		dealReference:String,
		marketName:String,
		currency:String,
		size:Float,
		direction:capitalcom.types.Direction,
		level:Float,
		guaranteedStop:Bool,
		?workingOrderId:String,
		?openPrice:Float
	}
}
