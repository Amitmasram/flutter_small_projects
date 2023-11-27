class Transaction {
  final String title;
  final double amount;
  final String currency;

  Transaction(
      {required this.title, required this.amount, this.currency = '\u20B9'});
}
