class Product {
  final String id;
  final String name;
  final String imageCover;
  final List<String> images;
  final num price;
  final String material;
  final List<String> sizes;
  final num ratingsAverage;
  final num ratingsQuantity;
  final String idCategory;
  final num saleOff;
  final String description;
  final num sold;

  List<String> get allImages => [imageCover, ...images];

  const Product({
    required this.id,
    required this.name,
    required this.imageCover,
    required this.images,
    required this.price,
    required this.material,
    required this.description,
    required this.idCategory,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.saleOff,
    required this.sizes,
    required this.sold,
  });

  Product.fromJson(Map<String, dynamic> map)
      : id = map['_id'],
        name = map['name'],
        imageCover = map['imageCover'],
        images = (map['images'] as List)
            .map(
              (image) => image.toString(),
            )
            .toList(),
        price = map['price'],
        material = map['material'],
        description = map['description'],
        idCategory = map['category'],
        ratingsAverage = map['ratingsAverage'],
        ratingsQuantity = map['ratingsQuantity'],
        saleOff = map['saleOff'],
        sizes = (map['sizes'] as List)
            .map(
              (image) => image.toString(),
            )
            .toList(),
        sold = map['sold'];
}
