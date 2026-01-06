package capitalcom;

import capitalcom.formats.*;
import capitalcom.types.*;
import haxe.Http;
import haxe.Json;
import haxe.io.BytesOutput;
import lime.app.Future;
import lime.app.Promise;
import openfl.net.URLRequestMethod;

using StringTools;

class API {
	public static var tradingData(default, null):TradingData = {
		demo: true,
		apiEmail: "",
		apiKey: "",
		apiKeyPassword: ""
	};

	private static var SECURITY_TOKEN:String = "";
	private static var CST:String = "";

	private static function createRequest(method:URLRequestMethod, command:String, ?params:Map<String, String>, ?data:Dynamic):Future<Dynamic> {
		var promise = new Promise<Dynamic>();
		var http:Http = new Http('https://${tradingData.demo ? "demo-" : ""}api-capital.backend-capital.com/api/v1/$command');

		http.addHeader("Content-Type", "application/json");
		if (SECURITY_TOKEN != "" && CST != "") {
			http.addHeader("X-SECURITY-TOKEN", SECURITY_TOKEN);
			http.addHeader("CST", CST);
		}
		if (method == POST && command == "session")
			http.addHeader("X-CAP-API-KEY", tradingData.apiKey);

		if (params != null)
			for (k => v in params)
				http.addParameter(k, v);
		if (data != null)
			http.setPostData(Json.stringify(data));

		http.onData = function(data) {
			var _data = Json.parse(data);
			if (_data.errorCode != null)
				promise.error(_data.errorCode);
			promise.complete(_data);
		}
		http.onError = err -> promise.error(err);
		http.customRequest(method == POST, null, null, method);

		if (http.responseHeaders.exists("X-SECURITY-TOKEN"))
			SECURITY_TOKEN = http.responseHeaders.get("X-SECURITY-TOKEN");
		if (http.responseHeaders.exists("CST"))
			CST = http.responseHeaders.get("CST");

		return promise.future;
	}

	public static function init(data:TradingData):Future<Dynamic> {
		tradingData = data;
		return createRequest(POST, "session", {identifier: tradingData.apiEmail, password: tradingData.apiKeyPassword});
	}

	public static function finish():Future<Dynamic>
		return createRequest(DELETE, "session");

	public static function serverPing():Future<String>
		return createRequest(GET, "ping").then(res -> Future.withValue(res.status));

	public static function serverTime():Future<Float>
		return createRequest(GET, "time").then(res -> Future.withValue(res.serverTime));

	public static function sessionDetails():Future<Session>
		return createRequest(GET, "session").then(res -> Future.withValue(res));

	public static function accountInfo():Future<Array<Account>>
		return createRequest(GET, "accounts").then(res -> Future.withValue(res.accounts));

	public static function accountPrefs():Future<Preferences>
		return createRequest(GET, "accounts/preferences").then(res -> Future.withValue(res));

	public static function updateAccountPrefs(prefs:Preferences):Future<String>
		return createRequest(PUT, "accounts/preferences", prefs).then(res -> Future.withValue(res.status));

	overload extern inline public static function accountHistory(from:String, to:String, detailed:Bool, ?filter:Filter):Future<Array<Activity>> {
		var filterStr:String = "";
		if (filter != null) {
			if (filter.epic != null)
				filterStr += 'epic==${filter.epic},';
			if (filter.source != null)
				filterStr += 'source==${filter.source},';
			if (filter.status != null)
				filterStr += 'status==${filter.status},';
			if (filter.type != null)
				filterStr += 'type==${filter.type}';
		}

		return createRequest(GET, "history/activity", [
			"from" => from,
			"to" => to,
			"detailed" => Std.string(detailed),
			"filter" => filterStr
		]).then(res -> Future.withValue(res.activities));
	}

