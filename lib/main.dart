import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'prefs.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoList(),
    );
  }
}


class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
	List<String> todoItems = [];
	List<String> completedItems = [];

	void _init() async {
		await ControlSharedPrefs.setInstance();
		todoItems = ControlSharedPrefs.getTodoItems();
		completedItems = ControlSharedPrefs.getCompletedItems();
		setState(() {});
	}

	@override
	void initState() {
		_init();
		super.initState();
	}

	@override
	void dispose() {
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("TodoList")
			)
		);
	}
}
