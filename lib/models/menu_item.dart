class MenuItem {
  String id;
  String menuItemId;
  String storeId;
  Map<String, String> title;
  Map<String, String> description;
  String imageUrl;
  PriceInfo priceInfo;
  QuantityInfo quantityInfo;
  SuspensionRules suspensionRules;
  List<String> modifierGroupRules;
  RewardGroupRules rewardGroupRules;
  TaxInfo taxInfo;
  int aggregatedProductRating;
  int totalReviews;
  DateTime createdDate;
  DateTime modifiedDate;
  NutrientData nutrientData;
  DishInfo dishInfo;
  VisibilityInfo visibilityInfo;
  ProductInfo productInfo;
  List<String>? bundleItems;
  BeverageInfo beverageInfo;
  List<String> categoryIds;
  MetaData metaData;

  MenuItem({
    required this.id,
    required this.menuItemId,
    required this.storeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.priceInfo,
    required this.quantityInfo,
    required this.suspensionRules,
    required this.modifierGroupRules,
    required this.rewardGroupRules,
    required this.taxInfo,
    required this.aggregatedProductRating,
    required this.totalReviews,
    required this.createdDate,
    required this.modifiedDate,
    required this.nutrientData,
    required this.dishInfo,
    required this.visibilityInfo,
    required this.productInfo,
    this.bundleItems,
    required this.beverageInfo,
    required this.categoryIds,
    required this.metaData,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['ID'],
      menuItemId: json['MenuItemID'],
      storeId: json['StoreID'],
      title: Map<String, String>.from(json['Title']),
      description: Map<String, String>.from(json['Description']),
      imageUrl: json['ImageURL'],
      priceInfo: PriceInfo.fromJson(json['PriceInfo']),
      quantityInfo: QuantityInfo.fromJson(json['QuantityInfo']),
      suspensionRules: SuspensionRules.fromJson(json['SuspensionRules']),
      modifierGroupRules: List<String>.from(json['ModifierGroupRules']['IDs']),
      rewardGroupRules: RewardGroupRules.fromJson(json['RewardGroupRules']),
      taxInfo: TaxInfo.fromJson(json['TaxInfo']),
      aggregatedProductRating: json['AggregatedProductRating'],
      totalReviews: json['TotalReviews'],
      createdDate: DateTime.parse(json['CreatedDate']),
      modifiedDate: DateTime.parse(json['ModifiedDate']),
      nutrientData: NutrientData.fromJson(json['NutrientData']),
      dishInfo: DishInfo.fromJson(json['DishInfo']),
      visibilityInfo: VisibilityInfo.fromJson(json['VisibilityInfo']),
      productInfo: ProductInfo.fromJson(json['ProductInfo']),
      bundleItems: json['BundleItems'] != null ? List<String>.from(json['BundleItems']) : null,
      beverageInfo: BeverageInfo.fromJson(json['BeverageInfo']),
      categoryIds: List<String>.from(json['CategoryIDs']),
      metaData: MetaData.fromJson(json['MetaData']),
    );
  }
}

class PriceInfo {
  Price price;
  double corePrice;
  double containerDeposit;

  PriceInfo({
    required this.price,
    required this.corePrice,
    required this.containerDeposit,
  });

  factory PriceInfo.fromJson(Map<String, dynamic> json) {
    return PriceInfo(
      price: Price.fromJson(json['Price']),
      corePrice: json['CorePrice'] ?? 0.0,
      containerDeposit: json['ContainerDeposit'] ?? 0.0,
    );
  }
}

class Price {
  double deliveryPrice;
  double pickupPrice;
  double tablePrice;

  Price({
    required this.deliveryPrice,
    required this.pickupPrice,
    required this.tablePrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      deliveryPrice: json['DeliveryPrice'] ?? 0.0,
      pickupPrice: json['PickupPrice'] ?? 0.0,
      tablePrice: json['TablePrice'] ?? 0.0,
    );
  }
}

class QuantityInfo {
  Quantity quantity;
  dynamic overrides;

  QuantityInfo({
    required this.quantity,
    this.overrides,
  });

  factory QuantityInfo.fromJson(Map<String, dynamic> json) {
    return QuantityInfo(
      quantity: Quantity.fromJson(json['Quantity']),
      overrides: json['Overrides'],
    );
  }
}

class Quantity {
  int minPermitted;
  int maxPermitted;
  bool isMinPermittedOptional;
  int chargeAbove;
  int refundUnder;
  int minPermittedUnique;
  int maxPermittedUnique;

  Quantity({
    required this.minPermitted,
    required this.maxPermitted,
    required this.isMinPermittedOptional,
    required this.chargeAbove,
    required this.refundUnder,
    required this.minPermittedUnique,
    required this.maxPermittedUnique,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) {
    return Quantity(
      minPermitted: json['MinPermitted'] ?? 0,
      maxPermitted: json['MaxPermitted'] ?? 0,
      isMinPermittedOptional: json['IsMinPermittedOptional'] ?? true,
      chargeAbove: json['ChargeAbove'] ?? 0,
      refundUnder: json['RefundUnder'] ?? 0,
      minPermittedUnique: json['MinPermittedUnique'] ?? 0,
      maxPermittedUnique: json['MaxPermittedUnique'] ?? 0,
    );
  }
}

class SuspensionRules {
  Suspension suspension;
  dynamic suspensionOverride;

