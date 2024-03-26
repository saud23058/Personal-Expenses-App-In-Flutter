import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/newTransaction.dart';
import 'package:personal_expenses_app/widgets/transactionsList.dart';
import 'package:personal_expenses_app/widgets/userTransaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
 const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              child: const Card(
                color: Colors.orange,
                child: Text("Chart"),
              )),
          const UserTransactions()
        ],
      ),
    );
  }
}
