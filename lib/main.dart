import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'todo_list_screen.dart';

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
	@override
	void initState() {
		super.initState();
	}

	@override
	void dispose() {
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: TodoItemsScreen(),
			localizationsDelegates: [
				GlobalMaterialLocalizations.delegate,
				GlobalWidgetsLocalizations.delegate,
			],
			supportedLocales: [
				Locale('ja', ''),
			],
		);
	}
}
