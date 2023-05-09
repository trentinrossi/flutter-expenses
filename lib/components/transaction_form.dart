import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  // Esta função o componente pai vai passar aqui para ela executar
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 01, 01),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            AdaptativeField(
                label: 'Título',
                onSubmitted: _submitForm,
                controller: _titleController,
                inputType: TextInputType.text),
            SizedBox(height: 30),
            AdaptativeField(
                label: 'Valor R\$',
                onSubmitted: _submitForm,
                controller: _valueController,
                inputType: TextInputType.numberWithOptions(decimal: true)),
            SizedBox(height: 10),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(_selectedDate == null
                      ? 'Nenhuma data selecionada'
                      : DateFormat('dd/MM/y').format(_selectedDate)),
                  TextButton(
                      onPressed: _showDatePicker,
                      child: Text('Selecionar data'))
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: AdaptativeButton(
                    onPressed: _submitForm,
                    label: 'Adicionar',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
