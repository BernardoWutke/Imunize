import 'package:bancodedadosvacina/providers/cadastrar_pessoa_provider.dart';
import 'package:bancodedadosvacina/shareds/colors/app_colors.dart';
import 'package:bancodedadosvacina/shareds/fonts/app_fonts.dart';
import 'package:bancodedadosvacina/views/dialog_confirm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> cadastrarPessoaPopUP(BuildContext context) async {
  var size = MediaQuery.of(context).size;

  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Consumer<CadastrarPessoaProvider>(
            builder: (context, provider, child) => Column(children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: AppColors.pessoaAdd,
                ),
                child: Text(
                  "  Cadastrar Pessoa",
                  style: AppFonts.titleBar,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: provider.nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome da Pessoa',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: provider.numeroSUSController,
                  decoration: const InputDecoration(
                    labelText: 'Numero do cartão do SUS',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: provider.enderecoController,
                  decoration: const InputDecoration(
                    labelText: 'Endereço',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: provider.cpfController,
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: provider.nomeDaMaeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome Da mãe',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: provider.dataNascimentController,
                  decoration: const InputDecoration(
                    labelText: 'Data de nascimento',
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

                    provider.dataNascimentoControllerSet(data!);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Sexo:",
                      style: AppFonts.titleButtonBlack,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    DropdownButton<String>(
                      value: provider.sexo,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: AppFonts.titleButtonBlack,
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (newValue) {
                        provider.sexo = newValue;
                        print(provider.sexo);
                      },
                      items: <String>['M', 'F']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: AppFonts.titleButtonBlack,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Tem Plano de Saúde:",
                      style: AppFonts.titleButtonBlack,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    DropdownButton<String>(
                      value: provider.temPlanoSaude,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: AppFonts.titleButtonBlack,
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (newValue) {
                        provider.temPlanoSaude = newValue;
                        print(provider.temPlanoSaude);
                      },
                      items: <String>['Sim', 'Não']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: AppFonts.titleButtonBlack,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Estado Civil:",
                      style: AppFonts.titleButtonBlack,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    DropdownButton<String>(
                      value: provider.estadoCivil,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: AppFonts.titleButtonBlack,
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (newValue) {
                        provider.estadoCivil = newValue;
                      },
                      items: <String>[
                        'Solteiro',
                        'Casado',
                        'Divorciado',
                        'Viúvo',
                        'Outro'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: AppFonts.titleButtonBlack,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Escolaridade:",
                      style: AppFonts.titleButtonBlack,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    DropdownButton<String>(
                      value: provider.escolaridade,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: AppFonts.titleButtonBlack,
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (newValue) {
                        provider.escolaridade = newValue;
                      },
                      items: <String>[
                        'Ensino Fundamental',
                        'Ensino Médio',
                        'Ensino Superior',
                        'Pós-Graduação',
                        'Outro'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: AppFonts.titleButtonBlack,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Cor:",
                      style: AppFonts.titleButtonBlack,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    DropdownButton<String>(
                      value: provider.cor,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: AppFonts.titleButtonBlack,
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      onChanged: (newValue) {
                        provider.cor = newValue;
                      },
                      items: <String>[
                        'Branco',
                        'Negro',
                        'Pardo',
                        'Amarelo',
                        'Indígena',
                        'Outro'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: AppFonts.titleButtonBlack,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    String cadastroBuffer = provider.cadastrarPessoa();
                    dialogConfirm(context, cadastroBuffer);
                  },
                  child: Text(
                    'Cadastrar',
                    style: AppFonts.titleBar,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.pessoaAdd,
                    textStyle: AppFonts.titleButton,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    ),
  );
}
