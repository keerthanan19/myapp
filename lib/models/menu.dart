class Menu {
  String id;
  String menuId;
  String verticalId;
  String storeId;
  Map<String, String> title; // Translations for titles (e.g., English)
  String? subTitle;
  String? description;
  Map<String, Map<String, String>> menuAvailability; // Availability per day
  List<String> menuCategoryIds;
  DateTime createdDate;
  DateTime modifiedDate;
  String createdBy;
  String modifiedBy;

  Menu({
    required this.id,
    required this.menuId,
    required this.verticalId,
    required this.storeId,
    required this.title,
    this.subTitle,
    this.description,
    required this.menuAvailability,
    required this.menuCategoryIds,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['ID'],
      menuId: json['MenuID'],
      verticalId: json['VerticalID'],
      storeId: json['StoreID'],
      title: Map<String, String>.from(json['Title']),
      subTitle: json['SubTitle'],
      description: json['Description'],
      menuAvailability: Map<String, Map<String, String>>.from(json['MenuAvailability']),
      menuCategoryIds: List<String>.from(json['MenuCategoryIDs']),
      createdDate: DateTime.parse(json['CreatedDate']),
      modifiedDate: DateTime.parse(json['ModifiedDate']),
      createdBy: json['CreatedBy'] ?? '',
      modifiedBy: json['ModifiedBy'] ?? '',
    );
  }
}
