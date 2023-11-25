import 'package:bancodedadosvacina/providers/cadastrar_vacina_provider.dart';
import 'package:bancodedadosvacina/shareds/colors/app_colors.dart';
import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bancodedadosvacina/views/dialog_confirm.dart';

Future<void> cadastrarVacinaPopUp(BuildContext context) async {
    var size = MediaQuery.of(context).size;
    return showDialog(context: context, builder: (context) => Dialog(

      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Consumer<CadastrarVacinaProvider>(
            builder: (context, provider , child) =>  Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.vacinaPrimaryAddColor,
                    ),
                    child: Text("  Cadastrar Vacina", style: AppFonts.titleBar,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: provider.nomeController,
                      decoration: const InputDecoration(
                        labelText: 'Nome da Vacina',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: provider.fabricanteController,
                        decoration: const InputDecoration(
                        labelText: 'Fabricante',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: provider.loteController,
                      decoration: const InputDecoration(
                        labelText: 'lote',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: provider.dosesController,
                      decoration: const InputDecoration(
                        labelText: 'Quantidade de doses',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: provider.validadeController,
                      decoration: const InputDecoration(
                        labelText: 'Data de validade',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? data = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        provider.seTvalidadeController(data!);
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: (){
                        String cadastroBuffer = provider.cadastrarVacina();
                        dialogConfirm(context, cadastroBuffer);
                      },
                      child:  Text('Cadastrar', style: AppFonts.titleBar,),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.vacinaPrimaryAddColor,
                        textStyle: AppFonts.titleButton,
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
