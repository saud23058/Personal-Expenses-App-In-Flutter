import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTx;

  NewTransaction({super.key, required this.newTx});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void submitData() {
    if(amountController.text.isEmpty) return;
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate==null) {
      return;
    }
    widget.newTx(
      enteredTitle,
      enteredAmount,
      selectedDate,
    );
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((DatePicker) {
      if (DatePicker == null) {
        return;
      }
      setState(() {
        selectedDate = DatePicker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'title'),
              // onChanged: (val)=>titleInput=val,
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(labelText: 'amount'),
              // onChanged: (val)=>amountInput=val,
              controller: amountController,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(selectedDate == null
                      ? "No date  chosen"
                      : DateFormat.yMd().format(selectedDate!)),
                ),
                TextButton(
                    onPressed: presentDatePicker,
                    child: const Text(
                      "Choose date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            ElevatedButton(
                onPressed: submitData, child: const Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
