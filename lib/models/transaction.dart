class Transaction {
  final String id;
  final String title;
  final double money;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.money,
      required this.date});
}
