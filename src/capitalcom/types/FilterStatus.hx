package types;

enum abstract FilterStatus(String) from String to String
{
	public var ACCEPTED:String = "ACCEPTED";
	public var CREATED:String = "CREATED";
	public var EXECUTED:String = "EXECUTED";
	public var EXPIRED:String = "EXPIRED";
	public var REJECTED:String = "REJECTED";
	public var MODIFIED:String = "MODIFIED";
	public var MODIFY_REJECT:String = "MODIFY_REJECT";
	public var CANCELLED:String = "CANCELLED";
	public var CANCEL_REJECT:String = "CANCEL_REJECT";
	public var UNKNOWN:String = "UNKNOWN";
}
