import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home.dart';
import '../pages/lista_livros.dart';
import '../services/autenticacao_servico.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _servicoAutenticacao =
        Provider.of<ServicoAutenticacao>(context, listen: false);

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Menu"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(Home.routeName),
            leading: Icon(Icons.bookmark),
            title: Text('Livros'),
          ),
          ListTile(
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ListaLivros.routeName),
            leading: Icon(Icons.bookmark_add_outlined),
            title: Text('Registro de livros'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              _servicoAutenticacao.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
