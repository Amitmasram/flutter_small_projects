import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function(String, double) addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionForm(this.addTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              style: const TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontFamily: 'OpenSans',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final amount = double.parse(amountController.text);

                addTransaction(title, amount);

                titleController.clear();
                amountController.clear();
              },
              // ignore: sort_child_properties_last
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
