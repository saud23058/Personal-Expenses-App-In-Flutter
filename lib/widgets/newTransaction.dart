import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
  final Function newTx;
  final  titleController =TextEditingController();
  final  amountController=TextEditingController();
   NewTransaction({super.key, required this.newTx});

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
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'amount'),
              // onChanged: (val)=>amountInput=val,
              controller: amountController,
            ),
            TextButton(onPressed: () {
             newTx(titleController.text,double.parse(amountController.text));
            }, child: const Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
