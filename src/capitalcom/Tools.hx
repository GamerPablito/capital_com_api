package capitalcom;

using Reflect;

class Tools
{
	public function extractCSV(data:Array<Array<String>>):String
	{
		var content:String = "";
		for (row in data)
		{
			for (cell in row)
				content += '$cell,';
			content += '\n';
		}
		return content;
	}

	public static function clone<T>(obj:T):T
	{
		if (obj == null)
			return null;

		return switch (Type.typeof(obj))
		{
			case TObject:
				var out:Dynamic = {};
				for (field in obj.fields())
					out.setField(field, clone(obj.field(field)));
				cast out;
			case TClass(_) if (Std.isOfType(obj, Array)):
				var arr = cast(obj, Array<Dynamic>);
				cast [for (v in arr) clone(v)];
			default: obj;
		}
	}
}
