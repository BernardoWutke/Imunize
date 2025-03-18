import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:bancodedadosvacina/models/vacina_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastrarVacinaProvider extends ChangeNotifier {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _fabricanteController = TextEditingController();
  TextEditingController _loteController = TextEditingController();
  TextEditingController _dosesController = TextEditingController();
  final TextEditingController _validadeController = TextEditingController();

  get nomeController => _nomeController;

  set nomeController(value) {
    _nomeController = value;
    notifyListeners();
  }

  get fabricanteController => _fabricanteController;

  set fabricanteController(value) {
    _fabricanteController = value;
    notifyListeners();
  }

  get loteController => _loteController;

  set loteController(value) {
    _loteController = value;
    notifyListeners();
  }

  get dosesController => _dosesController;

  set dosesController(value) {
    _dosesController = value;
    notifyListeners();
  }

  get validadeController => _validadeController;

  void seTvalidadeController(DateTime value) {
    _validadeController.text = value.toString().split(" ")[0];
    notifyListeners();
  }

  void emptyAllControllers() {
    _nomeController.clear();
    _fabricanteController.clear();
    _nomeController.clear();
    _dosesController.clear();
    _validadeController.clear();
    _loteController.clear();
  }

  String cadastrarVacina() {
    bool hasEmptyField = false;

    if (nomeController.text.isEmpty ||
        loteController.text.isEmpty ||
        fabricanteController.text.isEmpty ||
        dosesController.text.isEmpty ||
        validadeController.text.isEmpty) {
      hasEmptyField = true;
    }

    if (hasEmptyField) {
      return "Erro: Preencha todos os campos.";
    } else {
      VacinaModel vacina = VacinaModel(
        fabricante: fabricanteController.text,
        lote: loteController.text,
        nome: nomeController.text,
        doses: dosesController.text,
        validade: _validadeController.text,
      );
      BancoDeDados.bd.criarVacina(vacina);

      emptyAllControllers();

      return "Cadastrado com sucesso";
    }
  }
}
