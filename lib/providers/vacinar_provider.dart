import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:flutter/material.dart';

class VacinarProvider extends ChangeNotifier {

  TextEditingController _idVacina = TextEditingController();
  TextEditingController _cpf = TextEditingController();
  TextEditingController _dose = TextEditingController();


  get idVacina => _idVacina;
  set idVacina(value) {
    _idVacina = value;
    notifyListeners();
  }

  get cpf => _cpf;
  set cpf(value) {
    _cpf = value;
    notifyListeners();
  }

  get dose => _dose;

  set dose(value) {
    _dose = value;
    notifyListeners();
  }

  void empty(){
    _idVacina.clear();
    _cpf.clear();
    notifyListeners();
  }

  bool vacinar(){
      print("id " +  _idVacina.text);
      print("cpf "+ _cpf.text);
      print("dose "+  _dose.text);
      
      
      if ( _idVacina.text.isEmpty || _cpf.text.isEmpty || _dose.text.isEmpty){
        return false;
      } else {
        BancoDeDados.bd.vacinar(_idVacina.text, _cpf.text, _dose.text);
        return true;
      }
  }

  


}