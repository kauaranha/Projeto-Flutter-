import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String nome = '';
String idade = "";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Flutter')),
        body: Center(
            child: Column(children: [
          ElevatedButton(
              child: const Text('Cadastro Nome:'),
              onPressed: () => showAlertDialog()),
          Text('Nome do Aluno: $nome', style: const TextStyle(fontSize: 23)),
          ElevatedButton(
              child: const Text('Cadastro Idade:'),
              onPressed: () => showAlertDialog2()),
          Text('Idade do Aluno: $idade', style: const TextStyle(fontSize: 23)),
          ElevatedButton(
              child: const Text('Cadastro Curso Escolhido:'),
              onPressed: () => showAlertDialog3()),
          Text('Curso Escolhido: $selecao',
              style: const TextStyle(fontSize: 23)),
        ])));
  }

  showAlertDialog() {
    TextEditingController txtNome = TextEditingController();
    Widget okButton = ElevatedButton(
        child: const Text('OK'),
        onPressed: () {
          setState(() => nome = txtNome.text);
          Navigator.of(context).pop();
        });
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Dados'),
              content: TextField(
                  controller: txtNome,
                  decoration:
                      const InputDecoration(label: Text("Digite o seu nome"))),
              actions: [okButton],
            ));
  }

  showAlertDialog2() {
    TextEditingController txtIdade = TextEditingController();
    Widget okButton = ElevatedButton(
        child: const Text('OK'),
        onPressed: () {
          setState(() => idade = txtIdade.text);
          Navigator.of(context).pop();
        });

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Dados'),
              content: TextField(
                  controller: txtIdade,
                  decoration: const InputDecoration(
                      label: Text("Digite a sua Idade:"))),
              actions: [okButton],
            ));
  }

  String curso = '', selecao = '';

  showAlertDialog3() {
    Widget okButton = ElevatedButton(
        child: const Text('OK'),
        onPressed: () {
          setState(() => selecao = curso);
          Navigator.of(context).pop();
        });
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Cursos'),
            actions: [okButton],
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(children: [
                RadioListTile(
                    groupValue: curso,
                    title: const Text('Desenvolvimento de Sistemas'),
                    value: 'Desenvolvimento de Sistemas',
                    onChanged: (val) => setState(() => curso = '$val')),
                RadioListTile(
                    groupValue: curso,
                    title: const Text('Nutrição'),
                    value: 'Nutrição',
                    onChanged: (val) => setState(() => curso = '$val')),
                RadioListTile(
                    groupValue: curso,
                    title: const Text('Administração'),
                    value: 'Administração',
                    onChanged: (val) => setState(() => curso = '$val')),
                RadioListTile(
                    groupValue: curso,
                    title: const Text('Mecanica'),
                    value: 'Mecanica',
                    onChanged: (val) => setState(() => curso = '$val')),
                RadioListTile(
                    groupValue: curso,
                    title: const Text('Enfermagem'),
                    value: 'Enfermagem',
                    onChanged: (val) => setState(() => curso = '$val')),
              ]);
            }),
          );
        });
  }
}
