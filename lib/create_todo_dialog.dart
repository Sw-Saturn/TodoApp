import 'package:flutter/material.dart';
import 'package:todo_flutter/Models/todo.dart';

class CreateTodoDialog extends StatelessWidget {
	final controller = new TextEditingController();

	@override
	Widget build(BuildContext context) {
		return AlertDialog(
			title: Text('New todo'),
			content: TextField(
				controller: controller,
				autofocus: true,
			),
			actions: <Widget>[
				FlatButton(
					child: Text('Cancel'),
					onPressed: () {
						Navigator.of(context).pop();
					},
				),
				FlatButton(
					child: Text('Add'),
					onPressed: () {
						final todo = Todo(title: controller.value.text);
						controller.clear();

						Navigator.of(context).pop(todo);
					},
				),
			],
		);
	}
}
