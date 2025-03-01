import 'package:bancodedadosvacina/models/pessoa_model.dart';
import 'package:bancodedadosvacina/providers/vacinar_provider.dart';
import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:bancodedadosvacina/shareds/colors/app_colors.dart';
import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> mostrarPessoaPopUp(BuildContext context, List<PessoaModel> pessoas) async {
  var size = MediaQuery.of(context).size;

  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: SizedBox(
              width: 500,
              child: SingleChildScrollView(
                child: Consumer<VacinarProvider>(
                  builder: (context, provider, child) => Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: AppColors.pessoaAdd,
                        ),
                        child: Text(
                          "   Pessoas",
                          style: AppFonts.titleBar,
                        ),
                      ),

                      for (var pessoa in pessoas)
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                              child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    color: Color(0xFF5E5D8F),
                                  ),
                                  child: Text(
                                    "   ${pessoa.nome}",
                                    style: AppFonts.titleBar,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "CPF: ${pessoa.cpf}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Numero do sus: ${pessoa.numeroSus}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Nome da Mãe: ${pessoa.nomeMae}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Data de Nascimento: ${pessoa.dataDeNascimento}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Sexo: ${pessoa.sexo}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Estado Civil: ${pessoa.estadoCivil}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Escolaridade: ${pessoa.escolaridade}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Cor: ${pessoa.cor}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Tem Plano de Saúde: ${pessoa.temPlanoSaude}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Endereço: ${pessoa.endereco}",
                                    style: AppFonts.titleButtonBlack,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                              ],
                            ),
                          )),
                        ),

                      //botao para voltar

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                          ),
                          child: Text(
                            "Voltar",
                            style: AppFonts.titleButton,
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
