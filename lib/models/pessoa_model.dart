class PessoaModel {
  String nome;
  String cpf;
  String nomeMae;
  String dataDeNascimento;
  String sexo;
  String estadoCivil;
  String escolaridade;
  String cor;
  String temPlanoSaude;
  String endereco;
  String numeroSus;
  int ?idMorador;

  PessoaModel({required this.nome, required this.cpf, required this.nomeMae, required this.dataDeNascimento, required this.sexo, required this.estadoCivil, required this.escolaridade, required this.cor, required this.temPlanoSaude, required this.endereco, required this.numeroSus, this.idMorador});

}