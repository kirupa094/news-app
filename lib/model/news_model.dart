class NewsModel {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  NewsModel.fromParsedJason(Map<String, dynamic> result)
      : author = result['author'] ?? '',
        title = result['title'] ?? '',
        description = result['description'] ?? '',
        urlToImage = result['urlToImage'] ?? '',
        publishedAt = result['publishedAt'] == null
            ? DateTime.now()
            : DateTime.parse(result['publishedAt']).toLocal(),
        content = result['content'] ?? '';
}
