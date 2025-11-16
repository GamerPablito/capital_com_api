package capitalcom.formats;

typedef Transaction = {
	date:String,
	dateUtc:String,
	transactionType:capitalcom.types.TransactionType,
	note:String,
	reference:String,
	size:String,
	currency:String,
	status:String
}
