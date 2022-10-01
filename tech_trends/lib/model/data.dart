import 'dart:convert';

import 'package:collection/collection.dart';

class NewsHeadlines {
  String status;
  int? totalResults;
  List<Articles>? articles;
  NewsHeadlines({
    required this.status,
    this.totalResults,
    this.articles,
  });

  NewsHeadlines copyWith({
    String? status,
    int? totalResults,
    List<Articles>? articles,
  }) {
    return NewsHeadlines(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    if (totalResults != null) {
      result.addAll({'totalResults': totalResults});
    }
    if (articles != null) {
      result.addAll({'articles': articles!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory NewsHeadlines.fromMap(Map<String, dynamic> map) {
    return NewsHeadlines(
      status: map['status'] ?? '',
      totalResults: map['totalResults']?.toInt(),
      articles: map['articles'] != null
          ? List<Articles>.from(
              map['articles']?.map((x) => Articles.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsHeadlines.fromJson(String source) =>
      NewsHeadlines.fromMap(json.decode(source));

  @override
  String toString() =>
      'TechCrunch(status: $status, totalResults: $totalResults, articles: $articles)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is NewsHeadlines &&
        other.status == status &&
        other.totalResults == totalResults &&
        listEquals(other.articles, articles);
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    return Articles(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (source != null) {
      result.addAll({'source': source!.toMap()});
    }
    if (author != null) {
      result.addAll({'author': author});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (url != null) {
      result.addAll({'url': url});
    }
    if (urlToImage != null) {
      result.addAll({'urlToImage': urlToImage});
    }
    if (publishedAt != null) {
      result.addAll({'publishedAt': publishedAt});
    }
    if (content != null) {
      result.addAll({'content': content});
    }

    return result;
  }

  factory Articles.fromMap(Map<String, dynamic> map) {
    return Articles(
      source: map['source'] != null ? Source.fromMap(map['source']) : null,
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Articles.fromJson(String source) =>
      Articles.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Articles(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Articles &&
        other.source == source &&
        other.author == author &&
        other.title == title &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt &&
        other.content == content;
  }

  @override
  int get hashCode {
    return source.hashCode ^
        author.hashCode ^
        title.hashCode ^
        description.hashCode ^
        url.hashCode ^
        urlToImage.hashCode ^
        publishedAt.hashCode ^
        content.hashCode;
  }
}

class Source {
  String? id;
  String? name;
  Source({
    this.id,
    this.name,
  });

  Source copyWith({
    String? id,
    String? name,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source));

  @override
  String toString() => 'Source(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Source && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
