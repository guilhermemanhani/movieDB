import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb/models/movie_model.dart';

class MovieBanner extends StatelessWidget {
  final List<MovieModel> movieModel;

  const MovieBanner({
    Key? key,
    required this.movieModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return ListView.builder(
          itemCount: movieModel.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Container(
                height: 450,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${movieModel[index].posterPath}',
                        fit: BoxFit.fill,
                        width: Get.width,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 26,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: Get.width * 0.5,
                            ),
                            child: Text(
                              movieModel[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            movieModel[index].genres.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// 