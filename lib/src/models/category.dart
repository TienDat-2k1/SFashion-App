class Category {
  final String id;
  final String name;
  final String imageCover;

  const Category({
    required this.id,
    required this.imageCover,
    required this.name,
  });

  Category.fromJsonMap(Map<String, dynamic> map)
      : id = map['_id'],
        imageCover = map['imageCover'],
        name = map['name'];
}
