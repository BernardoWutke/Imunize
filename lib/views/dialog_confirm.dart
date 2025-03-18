import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

Future<void> dialogConfirm(BuildContext context, String text) async {
  var size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: SizedBox(
              height: size.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      text,
                      style: AppFonts.titleButtonBlack,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'),
                  )
                ],
              ),
            ),
          ));
}
