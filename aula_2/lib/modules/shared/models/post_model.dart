import 'dart:convert';

class PostModel {
  final String? imagePath;

  PostModel({
    this.imagePath,
  });

  PostModel copyWith({
    String? imagePath,
  }) {
    return PostModel(
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (imagePath != null) {
      result.addAll({'imagePath': imagePath});
    }

    return result;
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      imagePath: map['imagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() => 'PostModel(imagePath: $imagePath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel && other.imagePath == imagePath;
  }

  @override
  int get hashCode => imagePath.hashCode;
}
