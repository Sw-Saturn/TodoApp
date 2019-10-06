import 'package:flutter/material.dart';
import 'package:todo_flutter/Models/todo.dart';
import 'package:todo_flutter/create_todo_dialog.dart';

class TodoItems extends StatefulWidget {
	@override
	_TodoItemsState createState() => _TodoItemsState();
}

class _TodoItemsState extends State<TodoItems> {
	List<Todo> todoItems = [];
	TextEditingController controller = TextEditingController();

	_toggleTodoStatus(Todo todo, bool isChecked){
		setState(() {
		  todo.isCompleted = isChecked;
		});
	}

	Widget _buildItems(BuildContext context, int index) {
		final todo = todoItems[index];
		return CheckboxListTile(
			onChanged: (bool isChecked) {
				_toggleTodoStatus(todo, isChecked);
			},
			value: todo.isCompleted,
			title: Text(todo.title),
		);
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
		  body: ListView.builder(
			  itemBuilder: _buildItems,
			  itemCount: todoItems.length,
		  ),
		  floatingActionButton: FloatingActionButton(
			  onPressed: () {
					_addTodo();
			  },
		  ),
	  );
  }
}
