import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Pay for Krapao Kai', amount: 200, date: DateTime.now()),
    Transaction(id: 't2', title: 'Buy the new notebook', amount: 20000, date: DateTime.now()),
  ];
  
  Widget _buildCard(Transaction tx) => SizedBox(
    height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text(tx.title,
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(tx.id),
            leading: Icon(
              Icons.insert_emoticon,
              color: Colors.blue[500],
            ),
          ),
          Divider(),
          ListTile(
            title: Text(tx.amount.toString(),
                style: TextStyle(fontWeight: FontWeight.w500)),
            leading: Icon(
              Icons.attach_money,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: Text(tx.date.toString()),
            leading: Icon(
              Icons.today,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: transactions.map((tx){
          return _buildCard(tx);
        }).toList()
      ),
    );
  }
}
