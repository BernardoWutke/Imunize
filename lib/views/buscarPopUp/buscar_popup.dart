import 'package:bancodedadosvacina/providers/vacinar_provider.dart';
import 'package:bancodedadosvacina/repositories/bd.dart';
import 'package:bancodedadosvacina/shareds/colors/app_colors.dart';
import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:bancodedadosvacina/views/buscarPopUp/mostrarVacina/mostrarvacina_popup.dart';
import 'package:bancodedadosvacina/views/dialog_confirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> buscarPopUp(BuildContext context) async {
    TextEditingController _lote = TextEditingController();
    TextEditingController _cpf = TextEditingController();
  var size = MediaQuery.of(context).size;
  return showDialog(context: context, builder: (context) => Dialog(

    child: Container(
      width: size.width * 0.5,
      child: SingleChildScrollView(
        child: Consumer<VacinarProvider>(
          builder: (context, provider , child) =>  Column(
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
                child: Text("   Buscar", style: AppFonts.titleBar,),
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
                                controller: _cpf,
                                decoration: InputDecoration(
                                  labelText: "Número do CPF",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),

                            SizedBox(width: size.width * 0.02,),

                            ElevatedButton(onPressed: (){}, child: Icon(Icons.search, color: Colors.white,), style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                            ),),

                          ],
                        ),
                        SizedBox(height: size.height * 0.02,),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _lote,
                                decoration: InputDecoration(
                                  labelText: "Lote da Vacina",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),

                            SizedBox(width: size.width * 0.02,),

                            ElevatedButton(onPressed: (){

                              if(BancoDeDados.bd.buscarVacinas(_lote.text).isEmpty){
                                _lote.clear();
                                dialogConfirm(context, 'Lote não encontrado');
                              } else {
                                 mostarVacinasPopUp(context, _lote.text);
                              }

                            }, child: Icon(Icons.search, color: Colors.white,), style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                            ),),

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
