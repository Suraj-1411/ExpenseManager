import 'package:expense_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionItem extends StatefulWidget {
  final Transaction tx;

  const TransactionItem({Key? key, required this.tx}) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.cyan, width: 2, style: BorderStyle.solid),
            ),
            child: Text(
              '\$${widget.tx.amount}',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.cyan),
            ),
          ),
          const SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.tx.transName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              Text(
                DateFormat.yMMMMd("en_US").format(widget.tx.date),
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
