import 'dart:convert';
import 'package:http/http.dart' as http;

class FirebaseData {
  Future<void> changeDataInFirebase() async {
    final apiUrl = Uri.parse('https://frontassignment.hyperhire.in/change');

    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'key1': 'value1',
          'key2': 'value2',
        }),
      );

      if (response.statusCode == 200) {
        print('Data modified successfully.');
      } else {
        print('Failed to modify data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Handle network errors.
      print('Network error: $error');
    }
  }
}
