import 'package:flutter/material.dart';
import 'pages/rpg_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pertemuan 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeMenuPage(),
    );
  }
}

class HomeMenuPage extends StatelessWidget {
  const HomeMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('RPG Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RPGPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: increment,
              child: const Text('Tambah'),
            ),
            ElevatedButton(
              onPressed: decrement,
              child: const Text('Kurang'),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
      ),
      body: const Center(
        child: Text(
          'Ini halaman info',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}