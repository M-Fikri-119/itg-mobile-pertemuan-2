import 'package:flutter_test/flutter_test.dart';
import 'package:pertemuan_2/extensions/string_extensions.dart';
import 'package:pertemuan_2/models/player.dart';

void main() {
  group('RPG feature helpers', () {
    test('toTitleCase formats monster names correctly', () {
      expect('goblin king'.toTitleCase(), 'Goblin King');
      expect('the shadow'.toTitleCase(), 'The Shadow');
    });

    test('heal returns a new player without mutating the old one', () {
      const player = Player(name: 'Hero', hp: 100, inventory: {'Potion': 1});
      final healed = player.heal(10);

      expect(healed.hp, 110);
      expect(player.hp, 100);
      expect(healed.inventory, player.inventory);
    });

    test('addItem adds quantity to inventory', () {
      const player = Player(name: 'Hero', hp: 100, inventory: {'Potion': 1});
      final updated = player.addItem('Sword', 2);

      expect(updated.inventory['Potion'], 1);
      expect(updated.inventory['Sword'], 2);
      expect(player.inventory['Sword'], null);
    });
  });
}
