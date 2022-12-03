import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'adicionar_livro.dart';
import '../repositories/livro_repository.dart';
import '../widgets/custom_drawer.dart';

class ListaLivros extends StatelessWidget {
  static final routeName = '/lista_livros';

  const ListaLivros({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repositorio = Provider.of<LivroRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Livros"),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AdicionarLivro.routeName),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: ((context, index) {
          final livro = repositorio.livros[index];
          return Dismissible(
            key: ValueKey(livro.id),
            background: Container(
              color: Colors.red.shade300,
              child: Icon(Icons.delete),
              alignment: Alignment.centerRight,
            ),
            onDismissed: (direction) {
              repositorio.remover(livro);
            },
            child: Card(
              child: ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(livro.urlCapa),
                  ),
                  title: Text(livro.titulo)),
            ),
          );
        }),
        itemCount: repositorio.livros.length,
      ),
      drawer: CustomDrawer(),
    );
  }
}
