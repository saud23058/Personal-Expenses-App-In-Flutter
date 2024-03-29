import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTx;

  NewTransaction({super.key, required this.newTx});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle= titleController.text;
    final enteredAmount=double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <=0){
      return;
    }
    widget.newTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'title'),
              // onChanged: (val)=>titleInput=val,
              controller: titleController,
              onSubmitted: (_) =>submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>submitData(),
              decoration: const InputDecoration(labelText: 'amount'),
              // onChanged: (val)=>amountInput=val,
              controller: amountController,
            ),
            TextButton(
                onPressed:submitData,
                child: const Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
