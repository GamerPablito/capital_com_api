package capitalcom.formats;

typedef Price = {
	snapshotTime:String,
	snapshotTimeUTC:String,
	ohlc:PriceBidAsk,
	lastTradedVolume:Float
}
