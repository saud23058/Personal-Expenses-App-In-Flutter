import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
class TransactionsList extends StatelessWidget {
  final List<Transaction> transaction ;
   TransactionsList({super.key, required this.transaction});



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: transaction.map((tx) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\$ ${tx.money}",
                  style: const TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  DateFormat.yMMMd().format(tx.date),
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
