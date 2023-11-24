import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:flutter/material.dart';

class VacinarProvider extends ChangeNotifier {

  TextEditingController _nomeVacina = TextEditingController();
  TextEditingController _numeroSus = TextEditingController();

  get nomeVacina => _nomeVacina;
  set nomeVacina(value) {
    _nomeVacina = value;
    notifyListeners();
  }

  get numeroSus => _numeroSus;
  set numeroSus(value) {
    _numeroSus = value;
    notifyListeners();
  }

  void empty(){
    _nomeVacina.clear();
    _numeroSus.clear();
    notifyListeners();
  }

  bool vacinar(){
      bool confirmacao =  BancoDeDados.bd.vacinarPessoa(_numeroSus.text, _nomeVacina.text);
      empty();
      return confirmacao;
  }

  


}