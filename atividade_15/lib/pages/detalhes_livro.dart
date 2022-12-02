import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/livro.dart';
import '../repositories/livro_repository.dart';

class DetalhesLivro extends StatelessWidget {
  static final routeName = "/detalhes_livro";

  const DetalhesLivro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repositorio = Provider.of<LivroRepository>(context);

    final parameters =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final id = parameters['id'];

    final livro = repositorio.livros.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do livro")),
      body: Container(
        child: Column(
          children: [
            Image.network(livro.urlImagem),
            Text(livro.titulo),
            Text("R\$ ${livro.valor}"),
          ],
        ),
      ),
    );
  }
}
