import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
              margin: const EdgeInsets.all(1),
              child: ListTile(
                  dense: true,
                  leading: const Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 35,
                  ),
                  title: Text(transaction.title,
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle: Text(
                      DateFormat('d MMM y - E').format(transaction.date),
                      style: Theme.of(context).textTheme.bodySmall),
                  trailing: Text(
                    'R\$ ${transaction.value.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )));
        },
      ),
    );
  }
}
