class Player {
  final String name;
  final int hp;
  final Map<String, int> inventory;

  const Player({
    required this.name,
    required this.hp,
    required this.inventory,
  });

  Player copyWith({
    String? name,
    int? hp,
    Map<String, int>? inventory,
  }) {
    return Player(
      name: name ?? this.name,
      hp: hp ?? this.hp,
      inventory: inventory ?? this.inventory,
    );
  }

  Player heal(int amount) {
    return copyWith(hp: hp + amount);
  }

  Player addItem(String item, int quantity) {
    final newInventory = Map<String, int>.from(inventory);
    newInventory[item] = (newInventory[item] ?? 0) + quantity;
    return copyWith(inventory: newInventory);
  }
}