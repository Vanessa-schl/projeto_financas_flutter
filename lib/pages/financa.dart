import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_financas_flutter/pages/expenses.dart';


class Financas extends StatefulWidget {
  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<Financas> {
  double totalIncome = 0.0;
  double totalExpenses = 0.0;

  void _addExpense(double expenseAmount) {
    setState(() {
      totalExpenses += expenseAmount;
    });
  }

  void _addIncome(double incomeAmount) {
    setState(() {
      totalIncome += incomeAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 136, 171),
        title: const Center(child: Text("Finaças")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Color.fromARGB(255, 224, 104, 144),
              child: ListTile(
                title: const Text("Entradas", style: TextStyle(fontSize: 20)),
                subtitle: const Text("Entradas adicionadas"),
                trailing: Text("\$${totalIncome.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 18)),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Color.fromARGB(255, 241, 73, 129),
              child: ListTile(
                title: const Text("Saídas", style: TextStyle(fontSize: 20)),
                subtitle: const Text("Saídas adicionadas"),
                trailing: Text("\$${totalExpenses.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 18)),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Colors.pink,
              child: ListTile(
                title: const Text(
                  "Total",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: const Text("Total da conta"),
                trailing: Text(
                    "\$${(totalIncome - totalExpenses).toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
          Image.asset(
            'assets/img/porquinho.png',
            width: 400,
            height: 360,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(
            255,
            255,
            255,
            255,
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return AddExpenseModal(
                onAddExpense: _addExpense,
                onAddIncome: _addIncome,
              );
            },
          );
        },
      ),
    );
  }
}
