import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/livro_repository.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/grade_livros.dart';

class Home extends StatefulWidget {
  static final routeName = "/";

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<LivroRepository>(context, listen: false).carregarLivros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Livros"),
      ),
      body: GradeLivros(),
      drawer: CustomDrawer(),
    );
  }
}
