class QuoteModel {
  final String content;
  final String author;

  QuoteModel({required this.content, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      // We check for 'quote' (DummyJSON) or 'content' (Quotable) just to be safe
      content: json['quote'] ?? json['content'] ?? 'No quote found',
      author: json['author'] ?? 'Unknown',
    );
  }
}
