import 'package:flutter/foundation.dart';

import '../repositories/livro_repository.dart';
import '../utils/enums.dart';

class AdicionarLivroControler with ChangeNotifier {
  String _titulo = "";
  String _autor = "";
  String _edicao = "";
  String _dataLeitura = "";
  String _urlCapa = "";
  String _opiniao = "";

  final LivroRepository _repositorio;

  AdicionarLivroControler(this._repositorio);

  String get titulo => _titulo;
  String get autor => _autor;
  String get edicao => _edicao;
  String get dataLeitura => _dataLeitura;
  String get urlImagem => _urlCapa;
  String get opiniao => _opiniao;

  Status _status = Status.idle;

  bool get processando => _status == Status.working;

  bool get isValid {
    return validarTitulo(_titulo) == null &&
        validarAutor(_autor) == null &&
        validarUrl(_urlCapa) == null &&
        validarEdicao(_edicao) == null &&
        validarData(_dataLeitura) == null &&
        validarOpiniao(_opiniao) == null;
  }

  String? validarTitulo(String? val) {
    if (val == null || val.isEmpty) {
      return "O título não pode ser vazio";
    }
    if (val.length < 5) {
      return "O título deve conter mais que 5 letras";
    }
    return null;
  }

  String? validarAutor(String? val) {
    if (val == null || val.isEmpty) {
      return "O nome do autor não pode estar vazio";
    }
    return null;
  }

  String? validarEdicao(String? val) {
    if (val == null || val.isEmpty) {
      return "A edição não pode estar vazia";
    }
    return null;
  }

  String? validarData(String? val) {
    if (val == null || val.isEmpty) {
      return "A data não pode estar vazia";
    } else if (val.length < 10) {
      return "A data está no formato errado. Formato: DD/MM/AAAA";
    }
    return null;
  }

  String? validarUrl(String? val) {}

  String? validarOpiniao(String? val) {}

  setTitulo(String val) {
    _titulo = val;
    print(_titulo);
    notifyListeners();
  }

  setAutor(String val) {
    _autor = val;
    notifyListeners();
  }

  setEdicao(String val) {
    _edicao = val;
    notifyListeners();
  }

  setData(String val) {
    _dataLeitura = val;
    notifyListeners();
  }

  setUrl(String val) {
    _urlCapa = val;
    notifyListeners();
  }

  setOpiniao(String val) {
    _opiniao = val;
    notifyListeners();
  }

  ///Adiciona um produto no repositorio e processa
  ///o resultado.
  Future<String?> adicionar() async {
    _status = Status.working;
    notifyListeners();

    final resp = await _repositorio.adicionar(
        _titulo, _autor, _edicao, _dataLeitura, _urlCapa, _opiniao);

    _status = Status.done;
    notifyListeners();

    return resp;
  }
}
