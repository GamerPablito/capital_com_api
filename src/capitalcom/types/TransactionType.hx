package types;

enum abstract TransactionType(String) from String to String
{
	public var INACTIVITY_FEE:String = "INACTIVITY_FEE";
	public var RESERVE:String = "RESERVE";
	public var VOID:String = "VOID";
	public var UNRESERVE:String = "UNRESERVE";
	public var WRITE_OFF_OR_CREDIT:String = "WRITE_OFF_OR_CREDIT";
	public var CREDIT_FACILITY:String = "CREDIT_FACILITY";
	public var FX_COMMISSION:String = "FX_COMMISSION";
	public var COMPLAINT_SETTLEMENT:String = "COMPLAINT_SETTLEMENT";
	public var DEPOSIT:String = "DEPOSIT";
	public var WITHDRAWAL:String = "WITHDRAWAL";
	public var REFUND:String = "REFUND";
	public var WITHDRAWAL_MONEY_BACK:String = "WITHDRAWAL_MONEY_BACK";
	public var TRADE:String = "TRADE";
	public var SWAP:String = "SWAP";
	public var TRADE_COMMISSION:String = "TRADE_COMMISSION";
	public var TRADE_COMMISSION_GSL:String = "TRADE_COMMISSION_GSL";
	public var NEGATIVE_BALANCE_PROTECTION:String = "NEGATIVE_BALANCE_PROTECTION";
	public var TRADE_CORRECTION:String = "TRADE_CORRECTION";
	public var CHARGEBACK:String = "CHARGEBACK";
	public var ADJUSTMENT:String = "ADJUSTMENT";
	public var BONUS:String = "BONUS";
	public var TRANSFER:String = "TRANSFER";
	public var CORPORATE_ACTION:String = "CORPORATE_ACTION";
	public var CONVERSION:String = "CONVERSION";
	public var REBATE:String = "REBATE";
	public var TRADE_SLIPPAGE_PROTECTION:String = "TRADE_SLIPPAGE_PROTECTION";
}
