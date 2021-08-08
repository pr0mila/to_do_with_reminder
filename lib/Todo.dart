class Todo {
  String title;
  bool complete;

  Todo({
    required this.title,
    this.complete = false,
  });

  Todo.fromMap(Map map) :
        this.title = map['title'],
        this.complete = map['complete'];

  Map toMap(){
    return {
      'title': this.title,
      'completed': this.complete,
    };
  }
}