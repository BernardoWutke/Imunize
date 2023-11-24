import 'dart:convert';
import 'dart:core';

import 'package:bancodedadosvacina/models/pessoa_model.dart';
import 'package:bancodedadosvacina/models/vacina_model.dart';


String jsonVacinaTest = ("""[
    {
        "idVacina": 101,
        "nome": "Vacina A",
        "fabricante": "Fabricante X",
        "lote": "ABC123",
        "quantidadeDoses": 2,
        "dataValidade": "2023-12-31"
    },
    {
        "idVacina": 102,
        "nome": "Vacina B",
        "fabricante": "Fabricante Y",
        "lote": "ABC123",
        "quantidadeDoses": 2,
        "dataValidade": "2023-12-31"
    }
]""" );

String pessoaJsonTest = ("""[
     {
        "idMorador": 1,
        "CPF": "12345678901",
        "numeroSUS": 987654321,
        "nome": "Fulano Silva",
        "nomeDaMae": "Ciclana Silva",
        "sexo": "M",
        "endereco": "Rua ABC, 123",
        "temPlanoSaude": true,
        "estadoCivil": "Casado",
        "escolaridade": "Ensino Superior",
        "cor": "Pardo"
        "dataDeNascimento": "1990-01-01"
    }
    {
        "idMorador": 2,
        "CPF": "12345678901",
        "numeroSUS": 987654321,
        "nome": "Fulano Silva",
        "nomeDaMae": "Ciclana Silva",
        "sexo": "M",
        "endereco": "Rua ABC, 123",
        "temPlanoSaude": true,
        "estadoCivil": "Casado",
        "escolaridade": "Ensino Superior",
        "cor": "Pardo"
        "dataDeNascimento": "1990-01-01"
    
    }
]""" );

class BancoDeDados {

  
  String link = "https://www.youtube.com/watch?v=dQw4w9WgXcQ";

  static BancoDeDados bd = BancoDeDados();
  List<PessoaModel> pessoas = [];
  List<PessoaModel> pessoasBuff = [];

  List<VacinaModel> vacinasBuffer = [];

  List<VacinaModel> vacinaBusca = [];
  

  

  void criarPessoa(PessoaModel pessoa) {
    pessoas.add(pessoa);
    printarPessoas();
  }

  void addVacinaBuffer(VacinaModel vacina) {
    vacinasBuffer.add(vacina);
    
  }




  void printarPessoas() {
    for (var pessoa in pessoas) {
      print(pessoa.nome);
      print(pessoa.cpf);
      print(pessoa.nomeMae);
      print(pessoa.dataDeNascimento);
      print(pessoa.sexo);
      print(pessoa.estadoCivil);
      print(pessoa.escolaridade);
      print(pessoa.cor);
      print("_______________");
    }
  }


  void printarVacinas() {
    for (var vacina in vacinasBuffer) {
      print(vacina.nome);
      print(vacina.fabricante);
      print(vacina.lote);
      print(vacina.doses);
      print(vacina.validade);
      print("_______________");
    }
  }

  bool vacinarPessoa(String numeroSus, String nomeVacina) {
    if (numeroSus == "1"){
      print( "Vacina: $nomeVacina aplicada em $numeroSus");
      return true;
    }
    else {
      return false;
    }
  }

  void carregarPessoas(){
    final pessoasJson  =  jsonDecode(pessoaJsonTest);
    for (var pessoa in pessoasJson) {
      PessoaModel pessoaModel = PessoaModel(
        idMorador: pessoa["idMorador"],
        cpf: pessoa["CPF"],
        numeroSus: pessoa["numeroSUS"],
        nome: pessoa["nome"],
        nomeMae: pessoa["nomeDaMae"],
        sexo: pessoa["sexo"],
        endereco: pessoa["endereco"],
        temPlanoSaude: pessoa["temPlanoSaude"],
        estadoCivil: pessoa["estadoCivil"],
        escolaridade: pessoa["escolaridade"],
        cor: pessoa["cor"],
        dataDeNascimento: pessoa["dataDeNascimento"],
      );
      criarPessoa(pessoaModel);
    }
  }

  List<PessoaModel> buscarPessoa(String cpf){
    pessoas.clear();
    carregarPessoas();
    for (var pessoa in pessoas) {
      if (pessoa.cpf == cpf){
        pessoasBuff.add(pessoa);
      }
    } 
    return pessoasBuff;
  }

  void carregarVacinas(){
    final vacinasJson  =  jsonDecode(jsonVacinaTest);
    for (var vacina in vacinasJson) {
      VacinaModel vacinaModel = VacinaModel(
        idVacina: vacina["idVacina"],
        nome: vacina["nome"],
        fabricante: vacina["fabricante"],
        lote: vacina["lote"],
        doses: vacina["quantidadeDoses"],
        validade: vacina["dataValidade"],
      );
      addVacinaBuffer(vacinaModel);
    }
  }
  List<VacinaModel> buscarVacinas(String lote){
    vacinasBuffer.clear();
    vacinaBusca.clear();
    carregarVacinas();
   
    
    for (var vacina in vacinasBuffer) {
      if (vacina.lote == lote){
        vacinaBusca.add(vacina);
      }
    }

    print(vacinaBusca.asMap());
    return vacinaBusca;
    
  }




}