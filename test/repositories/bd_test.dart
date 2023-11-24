import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

void main() {

  String jsonTest = ("""[
    {
        "idVacina": 101,
        "nome": "Vacina A",
        "fabricante": "Fabricante X",
        "lote": "ABC123",
        "quantidadeDoses": 2,
        "dataValidade": "2023-12-31"
    },
    {
        "idVacina": 102,
        "nome": "Vacina B",
        "fabricante": "Fabricante Y",
        "lote": "ABC123",
        "quantidadeDoses": 2,
        "dataValidade": "2023-12-31"
    }
]""" );
  testWidgets('bd ...', (tester) async {
     print("iniciando teste..");
     final pessoa  =  jsonDecode(jsonTest);
     print(pessoa[1]);
  });

  
}