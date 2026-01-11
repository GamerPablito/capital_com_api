package capitalcom.formats;

typedef MarketInfoDealingRules = {
	minStepDistance:DealingRule,
	minDealSize:DealingRule,
	maxDealSize:DealingRule,
	minSizeIncrement:DealingRule,
	minGuaranteedStopDistance:DealingRule,
	minStopOrProfitDistance:DealingRule,
	maxStopOrProfitDistance:DealingRule,
	marketOrderPreference:String,
	trailingStopsPreference:String
}

typedef DealingRule = {
	unit:String,
	value:Float
}
