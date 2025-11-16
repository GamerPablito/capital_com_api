package types;

enum abstract FilterSource(String) from String to String
{
	public var CLOSE_OUT:String = "CLOSE_OUT";
	public var DEALER:String = "DEALER";
	public var SL:String = "SL";
	public var SYSTEM:String = "SYSTEM";
	public var TP:String = "TP";
	public var USER:String = "USER";
}
