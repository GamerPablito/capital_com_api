package capitalcom;

import capitalcom.formats.Price;

class TA
{
	public static function ohlcAsk(p:Price):Float
		return (p.openPrice.ask + p.highPrice.ask + p.lowPrice.ask + p.closePrice.ask) / 4;

	public static function ohlcBid(p:Price):Float
		return (p.openPrice.bid + p.highPrice.bid + p.lowPrice.bid + p.closePrice.bid) / 4;

	public static function heikinAshi(prices:Array<Price>):Array<Price>
	{
		if (prices.length < 2)
			return [];

		var _prices:Array<Price> = prices.map(p -> Tools.clone(p));
		for (i => p in _prices)
		{
			p.closePrice.bid = ohlcBid(p);
			p.closePrice.ask = ohlcAsk(p);

			if (i > 0)
			{
				var prev:Price = _prices[i - 1];
				p.openPrice.bid = (prev.openPrice.bid + prev.closePrice.bid) / 2;
				p.openPrice.ask = (prev.openPrice.ask + prev.closePrice.ask) / 2;
			}

			p.highPrice.bid = Math.max(p.highPrice.bid, Math.max(p.openPrice.bid, p.closePrice.bid));
			p.highPrice.ask = Math.max(p.highPrice.ask, Math.max(p.openPrice.ask, p.closePrice.ask));
			p.lowPrice.bid = Math.min(p.lowPrice.bid, Math.min(p.openPrice.bid, p.closePrice.bid));
			p.lowPrice.ask = Math.min(p.lowPrice.ask, Math.min(p.openPrice.ask, p.closePrice.ask));
		}
		return _prices;
	}

	public static function avg(values:Array<Float>):Float
	{
		if (values.length == 0)
			return 0;

		var value:Float = 0;
		for (v in values)
			value += v;
		return value / values.length;
	}

	public static function sma(amount:Int, prices:Array<Float>):Array<Float>
	{
		amount = Std.int(Math.abs(amount));
		if (prices.length == 0)
			return [];

		var _values:Array<Float> = [];
		var values:Array<Float> = [];
		for (i => p in prices)
		{
			_values.push(p);
			while (_values.length > amount)
				_values.shift();
			values.push(avg(_values));
		}
		return values;
	}

	public static function ema(amount:Int, prices:Array<Float>):Array<Float>
	{
		amount = Std.int(Math.abs(amount));
		if (prices.length == 0)
			return [];

		var _values:Array<Float> = [];
		var values:Array<Float> = [];
		var alpha:Float = 2 / (amount + 1);
		var prev:Float = 0;

		for (i => p in prices)
		{
			if (i >= amount)
				break;

			_values.push(p);
			prev = avg(_values);
		}
		for (i => p in prices)
		{
			if (i < amount - 1)
				values.push(0);
			else if (i == amount - 1)
				values.push(prev);
			else
				values.push(prev = (alpha * p) + ((1 - alpha) * prev));
		}
		return values;
	}

	public static function highest(values:Array<Float>):Float
	{
		var high:Float = 0;
		for (v in values)
			if (high == 0 || v > high)
				high = v;
		return high;
	}

	public static function lowest(values:Array<Float>):Float
	{
		var low:Float = 0;
		for (v in values)
			if (low == 0 || v < low)
				low = v;
		return low;
	}

	overload extern inline public function crossover(prices1:Array<Float>, prices2:Array<Float>):Bool
	{
		if (prices1.length < 2 || prices2.length < 2)
			return false;
		return prices1[prices1.length - 1] > prices2[prices2.length - 1] && prices1[prices1.length - 2] < prices2[prices2.length - 2];
	}

	overload extern inline public function crossover(prices:Array<Float>, value:Float):Bool
	{
		if (prices.length < 2)
			return false;
		return prices[prices.length - 1] > value && prices[prices.length - 2] < value;
	}

	overload extern inline public function crossunder(prices1:Array<Float>, prices2:Array<Float>):Bool
	{
		if (prices1.length < 2 || prices2.length < 2)
			return false;
		return prices1[prices1.length - 1] < prices2[prices2.length - 1] && prices1[prices1.length - 2] > prices2[prices2.length - 2];
	}

	overload extern inline public function crossunder(prices:Array<Float>, value:Float):Bool
	{
		if (prices.length < 2)
			return false;
		return prices[prices.length - 1] < value && prices[prices.length - 2] > value;
	}

	overload extern inline public function cross(prices1:Array<Float>, prices2:Array<Float>):Bool
		return crossover(prices1, prices2) || crossunder(prices1, prices2);

	overload extern inline public function cross(prices:Array<Float>, value:Float):Bool
		return crossover(prices, value) || crossunder(prices, value);
}
