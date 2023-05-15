import 'package:news_app/model/news_model.dart';
import 'package:news_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final Repository _repository;

  //STREAM CONTROLLERS
  final BehaviorSubject<List<NewsModel>> _topNewsHeadLinesOutputController;
  final BehaviorSubject<List<NewsModel>> _searchOutputController;

  static final HomeBloc _bloc = HomeBloc._constructor();
  factory HomeBloc() => _bloc;

  HomeBloc._constructor()
      : _repository = Repository(),
        _topNewsHeadLinesOutputController = BehaviorSubject<List<NewsModel>>(),
        _searchOutputController = BehaviorSubject<List<NewsModel>>();

  // Stream data
  Stream<List<NewsModel>> get topNewsHeadLines =>
      _topNewsHeadLinesOutputController.stream;
  Stream<List<NewsModel>> get searchNews => _searchOutputController.stream;

  // Add data to stream
  //TopHeadLinesNews
  Function() get fetchTopHeadLinesNews => _fetchTopHeadLinesNews;

  _addToTopNewsHeadLinesDetailsOutputStream(List<NewsModel> newsModel) {
    _topNewsHeadLinesOutputController.sink.add(newsModel);
  }

  _fetchTopHeadLinesNews() {
    _repository.getTopNewsHeadLines(_addToTopNewsHeadLinesDetailsOutputStream,
        _topNewsHeadLinesOutputController.sink.addError);
  }

  //Search News
  Function(String, String) get fetchSearchNews => _fetchSearchNews;

  _addToSearchOutputStream(List<NewsModel> newsModel) {
    _searchOutputController.sink.add(newsModel);
  }

  _fetchSearchNews(String query, String sort) {
    _repository.getSearchNews(query, sort, _addToSearchOutputStream,
        _searchOutputController.sink.addError);
  }
}
