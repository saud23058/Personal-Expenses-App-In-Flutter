import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/chart.dart';
import 'package:personal_expenses_app/widgets/newTransaction.dart';
import 'package:personal_expenses_app/widgets/transactionsList.dart';


import 'models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> userTransaction = [
    // Transaction(
    //   id: "t1",
    //   title: "Shoe",
    //   money: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "car",
    //   money: 67.99,
    //   date: DateTime.now(),
    // )
  ];


  List<Transaction> get _recentTransaction {
    return userTransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList(); // Convert Iterable<Transaction> to List<Transaction>
  }

  void _addNewTransaction(String title, double amount) {
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
        title: Text("Personal Expense",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(recentTransaction: _recentTransaction),
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
