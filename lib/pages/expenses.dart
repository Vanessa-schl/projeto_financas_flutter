import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpenseModal extends StatefulWidget {
  final Function(double) onAddExpense;
  final Function(double) onAddIncome;

  AddExpenseModal({required this.onAddExpense, required this.onAddIncome});

  @override
  _AddExpenseModalState createState() => _AddExpenseModalState();
}

class _AddExpenseModalState extends State<AddExpenseModal> {
  final _formKey = GlobalKey<FormState>();
  String _type = "Saida";
  double _amount = 0.0;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_type == "Saida") {
        widget.onAddExpense(_amount);
      } else {
        widget.onAddIncome(_amount);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: _type,
              items: ["Saida", "Entrada"]
                  .map((type) => DropdownMenuItem(
                        child: Text(type),
                        value: type,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _type = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: "Total"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an amount";
                }

                if (double.tryParse(value) == null) {
                  return "Please enter a valid number";
                }

                if (double.parse(value) <= 0) {
                  return "Amount must be greater than zero";
                }

                return null;
              },
              onSaved: (value) {
                _amount = double.parse(value!);
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
