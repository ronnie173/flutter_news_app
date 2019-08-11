import 'package:news_flutter_app/src/models/item_model.dart';
import 'package:news_flutter_app/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('Fetch top ids returns a list of ids', () async {
    //setup of test case
    final newsAPI = NewsApiProvider();
    newsAPI.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    //expectation
    final ids = await newsAPI.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('fetch item returns a item model', () async{
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItems(999);
    expect(item.id, 123);
  });
}
