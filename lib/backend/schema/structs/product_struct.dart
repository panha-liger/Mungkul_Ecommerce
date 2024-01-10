// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStruct extends FFFirebaseStruct {
  ProductStruct({
    String? name,
    String? description,
    String? aboutItem,
    String? status,
    int? discount,
    String? category,
    String? image,
    String? id,
    DocumentReference? productRef,
    double? price,
    double? basePrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _aboutItem = aboutItem,
        _status = status,
        _discount = discount,
        _category = category,
        _image = image,
        _id = id,
        _productRef = productRef,
        _price = price,
        _basePrice = basePrice,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "about_item" field.
  String? _aboutItem;
  String get aboutItem => _aboutItem ?? '';
  set aboutItem(String? val) => _aboutItem = val;
  bool hasAboutItem() => _aboutItem != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  set discount(int? val) => _discount = val;
  void incrementDiscount(int amount) => _discount = discount + amount;
  bool hasDiscount() => _discount != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;
  bool hasProductRef() => _productRef != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "base_price" field.
  double? _basePrice;
  double get basePrice => _basePrice ?? 0.0;
  set basePrice(double? val) => _basePrice = val;
  void incrementBasePrice(double amount) => _basePrice = basePrice + amount;
  bool hasBasePrice() => _basePrice != null;

  static ProductStruct fromMap(Map<String, dynamic> data) => ProductStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        aboutItem: data['about_item'] as String?,
        status: data['status'] as String?,
        discount: castToType<int>(data['discount']),
        category: data['category'] as String?,
        image: data['image'] as String?,
        id: data['id'] as String?,
        productRef: data['product_ref'] as DocumentReference?,
        price: castToType<double>(data['price']),
        basePrice: castToType<double>(data['base_price']),
      );

  static ProductStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProductStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'about_item': _aboutItem,
        'status': _status,
        'discount': _discount,
        'category': _category,
        'image': _image,
        'id': _id,
        'product_ref': _productRef,
        'price': _price,
        'base_price': _basePrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'about_item': serializeParam(
          _aboutItem,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'discount': serializeParam(
          _discount,
          ParamType.int,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'base_price': serializeParam(
          _basePrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        aboutItem: deserializeParam(
          data['about_item'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        discount: deserializeParam(
          data['discount'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        basePrice: deserializeParam(
          data['base_price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductStruct &&
        name == other.name &&
        description == other.description &&
        aboutItem == other.aboutItem &&
        status == other.status &&
        discount == other.discount &&
        category == other.category &&
        image == other.image &&
        id == other.id &&
        productRef == other.productRef &&
        price == other.price &&
        basePrice == other.basePrice;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        aboutItem,
        status,
        discount,
        category,
        image,
        id,
        productRef,
        price,
        basePrice
      ]);
}

ProductStruct createProductStruct({
  String? name,
  String? description,
  String? aboutItem,
  String? status,
  int? discount,
  String? category,
  String? image,
  String? id,
  DocumentReference? productRef,
  double? price,
  double? basePrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStruct(
      name: name,
      description: description,
      aboutItem: aboutItem,
      status: status,
      discount: discount,
      category: category,
      image: image,
      id: id,
      productRef: productRef,
      price: price,
      basePrice: basePrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductStruct? updateProductStruct(
  ProductStruct? product, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    product
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructData(
  Map<String, dynamic> firestoreData,
  ProductStruct? product,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (product == null) {
    return;
  }
  if (product.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && product.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productData = getProductFirestoreData(product, forFieldValue);
  final nestedData = productData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = product.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductFirestoreData(
  ProductStruct? product, [
  bool forFieldValue = false,
]) {
  if (product == null) {
    return {};
  }
  final firestoreData = mapToFirestore(product.toMap());

  // Add any Firestore field values
  product.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListFirestoreData(
  List<ProductStruct>? products,
) =>
    products?.map((e) => getProductFirestoreData(e, true)).toList() ?? [];
