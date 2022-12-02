import 'package:flutter/material.dart';

class Livro with ChangeNotifier {
  final String id;
  final String titulo;
  final String descricao;
  final String urlImagem;
  final double valor;

  Livro({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.valor,
    required this.urlImagem,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'urlImagem': urlImagem,
      'valor': valor,
    };
  }

  factory Livro.fromJson(Map<String, dynamic> data) => Livro(
        id: data['id'],
        titulo: data['titulo'],
        descricao: data['descricao'],
        urlImagem: data['urlImagem'],
        valor: data['valor'],
      );

  Livro copyWith(
      {String? id,
      String? titulo,
      String? descricao,
      String? urlImagem,
      double? valor}) {
    return Livro(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      urlImagem: urlImagem ?? this.urlImagem,
      valor: valor ?? this.valor,
    );
  }
}
