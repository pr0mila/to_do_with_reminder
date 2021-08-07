import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo>list = <Todo>[];
  @override
  void initState() {
    list.add(Todo(title: 'Item A'));
    list.add(Todo(title: 'Item B'));
    list.add(Todo(title: 'Item C'));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('My Tasks on progress'),
       centerTitle: true,
     ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(list[index].title),
              trailing: Checkbox(value:list[index].complete, onChanged:null),
              onTap: ()=>setCompleteness(list[index]),
            );
          }
      ),

    );
  }
  void setCompleteness(Todo item){
    setState(() {
      item.complete =! item.complete;
    });

  }
}


class Todo {
  String title;
  bool complete;
  Todo({required this.title,
  this.complete =  false});
}
