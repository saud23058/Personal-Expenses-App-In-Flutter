import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionsList({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? const Center(
              child: Text(
              "No transactions added yet!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "\$ ${transaction[index].money.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transaction[index].date),
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
    );
  }
}
