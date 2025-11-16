package capitalcom.types;

enum abstract FilterType(String) from String to String {
	public var POSITION:String = "POSITION";
	public var WORKING_ORDER:String = "WORKING_ORDER";
	public var EDIT_STOP_AND_LIMIT:String = "EDIT_STOP_AND_LIMIT";
	public var SWAP:String = "SWAP";
	public var SYSTEM:String = "SYSTEM";
}
