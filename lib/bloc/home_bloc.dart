import 'package:news_app/model/news_model.dart';
import 'package:news_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final Repository _repository;

  //STREAM CONTROLLERS
  final BehaviorSubject<List<NewsModel>> _topNewsHeadLinesOutputController;

  static final HomeBloc _bloc = HomeBloc._constructor();
  factory HomeBloc() => _bloc;

  HomeBloc._constructor()
      : _repository = Repository(),
        _topNewsHeadLinesOutputController = BehaviorSubject<List<NewsModel>>();

  // Stream data
  Stream<List<NewsModel>> get topNewsHeadLines =>
      _topNewsHeadLinesOutputController.stream;

  // Add data to stream
  //Category Course Details
  Function() get fetchTopHeadLinesNews =>
      _fetchTopHeadLinesNews;

  _addToTopNewsHeadLinesDetailsOutputStream(List<NewsModel> newsModel) {
    _topNewsHeadLinesOutputController.sink.add(newsModel);
  }

  _fetchTopHeadLinesNews() {
    _repository.getTopNewsHeadLines(_addToTopNewsHeadLinesDetailsOutputStream,
        _topNewsHeadLinesOutputController.sink.addError);
  }
}
