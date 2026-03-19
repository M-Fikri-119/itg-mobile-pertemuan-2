import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Prak Mobile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
<<<<<<< HEAD
              'Halaman ini tidak menyimpan state yang berubah.',
=======
              '2306119 - M Fikri Akmaludin',
>>>>>>> 2ff6a02 ( pertemuan 2)
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}