import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:moviedb/models/cast_model.dart';
import 'package:moviedb/models/genre_model.dart';

class MovieDetailModel {
  final String backdropPath;
  final double voteAverage;
  final String title;
  final String originalTitle;
  final DateTime releaseDate;
  final int runtime;
  final List<GenreModel> genres;
  final String overview;
  final int budget;
  final List<String> productionCompanies;
  final List<CastModel> cast;
  final List<CastModel> crew;

  MovieDetailModel({
    required this.backdropPath,
    required this.voteAverage,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
    required this.overview,
    required this.budget,
    required this.productionCompanies,
    required this.cast,
    required this.crew,
  });

  MovieDetailModel copyWith({
    String? backdropPath,
    double? voteAverage,
    String? title,
    String? originalTitle,
    DateTime? releaseDate,
    int? runtime,
    List<GenreModel>? genres,
    String? overview,
    int? budget,
    List<String>? productionCompanies,
    List<CastModel>? cast,
    List<CastModel>? crew,
  }) {
    return MovieDetailModel(
      backdropPath: backdropPath ?? this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      releaseDate: releaseDate ?? this.releaseDate,
      runtime: runtime ?? this.runtime,
      genres: genres ?? this.genres,
      overview: overview ?? this.overview,
      budget: budget ?? this.budget,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      cast: cast ?? this.cast,
      crew: crew ?? this.crew,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
      'title': title,
      'original_title': originalTitle,
      'release_date': releaseDate,
      'runtime': runtime,
      'genres': genres.map((x) => x.toMap()).toList(),
      'overview': overview,
      'budget': budget,
      'production_companies': productionCompanies,
      'cast': cast.map((x) => x.toMap()).toList(),
      'crew': crew.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      backdropPath: 'https://image.tmdb.org/t/p/w500/${map['backdrop_path']}',
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      title: map['title'] ?? '',
      originalTitle: map['original_title'] ?? '',
      releaseDate: DateTime.parse(map['release_date'] ?? ''),
      runtime: map['runtime']?.toInt() ?? 0,
      genres: List<GenreModel>.from(
          map['genres']?.map((x) => GenreModel.fromMap(x))),
      overview: map['overview'] ?? '',
      budget: map['budget']?.toInt() ?? 0,
      productionCompanies: List<dynamic>.from(map['production_companies'])
          .map<String>((e) => e['name'])
          .toList(),
      cast: List<CastModel>.from(
          map['credits']['cast']?.map((x) => CastModel.fromMap(x))),
      crew: List<CastModel>.from(
          map['credits']['crew']?.map((x) => CastModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieDetailModel(backdropPath: $backdropPath, voteAverage: $voteAverage, title: $title, originalTitle: $originalTitle, releaseDate: $releaseDate, runtime: $runtime, genres: $genres, overview: $overview, budget: $budget, productionCompanies: $productionCompanies, cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetailModel &&
        other.backdropPath == backdropPath &&
        other.voteAverage == voteAverage &&
        other.title == title &&
        other.originalTitle == originalTitle &&
        other.releaseDate == releaseDate &&
        other.runtime == runtime &&
        listEquals(other.genres, genres) &&
        other.overview == overview &&
        other.budget == budget &&
        listEquals(other.productionCompanies, productionCompanies) &&
        listEquals(other.cast, cast) &&
        listEquals(other.crew, crew);
  }

  @override
  int get hashCode {
    return backdropPath.hashCode ^
        voteAverage.hashCode ^
        title.hashCode ^
        originalTitle.hashCode ^
        releaseDate.hashCode ^
        runtime.hashCode ^
        genres.hashCode ^
        overview.hashCode ^
        budget.hashCode ^
        productionCompanies.hashCode ^
        cast.hashCode ^
        crew.hashCode;
  }
}
