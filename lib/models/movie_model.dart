import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModel {
  final int id;
  final String title;
  final List<int> genres;
  final String posterPath;
  MovieModel({
    required this.id,
    required this.title,
    required this.genres,
    required this.posterPath,
  });

  MovieModel copyWith({
    int? id,
    String? title,
    List<int>? genres,
    String? posterPath,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      genres: genres ?? this.genres,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'genre_ids': genres,
      'poster_path': posterPath,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      genres: List<int>.from(map['genre_ids']),
      posterPath: map['poster_path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, genres: $genres, posterPath: $posterPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.id == id &&
        other.title == title &&
        listEquals(other.genres, genres) &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ genres.hashCode ^ posterPath.hashCode;
  }
}
