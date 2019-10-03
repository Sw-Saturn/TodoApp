import 'package:shared_preferences/shared_preferences.dart';

class ControlSharedPrefs {
	static final todoItems = "todos";
	static final completedItems = "completed_toods";
	static SharedPreferences _sharedPreferences;

	static Future setInstance() async{
		if(_sharedPreferences != null){
			return;
		}
		_sharedPreferences = await SharedPreferences.getInstance();
	}

	static Future<bool> setTodoItems(List<String> value) =>
		_sharedPreferences.setStringList(todoItems, value);

	static List<String> getTodoItems() =>
		_sharedPreferences.getStringList(todoItems) ?? [];

	static Future<bool> setCompletedItems(List<String> value) =>
		_sharedPreferences.setStringList(completedItems, value);

	static List<String> getCompletedItems() =>
		_sharedPreferences.getStringList(completedItems) ?? [];
}
