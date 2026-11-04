// To parse this JSON data, do
//
//     final noticasResponse = noticasResponseFromJson(jsonString);

import 'dart:convert';

NoticasResponse noticasResponseFromJson(String str) => NoticasResponse.fromJson(json.decode(str));

String noticasResponseToJson(NoticasResponse data) => json.encode(data.toJson());

class NoticasResponse {
    final Information information;
    final int totalArticles;
    final List<Article> articles;

    NoticasResponse({
        required this.information,
        required this.totalArticles,
        required this.articles,
    });

    factory NoticasResponse.fromJson(Map<String, dynamic> json) => NoticasResponse(
        information: Information.fromJson(json["information"]),
        totalArticles: json["totalArticles"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "information": information.toJson(),
        "totalArticles": totalArticles,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    final String id;
    final String title;
    final String description;
    final String content;
    final String url;
    final String image;
    final DateTime publishedAt;
    final Lang lang;
    final Source source;

    Article({
        required this.id,
        required this.title,
        required this.description,
        required this.content,
        required this.url,
        required this.image,
        required this.publishedAt,
        required this.lang,
        required this.source,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        content: json["content"],
        url: json["url"],
        image: json["image"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        lang: langValues.map[json["lang"]]!,
        source: Source.fromJson(json["source"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "content": content,
        "url": url,
        "image": image,
        "publishedAt": publishedAt.toIso8601String(),
        "lang": langValues.reverse[lang],
        "source": source.toJson(),
    };
}

enum Lang {
    ES
}

final langValues = EnumValues({
    "es": Lang.ES
});

class Source {
    final String id;
    final String name;
    final String url;

    Source({
        required this.id,
        required this.name,
        required this.url,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
    };
}

class Information {
    final RealTimeArticles realTimeArticles;

    Information({
        required this.realTimeArticles,
    });

    factory Information.fromJson(Map<String, dynamic> json) => Information(
        realTimeArticles: RealTimeArticles.fromJson(json["realTimeArticles"]),
    );

    Map<String, dynamic> toJson() => {
        "realTimeArticles": realTimeArticles.toJson(),
    };
}

class RealTimeArticles {
    final String message;

    RealTimeArticles({
        required this.message,
    });

    factory RealTimeArticles.fromJson(Map<String, dynamic> json) => RealTimeArticles(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
