package capitalcom.types;

enum abstract OrderType(String) from String to String {
	public var LIMIT:String = "LIMIT";
	public var STOP:String = "STOP";
}
