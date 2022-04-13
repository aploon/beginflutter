// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

List<Video> videoFromJson(String str) => List<Video>.from(json.decode(str).map((x) => Video.fromJson(x)));

String videoToJson(List<Video> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Video {
    Video({
        this.id,
        this.videoUrl,
        this.name,
        this.description,
        this.duration,
        this.createdBy,
        this.image,
        this.thumbnail,
        this.cropped,
        this.fileNameOriginal,
        this.popularity,
        this.categoryId,
        this.category,
        this.keywords,
    });

    String? id;
    String? videoUrl;
    String? name;
    String? description;
    String? duration;
    String? createdBy;
    String? image;
    String? thumbnail;
    String? cropped;
    String? fileNameOriginal;
    String? popularity;
    String? categoryId;
    String? category;
    String? keywords;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        videoUrl: json["video_url"],
        name: json["name"],
        description: json["description"],
        duration: json["duration"],
        createdBy: json["created_by"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        cropped: json["cropped"],
        fileNameOriginal: json["file_name_original"],
        popularity: json["popularity"],
        categoryId: json["category_id"],
        category: json["category"],
        keywords: json["keywords"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "video_url": videoUrl,
        "name": name,
        "description": description,
        "duration": duration,
        "created_by": createdBy,
        "image": image,
        "thumbnail": thumbnail,
        "cropped": cropped,
        "file_name_original": fileNameOriginal,
        "popularity": popularity,
        "category_id": categoryId,
        "category": category,
        "keywords": keywords,
    };
}
