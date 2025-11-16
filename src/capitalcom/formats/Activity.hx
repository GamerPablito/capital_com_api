package formats;

typedef Activity =
{
	date:String,
	dateUTC:String,
	epic:String,
	dealId:String,
	source:FilterSource,
	type:FilterType,
	status:FilterStatus,
	?details:
		{
			dealReference:String,
			marketName:String,
			currency:String,
			size:Float,
			direction:Direction,
			level:Float,
			guaranteedStop:Bool
		}
}
