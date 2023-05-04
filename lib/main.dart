import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_graph.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(
      fontFamily: 'Roboto',
    );

    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.green,
            brightness: Brightness.light,
          ),
          // fontFamily: 'Roboto',
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.normal,
            ),
          ),
          textTheme: tema.textTheme.copyWith(
            titleMedium: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            titleLarge: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyMedium: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            labelSmall: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            labelMedium: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(transaction);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: _transactions.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TransactionGraph(transactions: _recentTransactions),
                  SizedBox(height: 12),
                  TransactionList(transactions: _transactions)
                  // TransactionUser()
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nenhuma transação cadastrada',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Icon(
                  Icons.hourglass_empty,
                  size: 200,
                  color: Colors.grey[300],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
