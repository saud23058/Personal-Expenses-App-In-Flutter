import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/newTransaction.dart';
import 'package:personal_expenses_app/widgets/transactionsList.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> userTransaction = [
    Transaction(
      id: "t1",
      title: "Shoe",
      money: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "car",
      money: 67.99,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, double amount) {
    print("Function Called");
    final newTx = Transaction(
      title: title,
      money: amount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );
    setState(() {
      userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(newTx:_addNewTransaction),
        TransactionsList(
          transaction: userTransaction,
        )
      ],
    );
  }
}
