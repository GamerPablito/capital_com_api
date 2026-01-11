package capitalcom.formats;

typedef MarketInfoInstrument = {
	epic:String,
	symbol:String,
	expiry:String,
	name:String,
	lotSize:Float,
	type:String,
	guaranteedStopAllowed:Bool,
	streamingPricesAvailable:Bool,
	currency:String,
	marginFactor:Float,
	marginFactorUnit:String,
	openingHours:Array<{
		mon:Array<String>,
		tue:Array<String>,
		wed:Array<String>,
		thu:Array<String>,
		fri:Array<String>,
		sat:Array<String>,
		sun:Array<String>,
		zone:String
	}>,
	overnightFee:{
		longRate:Float, shortRate:Float, swapChargeTimestamp:Float, swapChargeInterval:Float
	}
}
