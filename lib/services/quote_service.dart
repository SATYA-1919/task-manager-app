import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote_model.dart';

class QuoteService {
  static const String _baseUrl = 'https://api.quotable.io/random';

  Future<QuoteModel?> fetchRandomQuote() async {
    try {
      final response = await http
          .get(Uri.parse(_baseUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return QuoteModel.fromJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
