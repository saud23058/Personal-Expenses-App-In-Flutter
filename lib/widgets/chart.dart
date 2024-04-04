import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/chart_bars.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart({super.key, required this.recentTransaction});
  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].money;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending{
    return groupTransactionValues.fold(0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupTransactionValues.map((data) {
          return Flexible(
           fit: FlexFit.tight,
            child: ChartBars(
                label: data['day']. toString(),
                spendings: data['amount']as double ,
                percentageOfTotal:totalSpending ==0.0 ? 0.0 : (data['amount'] as double) / totalSpending,),
          );
        }).toList()),
      ),
    );
  }
}
