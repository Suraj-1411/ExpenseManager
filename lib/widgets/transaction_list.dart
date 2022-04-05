import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> userTransactions;

  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: widget.userTransactions.length,
          itemBuilder: (ctx, index) {
            return TransactionItem(
              tx: widget.userTransactions[index],
            );
          }),
    );
  }
}
