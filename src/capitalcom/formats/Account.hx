package capitalcom.formats;

typedef Account = {
	accountId:String,
	accountName:String,
	status:capitalcom.types.FilterStatus,
	accountType:String,
	preferred:Bool,
	balance:{
		balance:Float, deposit:Float, profitLoss:Float, available:Float
	},
	currency:String,
	symbol:String
}
