import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/newTransaction.dart';
import 'package:personal_expenses_app/widgets/transactionsList.dart';


import 'models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTransaction(newTx: _addNewTransaction);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: const Card(
                  color: Colors.orange,
                  child: Text("Chart"),
                )),
            TransactionsList(transaction:userTransaction )

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
