class VacinaModel {
  int? idVacina;
  String nome;
  String fabricante;
  String lote;
  int doses;
  String validade;

  VacinaModel({this.idVacina, required this.nome, required this.fabricante, required this.lote, required this.doses, required this.validade});
}