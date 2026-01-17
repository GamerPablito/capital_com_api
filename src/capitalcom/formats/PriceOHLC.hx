package capitalcom.formats;

typedef PriceOHLC = {
	snapshotTime:String,
	snapshotTimeUTC:String,
	ohlc:PriceBidAsk,
	lastTradedVolume:Float
}
