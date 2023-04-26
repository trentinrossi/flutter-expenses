import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: valueController,
              decoration: InputDecoration(labelText: 'Valor R\$'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      print(titleController.text);
                      print(valueController.text);
                    },
                    child: const Text(
                      'Nova transação',
                      style: TextStyle(color: Colors.purple),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
