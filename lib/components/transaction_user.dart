import 'dart:math';

import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo tenis de corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Conta de luz', value: 150.90, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Conta de agua', value: 150.90, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'Internet', value: 150.90, date: DateTime.now()),
    Transaction(
        id: 't5', title: 'Netflix', value: 150.90, date: DateTime.now()),
    Transaction(
        id: 't6', title: 'Parcela casa', value: 150.90, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionForm(_addTransaction),
      TransactionList(transactions: _transactions)
    ]);
  }
}
