import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_with_reminder/notification_service.dart';

import 'Todo.dart';
import 'mainscreen.dart';
import 'new_item_view.dart';
//import 'LocalNotificationScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
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
  late SharedPreferences sharedPreferences;
  Future<SharedPreferences>  _getSharedPreferences() async {
    if(sharedPreferences == null){
      sharedPreferences = await SharedPreferences.getInstance();
    }
    return sharedPreferences;
  }

  @override
  void initState() {
    initSharedpreferences();
    // TODO: implement initState
    super.initState();
  }

  initSharedpreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks on progress'),
        centerTitle: true,
        leading: IconButton(
        tooltip: 'Leading Icon',
        icon: const Icon(
        Icons.alarm,
       ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>MainScreen()),
          );
        },
       ),
      ),

      body: buidBody(),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => goToNewItemView()
      ),


    );
  }

  Widget buidBody() {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return buildItem(list[index]);
        }
    );
  }

  Widget buildItem(Todo item) {
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
        trailing: Checkbox(value: item.complete, onChanged: null),
        onTap: () => setCompleteness(item),
      ),
    );
  }

  void setCompleteness(Todo item) {
    setState(() {
      item.complete = !item.complete;
    });
  }

  void removeItem(Todo item) {
    list.remove(item);
    saveData();
  }

  void addTodo(Todo item) {
    list.add(item);
    saveData();
  }

  void goToNewItemView() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return NewItemView();
        })).then((title) {
      if (title != null) addTodo(Todo(title: title));
    });
  }

  void saveData() {
    List<String> spList = list.map((item) => json.encode(item.toMap()))
        .toList();
    sharedPreferences.setStringList('list', spList);
  }

  void loadData() {
      List<String> spList = sharedPreferences.getString('list') as List<String>;
      list = spList.map((item) => Todo.fromMap(json.decode(item))
      ).toList();
      setState(() {});
  }

}
