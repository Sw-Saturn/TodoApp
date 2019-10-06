import 'package:flutter/material.dart';
import 'package:todo_flutter/Models/todo.dart';

typedef ToggleTodoCallback = void Function(Todo, bool);

class TodoList extends StatelessWidget{
	TodoList({@required this.todoItems,this.onTodoItemsToggle});

	final List<Todo> todoItems;
	final ToggleTodoCallback onTodoItemsToggle;

	Widget _buildItems(BuildContext context, int index) {
		final todo = todoItems[index];
		return CheckboxListTile(
			onChanged: (bool isChecked) {
				onTodoItemsToggle(todo, isChecked);
			},
			value: todo.isCompleted,
			title: Text(todo.title),
		);
	}

	@override
	Widget build(BuildContext context) {
    return ListView.builder(
	    itemBuilder: _buildItems,
	    itemCount: todoItems.length,
    );
  }
}
