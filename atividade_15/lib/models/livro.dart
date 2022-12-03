import 'package:flutter/material.dart';

class Livro with ChangeNotifier {
  final String id;
  final String titulo;
  final String autor;
  final String edicao;
  final String dataLeitura;
  final String urlCapa;
  final String opiniao;

  Livro({
    required this.id,
    required this.dataLeitura,
    required this.titulo,
    required this.autor,
    required this.edicao,
    required this.urlCapa,
    required this.opiniao,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dataLeitura': dataLeitura,
      'titulo': titulo,
      'autor': autor,
      'edicao': edicao,
      'urlCapa': urlCapa,
      'opiniao': opiniao
    };
  }

  factory Livro.fromJson(Map<String, dynamic> data) => Livro(
      id: data['id'],
      titulo: data['titulo'],
      autor: data['autor'],
      edicao: data['edicao'],
      dataLeitura: data['dataLeitura'],
      urlCapa: data['urlCapa'],
      opiniao: data['opiniao']);

  Livro copyWith(
      {String? id,
      String? titulo,
      String? autor,
      String? urlCapa,
      String? edicao,
      String? dataLeitura,
      String? opiniao}) {
    return Livro(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        autor: autor ?? this.autor,
        urlCapa: urlCapa ?? this.urlCapa,
        edicao: edicao ?? this.edicao,
        dataLeitura: dataLeitura ?? this.dataLeitura,
        opiniao: opiniao ?? this.opiniao);
  }
}
