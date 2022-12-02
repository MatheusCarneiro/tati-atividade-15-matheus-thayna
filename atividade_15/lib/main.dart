import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/adicionar_livro.dart';
import 'pages/autenticacao.dart';
import 'pages/detalhes_livro.dart';
import 'pages/home.dart';
import 'pages/lista_livros.dart';
import 'pages/splash.dart';
import 'repositories/livro_repository.dart';
import 'services/autenticacao_servico.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServicoAutenticacao()),
        ChangeNotifierProxyProvider<ServicoAutenticacao, LivroRepository>(
          create: (context) => LivroRepository(
              Provider.of<ServicoAutenticacao>(context, listen: false)),
          update: (context, servicoAutenticacao, anterior) =>
              LivroRepository(servicoAutenticacao),
        ),
      ],
      child: MaterialApp(
        title: "App de Livros",
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.routeName,
        routes: {
          Splash.routeName: (context) => Splash(),
          Autenticacao.routeName: (context) => Autenticacao(),
          Home.routeName: (context) => Home(),
          DetalhesLivro.routeName: (ctx) => DetalhesLivro(),
          ListaLivros.routeName: (ctx) => ListaLivros(),
          AdicionarLivro.routeName: (context) => AdicionarLivro()
        },
      ),
    );
  }
}
