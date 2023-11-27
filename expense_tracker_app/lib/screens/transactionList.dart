import 'package:expense_tracker_app/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(int) deleteTransaction;
  final Function(int) editTransaction;

  TransactionList({
    super.key,
    required this.transactions,
    required this.deleteTransaction,
    required this.editTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.asMap().entries.map((entry) {
        final int index = entry.key;
        final Transaction transaction = entry.value;

        return Card(
          elevation: 5,
          child: ListTile(
            title: Text(
              transaction.title,
              style: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${transaction.currency}${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => editTransaction(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteTransaction(index),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
