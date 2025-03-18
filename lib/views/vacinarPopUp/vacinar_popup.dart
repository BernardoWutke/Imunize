import 'package:bancodedadosvacina/providers/cadastrar_vacina_provider.dart';
import 'package:bancodedadosvacina/providers/vacinar_provider.dart';
import 'package:bancodedadosvacina/shareds/colors/app_colors.dart';
import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dialog_confirm.dart';

Future<void> vacinarPopUp(BuildContext context) async {
  var size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: SizedBox(
              width: double.infinity,
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
                          "   Vacinar",
                          style: AppFonts.titleBar,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.3,
                                      child: TextField(
                                        controller: provider.idVacina,
                                        decoration: const InputDecoration(
                                          labelText: 'ID vacina',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.3,
                                      child: TextField(
                                        controller: provider.dose,
                                        decoration: const InputDecoration(
                                          labelText: 'Dose',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (provider.vacinar()) {
                                      dialogConfirm(context, 'Vacinação realizada com sucesso');
                                    } else {
                                      dialogConfirm(context, 'Dados incorretos');
                                    }
                                  },
                                  child: Container(
                                    height: size.height * 0.06,
                                    width: size.height * 0.06,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/vacinaIcon.png'),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                  child: TextField(
                                    controller: provider.cpf,
                                    decoration: const InputDecoration(
                                      labelText: 'Numero do CPF',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                )
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