	overload extern inline public static function accountHistory(lastPeriod:Int, detailed:Bool, ?filter:Filter):Future<Array<Activity>> {
		var filterStr:String = "";
		if (filter != null) {
			if (filter.epic != null)
				filterStr += 'epic==${filter.epic},';
			if (filter.source != null)
				filterStr += 'source==${filter.source},';
			if (filter.status != null)
				filterStr += 'status==${filter.status},';
			if (filter.type != null)
				filterStr += 'type==${filter.type}';
		}

		return createRequest(GET, "history/activity", [
			"lastPeriod" => Std.string(lastPeriod),
			"detailed" => Std.string(detailed),
			"filter" => filterStr
		]).then(res -> Future.withValue(res.activities));
	}

	overload extern inline public static function accountHistory(dealId:String, detailed:Bool):Future<Activity>
		return createRequest(GET, "history/activity",
			["dealId" => dealId, "detailed" => Std.string(detailed)]).then(res -> Future.withValue(res.activities[0]));

	overload extern inline public static function transactionHistory(from:String, to:String, detailed:Bool, ?type:TransactionType):Future<Array<Transaction>> {
		var params = ["from" => from, "to" => to, "detailed" => Std.string(detailed)];
		if (type != null)
			params.set("type", type);
		return createRequest(GET, "history/transactions", params).then(res -> Future.withValue(res.transactions));
	}

	overload extern inline public static function transactionHistory(lastPeriod:Int, detailed:Bool, ?type:TransactionType):Future<Array<Transaction>> {
		var params = ["lastPeriod" => Std.string(lastPeriod), "detailed" => Std.string(detailed)];
		if (type != null)
			params.set("type", type);
		return createRequest(GET, "history/transactions", params).then(res -> Future.withValue(res.transactions));
	}

	public static function adjustDemoBalance(amount:Float):Future<Bool>
		return createRequest(POST, 'accounts/topUp', {amount: amount}).then(res -> Future.withValue(res.successful == true));

	public static function getPositions():Future<Array<Position>>
		return createRequest(GET, 'positions').then(res -> Future.withValue(res.positions));

	public static function getPosition(dealId:String):Future<Position>
		return createRequest(GET, 'positions/$dealId').then(res -> Future.withValue(res.position));

	public static function createPosition(request:PositionRequest):Future<String>
		return createRequest(POST, 'positions', request).then(res -> Future.withValue(res.dealReference));

	public static function updatePosition(dealId:String, update:PositionUpdate):Future<String>
		return createRequest(PUT, 'positions/$dealId', update).then(res -> Future.withValue(res.dealReference));

	public static function deletePosition(dealId:String):Future<String>
		return createRequest(DELETE, 'positions/$dealId').then(res -> Future.withValue(res.dealReference));

	public static function deleteAllPositions(filter:Position->Bool):Future<Bool> {
		return getPositions().then(function(positions) {
			var promise = new Promise<Bool>();
			for (p in positions.filter(filter)) {
				deletePosition(p.position.dealId).onError(e -> promise.error(e));
				if (promise.isError)
					break;
			}
			return promise.future;
		});
	}

	public function getConfirmation(dealReference:String):Future<String>
		return createRequest(GET, 'confirms/$dealReference').then(res -> res.affectedDeals[0].dealId);

	public static function getOrders():Future<Array<Order>>
		return createRequest(GET, 'workingorders').then(res -> Future.withValue(res.workingOrders));

	public static function createOrder(request:OrderRequest):Future<String>
		return createRequest(POST, 'workingorders', request).then(res -> Future.withValue(res.dealReference));

	public static function updateOrder(dealId:String, update:OrderUpdate):Future<String>
		return createRequest(PUT, 'workingOrders/$dealId', update).then(res -> Future.withValue(res.dealReference));

	public static function deleteOrder(dealId:String):Future<String>
		return createRequest(DELETE, 'workingorders/$dealId').then(res -> Future.withValue(res.dealReference));

	public static function getPrices(epic:String, resolution:Resolution, ?max:Int, ?from:String, ?to:String):Future<Array<Price>> {
		var params = ["resolution" => resolution];
		if (max != null)
			params.set("max", Std.string(max));
		if (from != null)
			params.set("from", from);
		if (to != null)
			params.set("to", to);
		return createRequest(GET, 'prices/$epic', params).then(res -> Future.withValue(res.prices));
	}
}
