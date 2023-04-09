import 'dart:math';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _textEditingController = TextEditingController();
  int? _enteredValue;
  bool _isValidInput = true;

  void _convertValue() {
    setState(() {
      if (int.tryParse(_textEditingController.text) == null) {
        _isValidInput = false;
        _enteredValue = null;
      } else {
        _isValidInput = true;
        _enteredValue = int.parse(_textEditingController.text);
      }
    });

    if (_isValidInput) {
      if (sqrt(_enteredValue!).floor() == sqrt(_enteredValue!).ceil() &&
          pow(_enteredValue!, 1 / 3).floor() ==
              pow(_enteredValue!, 1 / 3).ceil()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Result'),
              content: Text(
                  'Number $_enteredValue is both a square and a cube number.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (sqrt(_enteredValue!).floor() == sqrt(_enteredValue!).ceil()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Result'),
              content: Text('Number $_enteredValue is a square number.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (pow(_enteredValue!, 1 / 3).floor() ==
          pow(_enteredValue!, 1 / 3).ceil()) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Result'),
              content: Text('Number $_enteredValue is a cube number.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Result'),
              content: Text(
                  'Number $_enteredValue is neither a square nor a cube number.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Number Shapes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Please input a number to see if it is square or cube:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorText: _isValidInput ? null : 'Please enter a valid number',
                errorBorder: _isValidInput
                    ? OutlineInputBorder()
                    : OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _convertValue,
        child: Icon(Icons.done),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
