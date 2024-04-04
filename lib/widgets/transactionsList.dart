import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionsList(
      {super.key, required this.transaction, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transaction.isEmpty
          ? const Center(
              child: Text(
              "No transactions added yet!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transaction[index].money}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: IconButton(
                        onPressed: () => deleteTx(transaction[index].id),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                );
              },
            ),
    );
  }
}
