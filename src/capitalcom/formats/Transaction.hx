package formats;

typedef Transaction =
{
	date:String,
	dateUtc:String,
	transactionType:TransactionType,
	note:String,
	reference:String,
	size:String,
	currency:String,
	status:String
}
