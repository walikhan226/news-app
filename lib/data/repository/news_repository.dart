import 'package:http/http.dart' as http;
import 'package:new_app/data/model/news_model.dart';

class NewsRepository {
Future<List<News>>  getnews() async {
    http.Response response = await http.get(
      "https://breaking-news2.p.rapidapi.com/wp-json/wp/v2/posts",
      headers: {
        'x-rapidapi-host': "breaking-news2.p.rapidapi.com",
        'x-rapidapi-key': "080407ae86mshe535835db93fc0dp156e0djsnd64a337a247e"
      },
    );

    if (response.statusCode == 200) {
      List<News> news = newsFromJson(response.body);

      return news;
    } else {
      throw Exception();
    }
  }
}
