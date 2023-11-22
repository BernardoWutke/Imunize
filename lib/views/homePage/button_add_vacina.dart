import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class AppButtonHome extends StatelessWidget {
  Function() onPressed;
  String image;
  String text;
  Color color;
  AppButtonHome({super.key,required this.text, required this.image,required this.color,required this.onPressed});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return  GestureDetector(

      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration:   BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: color,
            ),
            width: double.infinity,

            child: Text(" " + text, style: AppFonts.titleButton,),
          ),
          Container(
            height: size.height * 0.3,
            width: double.infinity,
            decoration:  BoxDecoration(
              image:  DecorationImage(
                image:  AssetImage(image),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),

            ),

        ],
      ),
    );
  }
}
