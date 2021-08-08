import 'package:flutter/material.dart';

class NewItemView extends StatefulWidget {


  @override
  _NewItemViewState createState() => _NewItemViewState();
}

class _NewItemViewState extends State<NewItemView> {
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: textFieldController,
              ),
              TextButton(
                onPressed: save,
                child: Text('Save',
                    style: TextStyle(color: Theme.of(context).accentColor )
                ),

              )

            ],
          ),
      ),
    );
  }

  void save() {
    if(textFieldController.text.isNotEmpty)
      Navigator.of(context).pop(textFieldController.text);
  }
}
