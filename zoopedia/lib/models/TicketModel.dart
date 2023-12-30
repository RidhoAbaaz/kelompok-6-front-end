// ignore_for_file: file_names

class FavoriteListModel {
  static List<String> itemNames = [
    'Kids',
    'Reguler',
    'VIP',
  ];

  static List<String> itemSubtitle = [
    'Rp. 25.000',
    'Rp. 35.000',
    'Rp. 45.000',
  ];

  static List<String> itemImages = [
    'images/ticket_kids.png',
    'images/ticket_regular.png',
    'images/ticket_vip.png',
  ];

  static List<double> itemPrices = [
    25.000,
    35.000,
    45.000,
  ];

  Item getById(int id, {int quantity = 1}) => Item(
        id,
        itemNames[id % itemNames.length],
        itemSubtitle[id % itemSubtitle.length],
        itemImages[id % itemImages.length],
        price: itemPrices[id % itemPrices.length],
        quantity: quantity,
      );

  Item getByPosition(int position, {int quantity = 1}) {
    return getById(position, quantity: quantity);
  }
}

class Item {
  final int id;
  final String name;
  final String subtittle;
  final String image;
  int quantity; // Added quantity field
  final double price; // Added price field

  Item(
    this.id,
    this.name,
    this.subtittle,
    this.image, {
    this.quantity = 1, // Default quantity is 1
    required this.price, // Make price a required parameter
  });

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) =>
      other is Item && other.id == id && other.quantity == quantity;
}
