import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jessica Blasques',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.pink),
      ),
      home: const MyHomePage(title: 'Meus Alunos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> alunos = ['Rafaela', 'Manuela', 'Sophia', 'Juliana', 'Villela', 'Mauricio'];
  final TextEditingController _nomeController = TextEditingController();

  void _incrementCounter() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Novo aluno'),
          content: TextField(
            controller: _nomeController,
            decoration: const InputDecoration(hintText: 'Nome do aluno'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_nomeController.text.trim().isEmpty) {
                  return;
                }
                setState(() {
                  alunos.add(_nomeController.text);              
                });
                _nomeController.clear();
                Navigator.pop(context);
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: .center,
          children: [
                        Image.asset(
              'assets/images/logo_jessica.jpeg',
              height: 180,
            ),

Expanded(
  child: ListView.builder(
    itemCount: alunos.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: const Icon(Icons.person, color: Colors.pink),
        title: Text(alunos[index]),
        subtitle: const Text('Treino do dia!'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FichaAlunoScreen(nomeAluno: alunos[index]),
            ),
          );
        },
      );
    },
  ),
),
  
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FichaAlunoScreen extends StatelessWidget {
  final String nomeAluno;

  const FichaAlunoScreen({super.key, required this.nomeAluno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha de $nomeAluno'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text('Treinos e medidas de $nomeAluno entrarão aqui.'),
      ),
    );
  }
}
