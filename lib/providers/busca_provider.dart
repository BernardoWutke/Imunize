import 'dart:developer';

import 'package:bancodedadosvacina/models/pessoa_model.dart';
import 'package:bancodedadosvacina/models/vacina_model.dart';
import 'package:bancodedadosvacina/models/vacinacao_model.dart';
import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:flutter/material.dart';

class BuscaProvider extends ChangeNotifier {
  late List<PessoaModel> pessoa;

  late List<VacinaModel> vacinas;

  late List<VacinacaoModel> vacinacaos;

  Future<bool> getPessoa(String cpf) async {
    if (cpf == "") {
      return false;
    }

    var pessoa = await BancoDeDados.bd.buscarPessoaHttp(cpf);
    if (pessoa.isEmpty) {
      notifyListeners();
      return false;
    } else {
      this.pessoa = pessoa;
      print(pessoa[0].cor);
      return true;
    }
  }

  Future<bool> getVacina(String lote) async {
    if (lote == "") {
      return false;
    }

    var vacina = await BancoDeDados.bd.buscarLoteVacina(lote);

    log(vacina.toString(), name: "BuscaProvider");

    if (vacina.isEmpty) {
      notifyListeners();
      return false;
    } else {
      vacinas = vacina;

      return true;
    }
  }

  Future<bool> getVacinaCpf(String cpf) async {
    if (cpf == "") {
      return false;
    }

    var vacinacao = await BancoDeDados.bd.buscavacinacao(cpf);

    if (vacinacao.isEmpty) {
      notifyListeners();
      return false;
    } else {
      vacinacaos = vacinacao;
      return true;
    }
  }
}
