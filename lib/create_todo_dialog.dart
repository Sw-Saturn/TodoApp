import 'package:flutter/material.dart';
import 'package:todo_flutter/Models/todo.dart';

class CreateTodoDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CreateTodoDialogState();
  }
}

class _CreateTodoDialogState extends State<CreateTodoDialog> {
	final controller = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return AlertDialog(
			title: Text('New todo'),
			content: TextField(
				decoration: InputDecoration(
					hintText: "新規タスク",
				),
				style: TextStyle(locale: Locale("ja", "JP")),
				controller: controller,
				autofocus: true,
				enabled: true,
				maxLength: 20,
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
						controller.clearComposing();
						controller.clear();
						Navigator.of(context).pop(todo);
					},
				),
			],
		);
	}
}
