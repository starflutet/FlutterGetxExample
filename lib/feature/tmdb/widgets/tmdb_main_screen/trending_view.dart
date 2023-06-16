import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/trending/api_trending_controller.dart';
import '../../models/trending_model.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Obx(
      () {
        final results =
            ApiTmdbTrendingController.getInstance().tmdb.value.results;

        if (results == null) {
          // 로딩 상태 또는 오류 처리를 원하는 방식으로 UI를 반환합니다.
          return CircularProgressIndicator();
        }

        return Scrollbar(
          controller: scrollController,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: results.length,
            itemBuilder: (context, index) {
              final Results movie = results[index];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/original/${movie.posterPath}'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    width: 180,
                    height: 250,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      textAlign: TextAlign.center,
                      '${movie.title}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    '${movie.releaseDate}',
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
