package formats;

typedef Preferences =
{
	hedgingMode:Bool,
	leverages:
	{
		SHARES:Leverage, CURRENCIES:Leverage, INDICES:Leverage, CRYPTOCURRENCIES:Leverage, COMMODITIES:Leverage
	}
}
