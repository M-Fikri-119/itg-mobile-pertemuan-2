class Hero {
  final String name;
  final int hp;
  final Map<String, int> inventory;

  const Hero({
    required this.name,
    required this.hp,
    required this.inventory,
  });

  Hero copyWith({
    String? name,
    int? hp,
    Map<String, int>? inventory,
  }) {
    return Hero(
      name: name ?? this.name,
      hp: hp ?? this.hp,
      inventory: inventory ?? this.inventory,
    );
  }

  Hero heal(int amount) {
    return copyWith(hp: hp + amount);
  }

  Hero addItem(String item, int quantity) {
    final newInventory = Map<String, int>.from(inventory);
    newInventory[item] = (newInventory[item] ?? 0) + quantity;
    return copyWith(inventory: newInventory);
  }
}