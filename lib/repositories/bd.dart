import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:bancodedadosvacina/models/error_model.dart';
import 'package:bancodedadosvacina/models/pessoa_model.dart';
import 'package:bancodedadosvacina/models/vacina_model.dart';
import 'package:bancodedadosvacina/models/vacinacao_model.dart';
import 'package:http/http.dart' as http;

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
]""");

String pessoaJsonTest = ("""[
     {
        "idMorador": 1,
        "CPF": "12345678911",
        "numeroSUS": 987654321,
        "nome": "Fulano Silva",
        "nomeDaMae": "Ciclana Silva",
        "sexo": "M",
        "endereco": "Rua ABC, 123",
        "temPlanoSaude": true,
        "estadoCivil": "Casado",
        "escolaridade": "Ensino Superior",
        "cor": "Pardo",
        "dataDeNascimento": "1990-01-01"
    },
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
        "cor": "Pardo",
        "dataDeNascimento": "1990-01-01"
    
    }
]""");

class BancoDeDados {
  static BancoDeDados bd = BancoDeDados();

  String link = "25.35.53.65:3000";

  Future<String> criarPessoa(PessoaModel pessoa) async {
    //criar um post para o banco de dados

    Map<String, dynamic> dados = {
      "cpf": pessoa.cpf,
      "numeroSus": int.parse(pessoa.numeroSus),
      "nome": pessoa.nome,
      "dataDeNascimento": pessoa.dataDeNascimento,
      "nomeMae": pessoa.nomeMae,
      "sexo": pessoa.sexo,
      "endereco": pessoa.endereco,
      "temPlanoSaude": (pessoa.temPlanoSaude == "Sim") ? true : false,
      "estadoCivil": pessoa.estadoCivil,
      "escolaridade": pessoa.escolaridade,
      "cor": pessoa.cor
    };

    //calcular Content-Length
    String contentLength = utf8.encode(jsonEncode(dados)).length.toString();

    var response = await http.post(
      Uri.parse('http://$link/morador'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'host': link,
        'Content-Length': contentLength
      },
      body: jsonEncode(dados),
    );

    var responseJson = jsonDecode(response.body);

    Response msg = new Response(message: responseJson["message"]);

    print(msg);

    return msg.message;
  }

  void criarVacina(VacinaModel vacina) async {
    //Uri url = Uri.http(link, '$link/vacina');

    // Dados que você deseja enviar no corpo da requisição
    Map<String, dynamic> dados = {
      "nome": vacina.nome,
      "fabricante": vacina.fabricante,
      "lote": vacina.lote,
      "quantidadeDoses": int.parse(vacina.doses),
      "dataValidade": vacina.validade
    };

    //calcular Content-Length
    String contentLength = utf8.encode(jsonEncode(dados)).length.toString();

    var response = await http.post(
      Uri.parse('http://$link/vacinas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'host': link,
        'Content-Length': contentLength
      },
      body: jsonEncode(dados),
    );

    print(response.request.toString());
  }

  void vacinar(String idVacina, String cpf, String dose) async {
    //Uri url = Uri.http(link, '$link/vacina');

    // Dados que você deseja enviar no corpo da requisição
    Map<String, dynamic> dados = {
      "idVacina": idVacina,
      "CPFmorador": cpf,
      "doseMinistrada": int.parse(dose),
    };

    //calcular Content-Length
    String contentLength = utf8.encode(jsonEncode(dados)).length.toString();

    var response = await http.post(
      Uri.parse('http://$link/vacinacao'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'host': '0.tcp.sa.ngrok.io:14728',
        'Content-Length': contentLength
      },
      body: jsonEncode(dados),
    );

    print(response.request.toString());
  }

//12345678901
  Future<List<PessoaModel>> buscarPessoaHttp(String cpf) async {
    List<PessoaModel> pessoas = [];
    List<PessoaModel> pessoasBuff = [];
    //Response response = await Dio().get("http://0.tcp.sa.ngrok.io:14728/moradorCPF/${cpf}");
    Uri uri = Uri.http(link, "/moradorCPF/$cpf");

    final response = await http.get(uri);

    print(response.body.toString() == "[]");

    if (response.body.toString() == "[]") {
      return pessoas;
    } else {
      var pessoasJson = jsonDecode(response.body);
      print(pessoasJson);

      PessoaModel pessoaRetorno = PessoaModel(
          cpf: pessoasJson[0]["cpf"],
          numeroSus: pessoasJson[0]["numeroSus"],
          nome: pessoasJson[0]["nome"],
          nomeMae: pessoasJson[0]["nomeMae"],
          sexo: pessoasJson[0]["sexo"],
          endereco: pessoasJson[0]["endereco"],
          temPlanoSaude: (pessoasJson[0]["temPlanoSaude"] == "1") ? "Sim" : "Não",
          estadoCivil: pessoasJson[0]["estadoCivil"],
          escolaridade: pessoasJson[0]["escolaridade"],
          cor: pessoasJson[0]["cor"],
          dataDeNascimento: pessoasJson[0]["dataDeNascimento"]);

      print(pessoaRetorno.toString());

      pessoas.add(pessoaRetorno);
      return pessoas;
    }
  }

  Future<List<VacinaModel>> buscarLoteVacina(String lote) async {
    List<VacinaModel> vacinasBuffer = [];

    //Response response = await Dio().get("http://0.tcp.sa.ngrok.io:14728/moradorCPF/${cpf}");
    Uri uri = Uri.http(link, "/vacinas/$lote");

    final response = await http.get(uri);
    var vacinasJson = jsonDecode(response.body);

    print(vacinasJson);

    if (response.body.toString() == "[]") {
      log("entrou aqui");
      return vacinasBuffer;
    }

    for (var vacina in vacinasJson) {
      VacinaModel vacinaModel = VacinaModel(
        idVacina: vacina["id"],
        nome: vacina["nome"],
        fabricante: vacina["fabricante"],
        lote: vacina["lote"],
        doses: vacina["quantidadeDoses"],
        validade: vacina["dataValidade"],
      );
      log(vacinaModel.toString(), name: "vacinaModel");

      vacinasBuffer.add(vacinaModel);
    }
    return vacinasBuffer;
  }

  Future<List<VacinacaoModel>> buscavacinacao(String cpf) async {
    List<VacinacaoModel> vacinacaoBuffer = [];

    //Response response = await Dio().get("http://0.tcp.sa.ngrok.io:14728/moradorCPF/${cpf}");

    Uri uri = Uri.http(link, "/vacinacao/$cpf");

    final response = await http.get(uri);

    print(response.body.toString());

    if (response.body.toString() == "[]") {
      return [];
    }

    var vacinacaoJson = jsonDecode(response.body.toString());

    for (var vacinacao in vacinacaoJson) {
      VacinacaoModel vacinacaoModel = VacinacaoModel(
        nomeMorador: vacinacao["nomeMorador"],
        nomeVacina: vacinacao["nomeVacina"],
        fabricante: vacinacao["fabricante"],
        dataVacinacao: vacinacao["dataVacinacao"],
        doseMinistrada: vacinacao["doseMinistrada"],
      );
      vacinacaoBuffer.add(vacinacaoModel);
    }

    return vacinacaoBuffer;
  }
}
