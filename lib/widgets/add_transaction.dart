import 'package:expense_manager/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;

  const AddTransaction({Key? key, required this.addTransaction})
      : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _userPickedDate;
  TextEditingController transNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  bool _valid() {
    return transNameController.text.toString().isNotEmpty &&
        amountController.text.toString().isNotEmpty &&  _userPickedDate !=null;
  }

  void _displayDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value){
      setState(() {
        _userPickedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text( _userPickedDate == null ? 'Please select Date' : DateFormat.yMd().format(_userPickedDate!)),
              TextButton(
                onPressed: _displayDatePicker,
                child: const Text('Select Date'),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
            onPressed: () {
              if (_valid()) {
                widget.addTransaction(
                  Transaction(
                      id: 0,
                      amount: double.parse(amountController.text.toString()),
                      transName: transNameController.text.toString(),
                      date: _userPickedDate!),
                );
              }
            },
            child: const Text(
              'Add Transaction',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
