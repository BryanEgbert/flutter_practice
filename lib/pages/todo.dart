import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  final List<String> todos;
  final List<bool?> todoCheckbox;

  const Todo({Key? key, required this.todos, required this.todoCheckbox})
      : super(key: key);

  @override
  TodoState createState() => TodoState();
}

class TodoState extends State<Todo> {
  List<String> todos = <String>[];
  List<bool?> todoCheckbox = <bool>[];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController todoController = TextEditingController();

  void _addTodo() {
    setState(() {
      todos.add(todoController.text);
      todoCheckbox.add(false);
      todoController.clear();
    });
  }

  void _changeCheckbox(int index, bool? value) {
    setState(() {
      todoCheckbox[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            "Todo List",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const Divider(),
        Center(
            child: Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  key: const Key("todo form"),
                  controller: todoController,
                  onFieldSubmitted: (value) => _addTodo(),
                  decoration: const InputDecoration(
                    hintText: "Enter todo",
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _addTodo();
                  },
                  child: const Text("Add Todo"))
            ],
          ),
        )),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                  title: Text(todos[index]),
                  enableFeedback: true,
                  // value: false,
                  onChanged: (bool? value) {
                    _changeCheckbox(index, value);
                  },
                  value: todoCheckbox[index],
                  key: Key("todo $index"));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}
