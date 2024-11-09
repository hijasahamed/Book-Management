class BooksApiModel {
  final String id;
  final String title;
  final String description;
  final String publishedDate;
  final String authorId;
  final String coverPictureURL;
  final int price;
  final List ratings;
  final int starCount;

  BooksApiModel({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedDate,
    required this.authorId,
    required this.coverPictureURL,
    required this.price,
    required this.ratings,
    required this.starCount
  });

  factory BooksApiModel.fromJson(Map<String, dynamic> json) {
    return BooksApiModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      publishedDate: json['publishedDate'].toString(),
      authorId: json['authorId'].toString(),
      coverPictureURL: json['coverPictureURL'].toString(),
      price: json['price'],
      ratings: json['ratings'],
      starCount: json['starCount'],
    );
  }
}