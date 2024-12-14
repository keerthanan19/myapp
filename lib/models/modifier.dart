class Modifier {
  String id;
  String title;
  String? description;
  String storeId;
  String displayType;
  List<ModifierOption> modifierOptions;
  QuantityConstraintsRules quantityConstraintsRules;

  Modifier({
    required this.id,
    required this.title,
    this.description,
    required this.storeId,
    required this.displayType,
    required this.modifierOptions,
    required this.quantityConstraintsRules,
  });

  factory Modifier.fromJson(Map<String, dynamic> json) {
    return Modifier(
      id: json['ModifierGroupID'],
      title: json['Title']['en'],
      description: json['Description']?['en'],
      storeId: json['StoreID'],
      displayType: json['DisplayType'],
      modifierOptions: List<ModifierOption>.from(
          json['ModifierOptions'].map((option) => ModifierOption.fromJson(option))),
      quantityConstraintsRules: QuantityConstraintsRules.fromJson(json['QuantityConstraintsRules']),
    );
  }
}

class ModifierOption {
  String id;
  String title;
  double price;
  bool isDefault;

  ModifierOption({
    required this.id,
    required this.title,
    required this.price,
    required this.isDefault,
  });

  factory ModifierOption.fromJson(Map<String, dynamic> json) {
    return ModifierOption(
      id: json['ModifierOptionID'],
      title: json['Title']['en'],
      price: json['Price'] ?? 0.0,
      isDefault: json['IsDefault'] ?? false,
    );
  }
}

class QuantityConstraintsRules {
  int minPermitted;
  int maxPermitted;

  QuantityConstraintsRules({
    required this.minPermitted,
    required this.maxPermitted,
  });

  factory QuantityConstraintsRules.fromJson(Map<String, dynamic> json) {
    return QuantityConstraintsRules(
      minPermitted: json['MinPermitted'] ?? 0,
      maxPermitted: json['MaxPermitted'] ?? 0,
    );
  }
}
