
import 'package:bancodedadosvacina/views/homePage/button_add_vacina.dart';
import 'package:flutter/material.dart';

import '../../shareds/colors/app_colors.dart';
import '../../shareds/fonts/app_fonts.dart';
import '../cadastrarPessoa/cadastrarPessoa.dart';
import '../cadastrarVacina/cadastrar_vacina.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:  Text('Imuniza', style: AppFonts.titleBar,),
      ),

      backgroundColor: Colors.deepPurple[100],

      body:  ListView(
        padding: EdgeInsets.all(size.width * 0.05),
        children: [
          AppButtonHome(
            text: 'Cadastrar Vacina',
            image: 'images/vacina.jpg',
            color: AppColors.vacinaPrimaryAddColor,
            onPressed: (){
              cadastrarVacinaPopUp(context);
            },
         ),
          SizedBox(height: size.height * 0.04,),
          AppButtonHome(
            text: 'Cadastrar Pessoa',
            image: 'images/cadastrar_pessoa.jpg',
            color: AppColors.pessoaAdd,
            onPressed: (){
              cadastrarPessoaPopUP(context);
            },

          ),
          SizedBox(height: size.height * 0.04,),
          AppButtonHome(
            text: 'Vacinar',
            image: 'images/vacinar.jpg',
            color: AppColors.vacinarColor,
            onPressed: (){},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.search, color: Colors.white,),
        backgroundColor: Colors.deepPurple,
      )
      );

  }
}
