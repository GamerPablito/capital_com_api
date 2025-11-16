package capitalcom.types;

enum abstract Resolution(String) from String to String {
	public var MINUTE:String = "MINUTE";
	public var MINUTE_5:String = "MINUTE_5";
	public var MINUTE_15:String = "MINUTE_15";
	public var MINUTE_30:String = "MINUTE_30";
	public var HOUR:String = "HOUR";
	public var HOUR_4:String = "HOUR_4";
	public var DAY:String = "DAY";
	public var WEEK:String = "WEEK";
}
