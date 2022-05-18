import 'dart:convert';

import 'package:aula_2/modules/shared/models/post_model.dart';
import 'package:collection/collection.dart';

class UsuarioModel {
  final String? nome;
  final String? descricao;
  final String? imagePath;
  final List<PostModel>? posts;
  final List<UsuarioModel>? seguidores;
  final List<UsuarioModel>? seguindo;

  UsuarioModel({
    this.nome,
    this.descricao,
    this.imagePath,
    this.posts,
    this.seguidores,
    this.seguindo,
  });

  UsuarioModel copyWith({
    String? nome,
    String? descricao,
    String? imagePath,
    List<PostModel>? posts,
    List<UsuarioModel>? seguidores,
    List<UsuarioModel>? seguindo,
  }) {
    return UsuarioModel(
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      imagePath: imagePath ?? this.imagePath,
      posts: posts ?? this.posts,
      seguidores: seguidores ?? this.seguidores,
      seguindo: seguindo ?? this.seguindo,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (nome != null) {
      result.addAll({'nome': nome});
    }
    if (descricao != null) {
      result.addAll({'descricao': descricao});
    }
    if (imagePath != null) {
      result.addAll({'imagePath': imagePath});
    }
    if (posts != null) {
      result.addAll({'posts': posts!.map((x) => x.toMap()).toList()});
    }
    if (seguidores != null) {
      result.addAll({'seguidores': seguidores!.map((x) => x.toMap()).toList()});
    }
    if (seguindo != null) {
      result.addAll({'seguindo': seguindo!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      nome: map['nome'],
      descricao: map['descricao'],
      imagePath: map['imagePath'],
      posts: map['posts'] != null
          ? List<PostModel>.from(map['posts']?.map((x) => PostModel.fromMap(x)))
          : null,
      seguidores: map['seguidores'] != null
          ? List<UsuarioModel>.from(
              map['seguidores']?.map((x) => UsuarioModel.fromMap(x)))
          : null,
      seguindo: map['seguindo'] != null
          ? List<UsuarioModel>.from(
              map['seguindo']?.map((x) => UsuarioModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UsuarioModel(nome: $nome, descricao: $descricao, imagePath: $imagePath, posts: $posts, seguidores: $seguidores, seguindo: $seguindo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UsuarioModel &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.imagePath == imagePath &&
        listEquals(other.posts, posts) &&
        listEquals(other.seguidores, seguidores) &&
        listEquals(other.seguindo, seguindo);
  }

  @override
  int get hashCode {
    return nome.hashCode ^
        descricao.hashCode ^
        imagePath.hashCode ^
        posts.hashCode ^
        seguidores.hashCode ^
        seguindo.hashCode;
  }
}
