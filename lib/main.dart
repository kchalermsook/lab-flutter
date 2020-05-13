import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class NewTransaction extends StatelessWidget {
  final Function addTransaction;

  var titleController = TextEditingController();
  var amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
          FlatButton(
            child: Text('Submit'),
            textColor: Colors.purple,
            color: Colors.red,
            onPressed: () {
              print('Click Button');
              print(titleController.text);
              print(amountController.text);
              /* 

                */
              if(titleController.text.length == 0 || amountController.text.length == 0){
                showAlertDialog(context, "Error", "Please input title and amount!!");
              }else{
                addTransaction(titleController.text,amountController.text);
              }
            },
          )
        ]);
  }

  showAlertDialog(BuildContext context, String title, String text) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class UserTransactions extends StatefulWidget {
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1',
        title: 'Pay for Krapao Kai',
        amount: 200,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Buy the new notebook',
        amount: 20000,
        date: DateTime.now()),
    
  ];

  void addTransaction(String title, String amount ){
    setState(() {
      _transactions.add(Transaction(
        id: 't-new', title: title, amount: double.parse(amount), date: DateTime.now()));  
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(addTransaction),..._transactions.map((tx) {
        return _buildCard(tx);
      }).toList()],
    );
  }

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
                title: Text(new DateFormat('dd/MM/yyyy')
                    .format(tx.date)), // วัน/เดือน/ปี
                leading: Icon(
                  Icons.today,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: UserTransactions(),
      ),
    );
  }
}
