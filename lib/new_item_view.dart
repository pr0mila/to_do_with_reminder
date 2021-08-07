import 'package:flutter/material.dart';

class NewItemView extends StatefulWidget {

  @override
  _NewItemViewState createState() => _NewItemViewState();
}

class _NewItemViewState extends State<NewItemView> {
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
              TextField(),
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
    print('Save');
  }
}
