import 'package:flutter/material.dart';

import 'new_item_view.dart';

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
      body: buidBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => goToNewItemView()
      ),

    );
  }

  Widget buidBody(){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index){
             return buildItem(list[index]);


      }
      );
  }
  
  Widget buildItem(Todo item)
  {
    return Dismissible(
     key: Key(item.hashCode.toString()),
     onDismissed: (direction) => removeItem(item),
     direction: DismissDirection.startToEnd,
     background: Container(
       color: Colors.red[600],
       child: Icon(Icons.delete, color: Colors.white,),
       alignment: Alignment.centerLeft,
       padding: EdgeInsets.only(left: 12.0),
     ),
      child: ListTile(
        title: Text(item.title),
        trailing: Checkbox(value:item.complete, onChanged:null),
        onTap: ()=>setCompleteness(item),
      ),
    );
  }

  void setCompleteness(Todo item){
    setState(() {
      item.complete =! item.complete;
    });

  }

  void removeItem(Todo item) {
    list.remove(item);

  }
  void addTodo(Todo item) {
    list.add(item);

  }

  void goToNewItemView() {
    Navigator.of(context).push(MaterialPageRoute(
        builder:(context){
          return NewItemView();
        })).then((title) {
          if(title!=null)addTodo(Todo(title: title));
        });
    }
  }


class Todo {
  String title;
  bool complete;
  Todo({required this.title,
  this.complete =  false});
}
