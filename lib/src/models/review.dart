class Review {
  final String id;
  final String review;
  final num rating;
  final String nameUser;
  final String imgUser;
  final String idUser;
  final DateTime dateReivews;

  const Review({
    required this.id,
    required this.review,
    required this.rating,
    required this.nameUser,
    required this.imgUser,
    required this.idUser,
    required this.dateReivews,
  });

  Review.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        review = map['review'],
        rating = map['rating'],
        nameUser = (map['user'] as Map<String, dynamic>)['name'],
        imgUser = (map['user'] as Map<String, dynamic>)['photo'],
        idUser = (map['user'] as Map<String, dynamic>)['id'],
        dateReivews = DateTime.parse(map['createdAt']);
}