  SuspensionRules({
    required this.suspension,
    this.suspensionOverride,
  });

  factory SuspensionRules.fromJson(Map<String, dynamic> json) {
    return SuspensionRules(
      suspension: Suspension.fromJson(json['Suspension']),
      suspensionOverride: json['SuspensionOverride'],
    );
  }
}

class Suspension {
  int suspendedUntil;
  bool isSuspended;
  String reason;

  Suspension({
    required this.suspendedUntil,
    required this.isSuspended,
    required this.reason,
  });

  factory Suspension.fromJson(Map<String, dynamic> json) {
    return Suspension(
      suspendedUntil: json['SuspendedUntil'] ?? 0,
      isSuspended: json['IsSuspended'] ?? false,
      reason: json['Reason'] ?? '',
    );
  }
}

class RewardGroupRules {
  Reward reward;
  dynamic overrides;

  RewardGroupRules({
    required this.reward,
    this.overrides,
  });

  factory RewardGroupRules.fromJson(Map<String, dynamic> json) {
    return RewardGroupRules(
      reward: Reward.fromJson(json['Reward']),
      overrides: json['Overrides'],
    );
  }
}

class Reward {
  String type;
  double defaultValue;
  double multiplierValue;
  double customValue;
  bool isMultiplierRequired;

  Reward({
    required this.type,
    required this.defaultValue,
    required this.multiplierValue,
    required this.customValue,
    required this.isMultiplierRequired,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      type: json['Type'] ?? '',
      defaultValue: json['DefaultValue'] ?? 0.0,
      multiplierValue: json['MultiplierValue'] ?? 0.0,
      customValue: json['CustomValue'] ?? 0.0,
      isMultiplierRequired: json['IsMutiplierRequired'] ?? false,
    );
  }
}

class TaxInfo {
  double taxRate;
  double vatRateInPercentage;

  TaxInfo({
    required this.taxRate,
    required this.vatRateInPercentage,
  });

  factory TaxInfo.fromJson(Map<String, dynamic> json) {
    return TaxInfo(
      taxRate: json['Taxrate'] ?? 0.0,
      vatRateInPercentage: json['VATRateInPercentage'] ?? 0.0,
    );
  }
}

class NutrientData {
  double calories;
  double fat;
  double protein;
  double carbs;

  NutrientData({
    required this.calories,
    required this.fat,
    required this.protein,
    required this.carbs,
  });

  factory NutrientData.fromJson(Map<String, dynamic> json) {
    return NutrientData(
      calories: json['Calories'] ?? 0.0,
      fat: json['Fat'] ?? 0.0,
      protein: json['Protein'] ?? 0.0,
      carbs: json['Carbs'] ?? 0.0,
    );
  }
}

class DishInfo {
  String dishType;
  String? origin;

  DishInfo({
    required this.dishType,
    this.origin,
  });

  factory DishInfo.fromJson(Map<String, dynamic> json) {
    return DishInfo(
      dishType: json['DishType'] ?? '',
      origin: json['Origin'],
    );
  }
}

class VisibilityInfo {
  bool isVisible;
  DateTime visibleUntil;

  VisibilityInfo({
    required this.isVisible,
    required this.visibleUntil,
  });

  factory VisibilityInfo.fromJson(Map<String, dynamic> json) {
    return VisibilityInfo(
      isVisible: json['IsVisible'] ?? true,
      visibleUntil: DateTime.parse(json['VisibleUntil']),
    );
  }
}

class ProductInfo {
  String productId;
  String productName;

  ProductInfo({
    required this.productId,
    required this.productName,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      productId: json['ProductID'] ?? '',
      productName: json['ProductName'] ?? '',
    );
  }
}

class BeverageInfo {
  bool isAlcoholic;
  double alcoholContent;

  BeverageInfo({
    required this.isAlcoholic,
    required this.alcoholContent,
  });

  factory BeverageInfo.fromJson(Map<String, dynamic> json) {
    return BeverageInfo(
      isAlcoholic: json['IsAlcoholic'] ?? false,
      alcoholContent: json['AlcoholContent'] ?? 0.0,
    );
  }
}

class MetaData {
  String createdBy;
  String modifiedBy;
  DateTime createdDate;
  DateTime modifiedDate;

  MetaData({
    required this.createdBy,
    required this.modifiedBy,
    required this.createdDate,
    required this.modifiedDate,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      createdBy: json['CreatedBy'] ?? '',
      modifiedBy: json['ModifiedBy'] ?? '',
      createdDate: DateTime.parse(json['CreatedDate']),
      modifiedDate: DateTime.parse(json['ModifiedDate']),
    );
  }
}
