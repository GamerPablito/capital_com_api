package capitalcom.formats;

typedef Confirmation = {
	date:String,
	status:String,
	dealStatus:String,
	epic:String,
	dealReference:String,
	dealId:String,
	affectedDeals:Array<{
		dealId:String,
		status:String
	}>,
	level:Float,
	size:Float,
	direction:capitalcom.types.Direction,
	guaranteedStop:Bool,
	trailingStop:Bool
}
