package capitalcom.formats;

typedef MarketData = {
	instrumentName:String,
	expiry:String,
	marketStatus:String,
	epic:String,
	symbol:String,
	instrumentType:String,
	lotSize:Float,
	high:Float,
	low:Float,
	percentageChange:Float,
	netChange:Float,
	bid:Float,
	offer:Float,
	updateTime:String,
	updateTimeUTC:String,
	delayTime:Float,
	streamingPricesAvailable:Bool,
	scalingFactor:Float,
	marketModes:Array<String>
}
