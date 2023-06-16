import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../settings/Constant/content.dart';
import '../../models/trending_model.dart';

class ApiTmdbTrendingController extends GetxController {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String tranding = 'trending/movie/';
  static const String today = 'day?api_key=';
  static const String detailMovie = 'movie/';
  static const String week = 'week?api_key=';
  static const String apiKey = Content.apiKey;

  static ApiTmdbTrendingController getInstance() {
    return Get.find<ApiTmdbTrendingController>();
  }
  
  final tmdb = TrendingModel().obs;

  @override
  void onInit() {
    fetchTmdb('trendingToday');
    super.onInit();
  }

  Future<TrendingModel> fetchTmdb(String param) async {
    var url = Uri.parse("");
    switch (param) {
      case 'trendingToday':
        url = Uri.parse("$baseUrl$tranding$today$apiKey");
        break;
      case 'trendingWeek':
        url = Uri.parse("$baseUrl$tranding$week$apiKey");
        break;
      default:
        url = Uri.parse("");
    }

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic movies = jsonDecode(response.body);
      tmdb.value = TrendingModel.fromJson(movies);
      return tmdb.value;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
