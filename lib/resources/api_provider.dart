import 'package:http/http.dart';

class ApiProvider {
  final Client _client;
  final String _root;
  final String _networkErrorMsg = 'Please check your internet connection';

  ApiProvider()
      : _client = Client(),
        _root = 'https://learn-dev.taxpod.my/api/v1';
  
  
}
