// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BestSellingProductsStruct extends FFFirebaseStruct {
  BestSellingProductsStruct({
    String? productId,
    int? productAmount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productId = productId,
        _productAmount = productAmount,
        super(firestoreUtilData);

  // "product_Id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;
  bool hasProductId() => _productId != null;

  // "product_amount" field.
  int? _productAmount;
  int get productAmount => _productAmount ?? 0;
  set productAmount(int? val) => _productAmount = val;
  void incrementProductAmount(int amount) =>
      _productAmount = productAmount + amount;
  bool hasProductAmount() => _productAmount != null;

  static BestSellingProductsStruct fromMap(Map<String, dynamic> data) =>
      BestSellingProductsStruct(
        productId: data['product_Id'] as String?,
        productAmount: castToType<int>(data['product_amount']),
      );

  static BestSellingProductsStruct? maybeFromMap(dynamic data) => data is Map
      ? BestSellingProductsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_Id': _productId,
        'product_amount': _productAmount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_Id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'product_amount': serializeParam(
          _productAmount,
          ParamType.int,
        ),
      }.withoutNulls;

  static BestSellingProductsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BestSellingProductsStruct(
        productId: deserializeParam(
          data['product_Id'],
          ParamType.String,
          false,
        ),
        productAmount: deserializeParam(
          data['product_amount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BestSellingProductsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BestSellingProductsStruct &&
        productId == other.productId &&
        productAmount == other.productAmount;
  }

  @override
  int get hashCode => const ListEquality().hash([productId, productAmount]);
}

BestSellingProductsStruct createBestSellingProductsStruct({
  String? productId,
  int? productAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BestSellingProductsStruct(
      productId: productId,
      productAmount: productAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BestSellingProductsStruct? updateBestSellingProductsStruct(
  BestSellingProductsStruct? bestSellingProducts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bestSellingProducts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBestSellingProductsStructData(
  Map<String, dynamic> firestoreData,
  BestSellingProductsStruct? bestSellingProducts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bestSellingProducts == null) {
    return;
  }
  if (bestSellingProducts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bestSellingProducts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bestSellingProductsData =
      getBestSellingProductsFirestoreData(bestSellingProducts, forFieldValue);
  final nestedData =
      bestSellingProductsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      bestSellingProducts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBestSellingProductsFirestoreData(
  BestSellingProductsStruct? bestSellingProducts, [
  bool forFieldValue = false,
]) {
  if (bestSellingProducts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bestSellingProducts.toMap());

  // Add any Firestore field values
  bestSellingProducts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBestSellingProductsListFirestoreData(
  List<BestSellingProductsStruct>? bestSellingProductss,
) =>
    bestSellingProductss
        ?.map((e) => getBestSellingProductsFirestoreData(e, true))
        .toList() ??
    [];
