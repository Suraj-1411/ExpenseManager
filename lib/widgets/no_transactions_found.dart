import 'package:flutter/material.dart';

class NoTransactionsFound extends StatelessWidget {
  const NoTransactionsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'No Transactions Found',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/no_trans_img.png'),
        ],
      ),
    );
  }
}
