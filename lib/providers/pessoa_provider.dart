
import 'package:flutter/cupertino.dart';

class PessoaProvider extends ChangeNotifier {


  //Essas lista são apenas buffes, para enviar para o banco de dados vamos usar apenas o first de cada uma
   List<String> sexoList = ["Masculino"];
   List<String> estadoCivilList = ['Solteiro'];
   List<String> escolaridadeList = ['Ensino Fundamental'];
   List<String> corList = ['Branco'];


  TextEditingController _nomeControler = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _dataNascimentoController = TextEditingController();
  TextEditingController _numeroSUSController = TextEditingController();
  TextEditingController _nomeDaMaeController = TextEditingController();

  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _planoSaudeController = TextEditingController();





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
    _enderecoController = value;
    notifyListeners();
  }

  get planoSaudeController => _planoSaudeController;
  set planoSaudeController(value) {
    _planoSaudeController = value;
    notifyListeners();
  }

  get estadoCivil => estadoCivilList.first;
  set estadoCivil(value) {
    estadoCivilList.first = value;
    notifyListeners();
  }

  get escolaridade => escolaridadeList.first;
  set escolaridade(value) {
    escolaridadeList.first = value;
    notifyListeners();
  }

  get cor => corList.first;
  set cor(value) {
    corList.first = value;
    notifyListeners();
  }




  get sexo => sexoList.first;
  set sexo(value) {
    sexoList.first = value;
    notifyListeners();
  }



}