import 'package:http/http.dart' show Client;
import 'dart:convert';


final root = "https://hacker-news.firebaseio.com/v0";
class NewsApiProvider {
  Client client = Client();


  fetchTopIds() async {
    final response = await client.get(
        "$root/topstories.json");
    final ids = json.decode(response.body);
    return ids;
  }

  fetchItems(int id) async {
    final response = await client.get(
        "$root/item/$id.json");


  }
}