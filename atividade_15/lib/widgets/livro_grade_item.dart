import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/livro.dart';
import '../pages/detalhes_livro.dart';

class LivroGradeItem extends StatelessWidget {
  const LivroGradeItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final livro = Provider.of<Livro>(context);
    return GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetalhesLivro.routeName,
              arguments: {
                "id": livro.id,
              },
            );
          },
          child: Container(
            width: 200.0,
            height: 500.0,
            padding: EdgeInsets.all(4.0),
            child: Image.network(
              livro.urlCapa,
              fit: BoxFit.fill,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Color.fromRGBO(90, 90, 90, 1),
          title: Center(
            child: Text(livro.titulo),
          ),
        ));
  }
}
