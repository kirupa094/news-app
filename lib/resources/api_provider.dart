import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

class ApiProvider {
  final Client _client;
  final String _root;
  final String _networkErrorMsg = 'Please check your internet connection';
  final String apiKey = 'cdadbeca26224aae9a57019c98328bc2';

  ApiProvider()
      : _client = Client(),
        _root = 'https://newsapi.org/v2';

  getTopNewsHeadLines(
      Function(List<NewsModel>) add, Function(Object) addError) async {
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
      };

      final response = await _client.get(
        Uri.parse('$_root/top-headlines?country=us&apiKey=$apiKey'),
        headers: headers,
      );

      final result = json.decode(response.body);
      if (response.statusCode == 200) {
        List<NewsModel> lst = [];

        var items = (result['articles']);
        if (items != null) {
          for (var item in items) {
            lst.add(NewsModel.fromParsedJason(item));
          }
        }
        add(lst);
      } else {
        addError(result['message']);
      }
    } on SocketException {
      addError(_networkErrorMsg);
    } catch (e) {
      addError(e.toString());
    }
  }

  getSearchNews(String query, String sort, Function(List<NewsModel>) add,
      Function(Object) addError) async {
    add([]);
    print(query);
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
      };

      final response = await _client.get(
        Uri.parse('$_root/everything?q=$sort&sortBy=$sort&apiKey=$apiKey'),
        headers: headers,
      );

      final result = json.decode(response.body);
      if (response.statusCode == 200) {
        List<NewsModel> lst = [];

        var items = (result['articles']);
        if (items != null) {
          for (var item in items) {
            lst.add(NewsModel.fromParsedJason(item));
          }
        }
        add(lst);
      } else {
        addError(result['message']);
      }
    } on SocketException {
      addError(_networkErrorMsg);
    } catch (e) {
      addError(e.toString());
    }
  }
}
