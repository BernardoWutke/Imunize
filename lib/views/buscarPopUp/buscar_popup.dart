import 'package:bancodedadosvacina/models/vacinacao_model.dart';
import 'package:bancodedadosvacina/providers/busca_provider.dart';
import 'package:bancodedadosvacina/providers/vacinar_provider.dart';
import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:bancodedadosvacina/shareds/colors/app_colors.dart';
import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:bancodedadosvacina/views/buscarPopUp/mostrarVacina/mostrarvacina_popup.dart';
import 'package:bancodedadosvacina/views/buscarPopUp/mostrarVacinacao/mostrarVacinacao_popup.dart';
//import 'package:bancodedadosvacina/views/buscarPopUp/mostrarVacinacao/mostrarvacina_popup.dart';
import 'package:bancodedadosvacina/views/dialog_confirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mostrarPessoas/mostrar_pessoa_popup.dart';

Future<void> buscarPopUp(BuildContext context) async {
  TextEditingController lote = TextEditingController();
  TextEditingController cpfMorardor = TextEditingController();
  TextEditingController cpfVacinacao = TextEditingController();
  var size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: SizedBox(
              width: size.width * 0.5,
              child: SingleChildScrollView(
                child: Consumer<BuscaProvider>(
                  builder: (context, provider, child) => Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: AppColors.primaryColor,
                        ),
                        child: Text(
                          "   Buscar",
                          style: AppFonts.titleBar,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: cpfMorardor,
                                        decoration: const InputDecoration(
                                          labelText: "buscar morador (CPF))",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        esperarTelaPessoas(context, cpfMorardor.text);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: lote,
                                        decoration: const InputDecoration(
                                          labelText: "Lote da Vacina",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        esperarTelaVacina(context, lote.text);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: cpfVacinacao,
                                        decoration: const InputDecoration(
                                          labelText: "buscar vacinação (CPF))",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        esperarTelaVacinacao(context, cpfVacinacao.text);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}

void esperarTelaPessoas(BuildContext context, String cpf) async {
  if (await context.read<BuscaProvider>().getPessoa(cpf) == true) {
    mostrarPessoaPopUp(context, context.read<BuscaProvider>().pessoa);
  } else {
    dialogConfirm(context, 'CPF não encontrado');
  }
}

void esperarTelaVacina(BuildContext context, String lote) async {
  if (context.mounted) {
    if (await context.read<BuscaProvider>().getVacina(lote) == true) {
      mostarVacinasPopUp(context, context.read<BuscaProvider>().vacinas);
    } else {
      dialogConfirm(context, 'Lote não encontrado');
    }
  }
}

void esperarTelaVacinacao(BuildContext context, String cpf) async {
  if (await context.read<BuscaProvider>().getVacinaCpf(cpf) == true) {
    mostrarVacinacao(context, await context.read<BuscaProvider>().vacinacaos);
  } else {
    dialogConfirm(context, 'CPF não encontrado');
  }
}
