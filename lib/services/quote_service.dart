import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class QuoteService {
  // Swapped to a more reliable API
  static const String _url = 'https://dummyjson.com/quotes/random';

  Future<QuoteModel> fetchQuote() async {
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        return QuoteModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      return QuoteModel(content: "Keep pushing forward!", author: "System");
    }
  }
}
