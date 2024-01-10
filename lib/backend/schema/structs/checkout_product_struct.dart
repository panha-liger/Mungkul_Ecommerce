// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckoutProductStruct extends FFFirebaseStruct {
  CheckoutProductStruct({
    int? quantity,
    ProductStruct? product,
    double? totalPrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quantity = quantity,
        _product = product,
        _totalPrice = totalPrice,
        super(firestoreUtilData);

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "product" field.
  ProductStruct? _product;
  ProductStruct get product => _product ?? ProductStruct();
  set product(ProductStruct? val) => _product = val;
  void updateProduct(Function(ProductStruct) updateFn) =>
      updateFn(_product ??= ProductStruct());
  bool hasProduct() => _product != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;
  void incrementTotalPrice(double amount) => _totalPrice = totalPrice + amount;
  bool hasTotalPrice() => _totalPrice != null;

  static CheckoutProductStruct fromMap(Map<String, dynamic> data) =>
      CheckoutProductStruct(
        quantity: castToType<int>(data['quantity']),
        product: ProductStruct.maybeFromMap(data['product']),
        totalPrice: castToType<double>(data['total_price']),
      );

  static CheckoutProductStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckoutProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quantity': _quantity,
        'product': _product?.toMap(),
        'total_price': _totalPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'product': serializeParam(
          _product,
          ParamType.DataStruct,
        ),
        'total_price': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static CheckoutProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckoutProductStruct(
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        product: deserializeStructParam(
          data['product'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStruct.fromSerializableMap,
        ),
        totalPrice: deserializeParam(
          data['total_price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CheckoutProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckoutProductStruct &&
        quantity == other.quantity &&
        product == other.product &&
        totalPrice == other.totalPrice;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([quantity, product, totalPrice]);
}

CheckoutProductStruct createCheckoutProductStruct({
  int? quantity,
  ProductStruct? product,
  double? totalPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckoutProductStruct(
      quantity: quantity,
      product: product ?? (clearUnsetFields ? ProductStruct() : null),
      totalPrice: totalPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckoutProductStruct? updateCheckoutProductStruct(
  CheckoutProductStruct? checkoutProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkoutProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckoutProductStructData(
  Map<String, dynamic> firestoreData,
  CheckoutProductStruct? checkoutProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkoutProduct == null) {
    return;
  }
  if (checkoutProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkoutProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkoutProductData =
      getCheckoutProductFirestoreData(checkoutProduct, forFieldValue);
  final nestedData =
      checkoutProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkoutProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckoutProductFirestoreData(
  CheckoutProductStruct? checkoutProduct, [
  bool forFieldValue = false,
]) {
  if (checkoutProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkoutProduct.toMap());

  // Handle nested data for "product" field.
  addProductStructData(
    firestoreData,
    checkoutProduct.hasProduct() ? checkoutProduct.product : null,
    'product',
    forFieldValue,
  );

  // Add any Firestore field values
  checkoutProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckoutProductListFirestoreData(
  List<CheckoutProductStruct>? checkoutProducts,
) =>
    checkoutProducts
        ?.map((e) => getCheckoutProductFirestoreData(e, true))
        .toList() ??
    [];
