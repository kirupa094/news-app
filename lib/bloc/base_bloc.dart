import 'package:news_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitData {
  final String token;
  InitData({
    this.token = "",
  });
}

class BaseBloc {
  late String _userToken = "";
  final Repository _repository;

  //STREAM CONTROLLERS
  final BehaviorSubject<InitData> _initDataConfig;

  static final BaseBloc _bloc = BaseBloc._constructor();
  factory BaseBloc() => _bloc;

  BaseBloc._constructor()
      : _repository = Repository(),
        _initDataConfig = BehaviorSubject<InitData>();

  //User Token
  String getSavedUserToken() {
    return _userToken;
  }

  setToken(String token) {
    _userToken = token;
  }

  getInitData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _initDataConfig.sink.add(InitData(
      token: prefs.getString('token') ?? "",
    ));

    String? token = prefs.getString('token');
    _userToken = token ?? '';
  }

  // Stream data
  Stream<InitData> get initDataConfig => _initDataConfig.stream;

  // Add data to stream
  //INIT DATA
  Function(InitData) get changeInitDataConfig => _initDataConfig.sink.add;
}
