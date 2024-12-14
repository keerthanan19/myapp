class Category {
  String id;
  String storeId;
  String title;
  String? description;

  Category({
    required this.id,
    required this.storeId,
    required this.title,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['ID'],
      storeId: json['StoreID'],
      title: json['Title']['en'],
      description: json['Description']?['en'],
    );
  }
}
