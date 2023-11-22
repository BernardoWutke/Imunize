
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VacinaProvider extends ChangeNotifier {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _fabricanteController = TextEditingController();
  TextEditingController _loteController = TextEditingController();
  TextEditingController _dosesController = TextEditingController();
  TextEditingController _validadeController = TextEditingController();

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

}