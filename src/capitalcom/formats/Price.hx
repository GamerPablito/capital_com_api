package formats;

typedef Price =
{
	snapshotTime:String,
	snapshotTimeUTC:String,
	openPrice:PriceBidAsk,
	closePrice:PriceBidAsk,
	highPrice:PriceBidAsk,
	lowPrice:PriceBidAsk,
	lastTradedVolume:Float
}
