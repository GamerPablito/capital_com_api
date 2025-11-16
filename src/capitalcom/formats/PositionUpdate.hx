package capitalcom.formats;

typedef PositionUpdate = {
	?guaranteedStop:Bool,
	?trailingStop:Bool,
	?stopLevel:Float,
	?stopDistance:Float,
	?stopAmount:Float,
	?profitLevel:Float,
	?profitDistance:Float,
	?profitAmount:Float
}
