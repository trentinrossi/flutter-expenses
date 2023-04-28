import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  // Esta função o componente pai vai passar aqui para ela executar
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextField(
              controller: titleController,
              onSubmitted: (value) => _submitForm,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => _submitForm,
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Valor R\$',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(
                        'Adicionar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
