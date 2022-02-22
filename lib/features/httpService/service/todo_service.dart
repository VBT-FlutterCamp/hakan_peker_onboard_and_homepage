import 'package:email_screen/features/httpService/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoService {
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TodoModel>> fetchPost() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return todoModelFromJson(response.body);
    } else {
      throw Exception("Not found");
    }
  }
}
