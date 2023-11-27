import 'package:expense_tracker_app/screens/transactionForm.dart';
import 'package:flutter/material.dart';

import '../models/transaction_model.dart';
import 'transactionList.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExpenseTrackerState createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  List<Transaction> transactions = [];

  void _addTransaction(String title, double amount) {
    setState(() {
      transactions.add(Transaction(
        title: title,
        amount: amount,
      ));
    });
  }

  void _deleteTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  void _editTransaction(int index) {
    // Implement editing transaction logic here
  }

  double _calculateTotalExpense() {
    return transactions.fold(
        0.0, (sum, transaction) => sum + transaction.amount);
  }

  @override
  Widget build(BuildContext context) {
    double totalExpense = _calculateTotalExpense();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add a feature to navigate to a page for adding transactions
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Card(
                elevation: 5,
                child: Text(
                  'Your Chart Will Go Here',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TransactionList(
              transactions: transactions,
              deleteTransaction: _deleteTransaction,
              editTransaction: _editTransaction,
            ),
            TransactionForm(_addTransaction),
            Container(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: const Text(
                    'Total Expense',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    '\u20B9${totalExpense.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
