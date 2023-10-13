class EventSale {
  final String id;
  final String title;
  final String description;
  final int salePercent;
  final String image;

  EventSale({
    required this.id,
    required this.title,
    required this.description,
    required this.salePercent,
    required this.image,
  });

  EventSale.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['description'],
        salePercent = map['salePercent'],
        image = map['image'];
}
