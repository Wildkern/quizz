import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quiz_model.dart';

class ApiService {
  final String _baseUrl = 'https://api.jsonserve.com/Uw5CrX';

  Future<QuizModel> fetchQuizData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return QuizModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch quiz data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching quiz data: $e');
    }
  }
}
