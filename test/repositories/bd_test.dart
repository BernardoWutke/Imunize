import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;

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
]""");

  testWidgets('bd ...', (tester) async {
    final response = await http.get(Uri.parse('http://0.tcp.sa.ngrok.io:14728/moradorCPF/12345678901'));
    print(response.body);
  });
}
