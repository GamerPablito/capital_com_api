package capitalcom.formats;

typedef MarketInfoSnapshot = {
	marketStatus:String,
	netChange:Float,
	percentageChange:Float,
	updateTime:String,
	delayTime:Float,
	bid:Float,
	offer:Float,
	high:Float,
	low:Float,
	decimalPlacesFactor:Int,
	scalingFactor:Float,
	marketModes:Array<String>
}
