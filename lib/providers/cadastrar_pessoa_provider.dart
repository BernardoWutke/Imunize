import 'dart:math';

import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:bancodedadosvacina/models/pessoa_model.dart';
import 'package:flutter/cupertino.dart';

class CadastrarPessoaProvider extends ChangeNotifier {
  //Essas lista são apenas buffes, para enviar para o banco de dados vamos usar apenas o primeiro elemento de cada uma
  final List<String> _sexoList = ['M'];
  final List<String> _estadoCivilList = ['Solteiro'];
  final List<String> _escolaridadeList = ['Ensino Fundamental'];
  final List<String> _corList = ['Branco'];
  final List<String> _temPlano = ['Não'];

  TextEditingController _nomeControler = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  TextEditingController _numeroSUSController = TextEditingController();
  TextEditingController _nomeDaMaeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();

  get nomeController => _nomeControler;
  set nomeController(value) {
    _nomeControler = value;
    notifyListeners();
  }

  get cpfController => _cpfController;
  set cpfController(value) {
    _cpfController = value;
    notifyListeners();
  }

  get dataNascimentController => _dataNascimentoController;
  void dataNascimentoControllerSet(DateTime value) {
    _dataNascimentoController.text = value.toString().split(" ")[0];
    notifyListeners();
  }

  get numeroSUSController => _numeroSUSController;
  set numeroSUSController(value) {
    _numeroSUSController = value;
    notifyListeners();
  }

  get nomeDaMaeController => _nomeDaMaeController;
  set nomeDaMaeController(value) {
    _nomeDaMaeController = value;
    notifyListeners();
  }

  get enderecoController => _enderecoController;
  set enderecoController(value) {
    enderecoController = value;
    notifyListeners();
  }

  get estadoCivil => _estadoCivilList.first;
  set estadoCivil(value) {
    _estadoCivilList.first = value;
    notifyListeners();
  }

  get escolaridade => _escolaridadeList.first;
  set escolaridade(value) {
    _escolaridadeList.first = value;
    notifyListeners();
  }

  get cor => _corList.first;
  set cor(value) {
    _corList.first = value;
    notifyListeners();
  }

  get sexo => _sexoList.first;
  set sexo(value) {
    _sexoList.first = value;
    notifyListeners();
  }

  get temPlanoSaude => _temPlano.first;
  set temPlanoSaude(value) {
    _temPlano.first = value;
    notifyListeners();
  }

  void emptyAllControllers() {
    _nomeControler.clear();
    _cpfController.clear();
    _dataNascimentoController.clear();
    _numeroSUSController.clear();
    _nomeDaMaeController.clear();
    _enderecoController.clear();
  }

  Future<String> cadastrarPessoa() async {
    bool hasEmptyField = false;

    if (nomeController.text.isEmpty ||
        cpfController.text.isEmpty ||
        nomeDaMaeController.text.isEmpty ||
        dataNascimentController.text.isEmpty ||
        _enderecoController.text.isEmpty ||
        sexo.isEmpty ||
        estadoCivil.isEmpty ||
        escolaridade.isEmpty ||
        cor.isEmpty ||
        temPlanoSaude.isEmpty ||
        numeroSUSController.text.isEmpty) {
      hasEmptyField = true;
    }

    if (hasEmptyField) {
      return "Erro: Preencha todos os campos.";
    } else {
      PessoaModel pessoa = PessoaModel(
        nome: nomeController.text,
        cpf: cpfController.text,
        nomeMae: nomeDaMaeController.text,
        dataDeNascimento: dataNascimentController.text,
        sexo: sexo,
        estadoCivil: estadoCivil,
        escolaridade: escolaridade,
        cor: cor,
        temPlanoSaude: temPlanoSaude,
        endereco: _enderecoController.text,
        numeroSus: numeroSUSController.text,
      );

      String response = await BancoDeDados.bd.criarPessoa(pessoa);

      emptyAllControllers();

      return response;
    }
  }
}
