import 'package:news_app/model/news_model.dart';
import 'package:news_app/resources/api_provider.dart';

class Repository {
  final ApiProvider _apiProvider;
  Repository() : _apiProvider = ApiProvider();

  void getTopNewsHeadLines(
    Function(List<NewsModel>) add,
    Function(Object) addError,
  ) {
    _apiProvider.getTopNewsHeadLines(add, addError);
  }
}
