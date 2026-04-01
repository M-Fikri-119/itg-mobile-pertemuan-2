import 'package:flutter/material.dart';
import '../models/player.dart';
import '../extensions/string_extensions.dart';
import '../services/shop_service.dart';

class RPGPage extends StatefulWidget {
  const RPGPage({super.key});

  @override
  State<RPGPage> createState() => _RPGPageState();
}

class _RPGPageState extends State<RPGPage> {
  late Player player;
  String monsterName = 'goblin king';
  List<String> shopItems = [];

  @override
  void initState() {
    super.initState();
    player = const Player(
      name: 'Hero',
      hp: 100,
      inventory: {'Sword': 1, 'Potion': 5},
    );
    _fetchShopItems();
  }

  void _fetchShopItems() async {
    final items = await fetchShopItems();
    setState(() {
      shopItems = items;
    });
  }

  void _heal() {
    setState(() {
      player = player.heal(10);
    });
  }

  void _showInventory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Inventory'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: player.inventory.entries.map((entry) {
            return Text('${entry.key}: ${entry.value}');
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RPG Game')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hero: ${player.name}', style: const TextStyle(fontSize: 20)),
            Text('HP: ${player.hp}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Text('Monster: ${monsterName.toTitleCase()}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _heal,
                  child: const Text('Heal (+10 HP)'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _showInventory,
                  child: const Text('Inventory'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Shop Items:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: shopItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(shopItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}