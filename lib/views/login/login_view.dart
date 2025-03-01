import 'package:bancodedadosvacina/shareds/colors/app_colors.dart';
import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Imuniza',
          style: AppFonts.titleBar,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Container(
          width: 800,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColors.primaryColor,
                  width: double.infinity,
                  child: Center(
                    child: Text("Login", style: AppFonts.titleBar),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Usuário',
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      'Entrar',
                      style: AppFonts.titleButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
