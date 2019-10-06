import 'package:flutter/material.dart';
import 'package:todo_flutter/Models/todo.dart';
import 'package:todo_flutter/create_todo_dialog.dart';
import 'package:todo_flutter/todo_list.dart';

class TodoItemsScreen extends StatefulWidget {
	@override
	_TodoItemsScreenState createState() => _TodoItemsScreenState();
}

class _TodoItemsScreenState extends State<TodoItemsScreen> {
	List<Todo> todoItems = [];

	_toggleTodoStatus(Todo todo, bool isChecked){
		setState(() {
			todo.isCompleted = isChecked;
		});
	}

	_addTodo() async{
		final todo = await showDialog<Todo>(
			context: context,
			builder: (BuildContext context){
				return CreateTodoDialog();
			}
		);
		if (todo != null){
			setState(() {
			  todoItems.add(todo);
			});
		}
	}

  @override
  Widget build(BuildContext context) {
	  return Scaffold(
		  appBar: AppBar(
			  title: Text("TodoList")
		  ),
		  body: TodoList(
			  todoItems: todoItems,
			  onTodoItemsToggle: _toggleTodoStatus,
		  ),
		  floatingActionButton: FloatingActionButton(
			  onPressed: () {
					_addTodo();
			  },
		  ),
	  );
  }
}
