Future<List<String>> fetchShopItems() async {
  await Future.delayed(const Duration(seconds: 1));
  return ['Sword', 'Shield', 'Potion', 'Armor'];
}