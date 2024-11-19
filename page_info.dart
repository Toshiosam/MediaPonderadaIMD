import "package:flutter/material.dart";

class PageInfo extends StatelessWidget {
  const PageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [
              Text(
                  style: TextStyle(color: Colors.black87),
                  "Este projeto é uma aplicação para cálculo de média ponderada especifica para o curso tecnico de TI  semi presencial oferecido pelo Instituto Metropole Digital - UFRN. \n"
                  "\n"
                  "As notas de cada disciplina do curso oferecido são compostas por quatro itens de avaliação com pesos diferentes.\n \n"
                  "Itens de avaliação e seus respectivos pesos:\n"),
              Text(
                  style: TextStyle(color: Colors.blueAccent),
                  "[AP] Atividades Presenciais: essa nota avaliará o desempenho do aluno nas atividades desenvolvidas nos encontros presenciais;\n"
                  "Peso de avaliação 25 \n \n"
                  "[PV] Participação Virtual: essa nota será gerada automaticamente pelo Genome, sistema que avalia a participação do aluno no ambiente virtual e no acesso aos materiais didáticos fornecidos;\n"
                  "Peso de avaliação 10 \n \n"
                  "[EV] Exercícios no Ambiente Virtual: essa nota avaliará o desempenho do aluno nos exercícios disponibilizados no ambiente virtual;\n"
                  "Peso de avaliação 15 \n \n"
                  "[PP] Prova Escrita Presencial: essa nota avaliará o desempenho do aluno na prova escrita presencial.\n"
                  "Peso de avaliação 50 \n \n"),
              Text(
                  style: TextStyle(color: Colors.black87),
                  "Ao término de cada módulo, o aluno terá uma nota final para cada disciplina.\n"
                  "A média final do aluno no módulo será dada pela média ponderada da nota de cada disciplina do módulo."
                  "\n \n"
                  "O Cálculo da média ponderada é feito da seguinte maneira:\n \n"
                  "multiplica-se cada nota pelo respectivo peso, faz se a soma de todas as notas e então faz se a divisão pela soma dos total dos pesos \n \n"
                  "((nota AP*25) + (nota PV*10) + (nota EV*15) + (nota PP*50)) / 100 \n \n"
                  "A média do modulo é uma média dos resultados das médias ponderadas das disciplinas do modulo \n \n"),
              Text(
                  style: TextStyle(color: Colors.red),
                  "Será aprovado no módulo o aluno que: \n"
                  "(1) tiver índice de presença maior ou igual a 75%;\n"
                  "(2) tiver média final do módulo maior ou igual a 5,0 e;\n"
                  "(3) tiver as notas de todas as disciplinas do módulo maior ou igual a 3,0.\n"),
              Text(
                  style: TextStyle(color: Colors.black87),
                  "Caso o aluno tenha o índice de presença necessário, mas não satisfaça os critérios (2) e (3), poderá fazer a prova de reposição do módulo.\n"
                  "Para cada disciplina, a nota do componente Prova Escrita Presencial (PP) será substituída pela nota da disciplina na prova de reposição apenas se esta última nota for maior que a nota existente.\n"
                  "Serão aprovados apenas os alunos cuja nova nota do módulo satisfizer os critérios (2) e (3) citados acima."),
            ],
          )),
    );
  }
}
