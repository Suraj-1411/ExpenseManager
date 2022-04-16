import 'package:expense_manager/models/transaction.dart';
import 'package:expense_manager/widgets/add_transaction.dart';
import 'package:flutter/material.dart';
import '../widgets/chart.dart';
import '../widgets/transaction_list.dart';
import '../widgets/no_transactions_found.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 1,
      amount: 22.45,
      transName: 'Shopping',
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      amount: 19.23,
      transName: 'Monthly Expenses',
      date: DateTime.now(),
    ),
    Transaction(
      id: 3,
      amount: 30.21,
      transName: 'Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: 4,
      amount: 12.99,
      transName: 'Food',
      date: DateTime.now(),
    ),
    Transaction(
      id: 5,
      amount: 37.23,
      transName: 'Gifts',
      date: DateTime.now(),
    ),
    Transaction(
      id: 1,
      amount: 22.45,
      transName: 'Shopping',
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      amount: 19.23,
      transName: 'Monthly Expenses',
      date: DateTime.now(),
    ),
    Transaction(
      id: 3,
      amount: 30.21,
      transName: 'Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: 4,
      amount: 12.99,
      transName: 'Food',
      date: DateTime.now(),
    ),
    Transaction(
      id: 5,
      amount: 37.23,
      transName: 'Gifts',
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(Transaction trans) {
    setState(() {
      _userTransactions.add(trans);
    });
    Navigator.of(context).pop();
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddTransaction(
            addTransaction: _addTransaction,
          );
        });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _openBottomSheet,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Expense Manager'),
        actions: [
          IconButton(onPressed: _openBottomSheet, icon: const Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(
              recentTransactions: _recentTransactions,
            ),
            _userTransactions.isNotEmpty
                ? TransactionList(userTransactions: _userTransactions)
                : const NoTransactionsFound(),
          ],
        ),
      ),
    );
  }
}
