import 'package:expense_manager/models/transaction.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;

  const AddTransaction({Key? key, required this.addTransaction}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController transNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  bool _valid() {
    return transNameController.text.toString().isNotEmpty &&
        amountController.text.toString().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          TextField(
            controller: transNameController,
            keyboardType: TextInputType.name,
            decoration:
                const InputDecoration(labelText: 'Enter Transaction Name'),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Enter Amount'),
          ),
          TextButton(
            onPressed: () {
              if (_valid()) {
                widget.addTransaction(
                  Transaction(
                      id: 0,
                      amount: double.parse(amountController.text.toString()),
                      transName: transNameController.text.toString(),
                      date: DateTime.now()),
                );
              }
            },
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
