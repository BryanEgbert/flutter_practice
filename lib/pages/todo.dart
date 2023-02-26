import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  int todoCount = 0;
  List<String> todos = <String>[];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController todoController = TextEditingController();

  void _addTodo() {
    setState(() {
      todoCount++;
      todos.add(todoController.text);
      todoController.clear();
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
            itemCount: todoCount,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index]),
                leading: Text((index + 1).toString()),
              );
            }, separatorBuilder: (BuildContext context, int index) { 
              return const Divider();
             },
          ),
        ),
      ],
    );
  }
}
