import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://pgvilfwzefgrpcfcnajq.supabase.co',
    publishableKey: 'sb_publishable_jFsCWl5Ha1JRhVjCnsJoZA_uN63FPEL',
  );
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
  List<Map<String, dynamic>> alunos = [];
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  @override
  void initState() {
    super. initState();
    _carregarAlunos();
  }

  Future<void> _carregarAlunos() async {
    final dados = await Supabase.instance.client.from('alunos').select().order('id', ascending: true);
    setState(() {
      alunos = dados;
    });
  }

  void _incrementCounter() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Novo aluno'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [              
          TextField(
            controller: _nomeController,
            decoration: const InputDecoration(hintText: 'Nome do aluno'),
          ),
          TextField(
            controller: _telefoneController,
            decoration: const InputDecoration(hintText: 'Telefone'),
            keyboardType: TextInputType.phone,
          ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final nome = _nomeController.text.trim();
                final telefone = _telefoneController.text.trim();
                if (nome.isEmpty) {
                  return;
                }
                await Supabase.instance.client.from('alunos').insert({
                  'nome': nome,
                  'telefone': telefone.isEmpty ? null : telefone,
                });
                if (!context.mounted) return;
                _nomeController.clear();
                _telefoneController.clear();
                Navigator.pop(context);
                _carregarAlunos();
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
        title: Text(alunos[index]['nome']),
        subtitle: const Text('Treino do dia!'),
        trailing: IconButton(
  icon: const Icon(Icons.delete, color: Colors.red),
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Excluir aluno!'),
          content: Text('Tem certeza que deseja excluir ${alunos[index]['nome']}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                final id = alunos[index]['id'];
                await Supabase.instance.client.from('alunos').delete().eq('id', id);
                if (!context.mounted) return;
                Navigator.pop(context);
                _carregarAlunos();
              },
              child: const Text('Excluir'),
            ),
          ],
        );
      },
    );
  },
),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FichaAlunoScreen(nomeAluno: alunos[index]['nome']),
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
