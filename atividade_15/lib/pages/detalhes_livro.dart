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
          child: Row(children: [
            Container(
                width: 300,
                height: 450,
                padding: EdgeInsets.fromLTRB(20, 40, 10, 0),
                child: Column(
                  children: [
                    Image.network(livro.urlCapa),
                  ],
                )),
            Container(
              padding: EdgeInsets.fromLTRB(10, 40, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    livro.titulo,
                    style: TextStyle(fontSize: 26),
                  ),
                  SizedBox(height: 100),
                  Row(
                    children: [
                      Icon(Icons.create_rounded),
                      Text(
                        livro.autor,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.collections_bookmark_rounded),
                      Text(
                        livro.edicao,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_rounded),
                      Text(
                        livro.dataLeitura,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.description),
                      Text(
                        livro.opiniao,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
