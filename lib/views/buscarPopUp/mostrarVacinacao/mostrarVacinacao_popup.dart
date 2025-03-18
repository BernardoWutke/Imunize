import 'package:bancodedadosvacina/models/vacina_model.dart';
import 'package:bancodedadosvacina/models/vacinacao_model.dart';
import 'package:bancodedadosvacina/providers/cadastrar_vacina_provider.dart';
import 'package:bancodedadosvacina/providers/vacinar_provider.dart';
import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:bancodedadosvacina/shareds/colors/app_colors.dart';
import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> mostrarVacinacao(BuildContext context, List<VacinacaoModel> vacinas) async {
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
                          color: AppColors.vacinarColor,
                        ),
                        child: Text(
                          "   Vacinas do Morador",
                          style: AppFonts.titleBar,
                        ),
                      ),

                      for (var vacina in vacinas)
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
                                    "   ${vacina.nomeVacina}",
                                    style: AppFonts.titleBar,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  "Nome do morador: ${vacina.nomeMorador}",
                                  style: AppFonts.titleButtonBlack,
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  "Fabricante: ${vacina.fabricante}",
                                  style: AppFonts.titleButtonBlack,
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  "Dose Ministrada: ${vacina.doseMinistrada}",
                                  style: AppFonts.titleButtonBlack,
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  "Data: ${vacina.dataVacinacao}",
                                  style: AppFonts.titleButtonBlack,
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

//fazer um pop up para mostrar as vacinas do morador
