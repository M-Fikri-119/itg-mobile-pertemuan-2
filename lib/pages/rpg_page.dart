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
  String lootPreview = 'No loot yet';

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

  Future<void> _fetchShopItems() async {
    final items = await fetchShopItems();
    if (!mounted) return;
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
        content: SizedBox(
          width: 240,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: player.inventory.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.key),
                    Text('x${entry.value}'),
                  ],
                ),
              );
            }).toList(),
          ),
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

  void _showLootDemo() {
    final lootOptions = ['Gold Coin', 'Health Potion', 'Rare Gem', 'Dragon Scale'];
    final randomLoot = lootOptions[(DateTime.now().millisecondsSinceEpoch % lootOptions.length)];
    setState(() {
      lootPreview = randomLoot;
    });
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
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _heal,
                  child: const Text('Heal (+10 HP)'),
                ),
                ElevatedButton(
                  onPressed: _showInventory,
                  child: const Text('Inventory'),
                ),
                ElevatedButton(
                  onPressed: _showLootDemo,
                  child: const Text('Random Loot'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Loot Demo: $lootPreview', style: const TextStyle(fontSize: 16)),
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