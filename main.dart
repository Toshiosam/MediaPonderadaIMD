import 'package:calculadora_de_media_ponderada/page_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const CalculadoraIMD(),
    theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity),
  ));
}

class CalculadoraIMD extends StatefulWidget {
  const CalculadoraIMD({super.key});

  @override
  State<CalculadoraIMD> createState() => _CalculadoraIMDState();
}

class _CalculadoraIMDState extends State<CalculadoraIMD> {
  final TextEditingController _disciplinaController = TextEditingController();
  final TextEditingController _notaAPController = TextEditingController();
  final TextEditingController _notaPVController = TextEditingController();
  final TextEditingController _notaEVController = TextEditingController();
  final TextEditingController _notaPPController = TextEditingController();

  void calcular() {
    setState(() {
      const int pesoAP = 25;
      const int pesoPV = 10;
      const int pesoEV = 15;
      const int pesoPP = 50;
      const totalPesos = pesoAP + pesoPV + pesoEV + pesoPP;

      dynamic disciplina = _disciplinaController.text;
      double notaAP = double.parse(_notaAPController.text);
      double notaPV = double.parse(_notaPVController.text);
      double notaEV = double.parse(_notaEVController.text);
      double notaPP = double.parse(_notaPPController.text);

      double totalAP = notaAP * pesoAP;
      double totalPV = notaPV * pesoPV;
      double totalEV = notaEV * pesoEV;
      double totalPP = notaPP * pesoPP;
      double notafinal = (totalAP + totalPV + totalEV + totalPP) / totalPesos;

      if (notafinal >= 5.0) {
        alunoStatus = "Aprovado";
      } else if (notafinal <= 4.9 && notafinal > 3.0) {
        alunoStatus = "Em Recuperação";
      } else {
        alunoStatus = "Reprovado";
      }

      notasAluno = notasAluno +
          ("Situação: $alunoStatus   Média Ponderada $notafinal \n"
              "Disciplina:  ${disciplina.toString().toUpperCase()}\n"
              "Notas: AP $notaAP, PV $notaPV, EV $notaEV, PP $notaPP\n \n");

      mediaT.add(notafinal);
      counter++;
      somamedias = mediaT.reduce((value, element) => value + element) / counter;

      _disciplinaController.clear();
      _notaAPController.clear();
      _notaPVController.clear();
      _notaEVController.clear();
      _notaPPController.clear();
    });
  }

  void _refresh() {
    setState(() {
      _disciplinaController.clear();
      _notaAPController.clear();
      _notaPVController.clear();
      _notaEVController.clear();
      _notaPPController.clear();
    });
  }

  void _refreshAll() {
    setState(() {
      notasAluno = "";
      mediaT.clear();
      somamedias = 0;
      counter--;

      if (counter < 0) {
        counter = 0;
      }
    });
  }

  List<double> mediaT = [];
  var counter = 0;
  dynamic somamedias = 0;
  String notasAluno = "";
  String alunoStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Notas IMD"),
        centerTitle: true,
        actions: [
          ElevatedButton(onPressed: _refresh, child: const Icon(Icons.refresh)),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageInfo()));
              },
              child: const Icon(
                Icons.info,
                color: Colors.yellowAccent,
              )),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 8,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            hintText: "ex: Programação front end",
                            labelText: "Disciplina",
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                        controller: _disciplinaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "insira alguma nota válida";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 15,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        maxLength: 4,
                        decoration: const InputDecoration(
                            hintText: '( [AP] utilize ponto e não virgula)',
                            hintTextDirection: TextDirection.rtl,
                            labelText: "Nota Atividade Presencial",
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                        controller: _notaAPController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "insira alguma nota válida";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                 Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 15,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        maxLength: 4,
                        decoration: const InputDecoration(
                            hintText: '([PV] utilize ponto e não virgula)',
                            hintTextDirection : TextDirection.rtl,
                            labelText: "Nota Participação Virtual",
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                        controller: _notaPVController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "insira nota válida";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 15,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        maxLength: 4,
                        decoration: const InputDecoration(
                            hintText: '([EV] utilize ponto e não virgula)',
                            hintTextDirection: TextDirection.rtl,
                            labelText: "Nota Exercicios Virtuais",
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                        controller: _notaEVController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "insira alguma nota válida";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 15,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        maxLength: 4,
                        decoration: const InputDecoration(
                            hintText: '([PP] utilize ponto e não virgula)',
                            hintTextDirection: TextDirection.rtl,
                            labelText: "Nota Prova Presencial",
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                        controller: _notaPPController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "insira alguma nota válida";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: calcular,
                          child: const Text("Média Ponderada")),
                      const SizedBox(width: 10, height: 8),
                      ElevatedButton(
                          onPressed: _refreshAll,
                          child: const Text("Reset   Histórico")),
                      const SizedBox(width: 20, height: 8),
                    ],
                  ),
                  const SizedBox(
                    width: 4,
                    height: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 275,
                          height: 15,
                          child: Text("Média das Notas do Modulo"
                              "   ${somamedias.toStringAsFixed(2)}"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GridView.builder(
                        itemCount: 1,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Text(notasAluno);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
