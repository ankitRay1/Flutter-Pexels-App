class PhotoModel {
  String imageUrl;
  String photographer;

  PhotoModel({required this.imageUrl, required this.photographer});

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    final photos = map['src'] as Map<String, dynamic>;

    return PhotoModel(
        imageUrl: photos['portrait'] ?? 'https://google.com',
        photographer: map['photographer'] ?? "Ankit kumar");
  }
}
