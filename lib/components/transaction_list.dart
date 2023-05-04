import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onRemove;

  const TransactionList({
    Key? key,
    required this.transactions,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 660,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
              margin: const EdgeInsets.all(1),
              child: Slidable(
                key: const ValueKey(0),
                // The end action pane is the one at the right or the bottom side.
                endActionPane: ActionPane(
                  dismissible: DismissiblePane(onDismissed: () {}),
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (tr) => onRemove(transaction.id),
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
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
                  ),
                ),
              ));
        },
      ),
    );
  }
}
