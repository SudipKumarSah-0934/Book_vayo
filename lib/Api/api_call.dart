
import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchData() async {
  final response = await http.get(Uri.parse("https://bookvayo.herokuapp.com/api/mobilehome?fbclid=IwAR1eZuQb34-PctLbMJZ0_U-fueXIYSIP3SOjatdY6NpAuo4zd1WDajC6Rak"));
  final data = await json.decode(response.body);

  if (response.statusCode == 200) {
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}