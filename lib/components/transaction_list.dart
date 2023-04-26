import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((e) => Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text('R\$ ${e.value.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(DateFormat('d MMM y').format(e.date),
                            style: const TextStyle(color: Colors.grey))
                      ],
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
