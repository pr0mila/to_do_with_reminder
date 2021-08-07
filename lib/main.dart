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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}
class HomeState extends State<Home> {
  List<Todo>list = <Todo>[];

  @override
  void initState() {
    // TODO: implement initState
    list.add(Todo(title: 'Item A'));
    list.add(Todo(title: 'Item B'));
    list.add(Todo(title: 'Item C'));
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks in progress'),
      ),
      body: ListView.builder(
       itemCount: list.length,
        itemBuilder: (context,index){
         return ListTile(
           title: Text(list[index].title),
           trailing: Icon(Icons.check_box),
           onTap: ()=>print(list[index].title),
         );
        }
      ),
    );
  }
}
class Todo{
  String title;
  bool complete;
  Todo ({required this.title,
    this.complete = false});
}
