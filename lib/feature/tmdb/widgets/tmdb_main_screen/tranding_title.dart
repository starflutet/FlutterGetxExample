import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controllers/trending/api_trending_controller.dart';

class TrandingTitle extends StatelessWidget {
  const TrandingTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final tmdbController = Get.find<ApiTmdbController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(
            '트렌딩',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            width: 90,
            decoration: BoxDecoration(
              color: Color(0xFF032541),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                ApiTmdbTrendingController.getInstance()
                    .fetchTmdb('trendingToday');
              },
              child: Text(
                '오늘',
                style: TextStyle(
                  color: Color(0xFF35dbae),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: TextButton(
            onPressed: () {
              ApiTmdbTrendingController.getInstance().fetchTmdb('trendingWeek');
            },
            child: Text(
              '이번주',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
