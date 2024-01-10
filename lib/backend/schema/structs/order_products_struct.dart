// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderProductsStruct extends FFFirebaseStruct {
  OrderProductsStruct({
    CheckoutProductStruct? checkoutProducts,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _checkoutProducts = checkoutProducts,
        super(firestoreUtilData);

  // "checkout_products" field.
  CheckoutProductStruct? _checkoutProducts;
  CheckoutProductStruct get checkoutProducts =>
      _checkoutProducts ?? CheckoutProductStruct();
  set checkoutProducts(CheckoutProductStruct? val) => _checkoutProducts = val;
  void updateCheckoutProducts(Function(CheckoutProductStruct) updateFn) =>
      updateFn(_checkoutProducts ??= CheckoutProductStruct());
  bool hasCheckoutProducts() => _checkoutProducts != null;

  static OrderProductsStruct fromMap(Map<String, dynamic> data) =>
      OrderProductsStruct(
        checkoutProducts:
            CheckoutProductStruct.maybeFromMap(data['checkout_products']),
      );

  static OrderProductsStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderProductsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'checkout_products': _checkoutProducts?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'checkout_products': serializeParam(
          _checkoutProducts,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static OrderProductsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderProductsStruct(
        checkoutProducts: deserializeStructParam(
          data['checkout_products'],
          ParamType.DataStruct,
          false,
          structBuilder: CheckoutProductStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrderProductsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderProductsStruct &&
        checkoutProducts == other.checkoutProducts;
  }

  @override
  int get hashCode => const ListEquality().hash([checkoutProducts]);
}

OrderProductsStruct createOrderProductsStruct({
  CheckoutProductStruct? checkoutProducts,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderProductsStruct(
      checkoutProducts: checkoutProducts ??
          (clearUnsetFields ? CheckoutProductStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderProductsStruct? updateOrderProductsStruct(
  OrderProductsStruct? orderProducts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderProducts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderProductsStructData(
  Map<String, dynamic> firestoreData,
  OrderProductsStruct? orderProducts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderProducts == null) {
    return;
  }
  if (orderProducts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderProducts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderProductsData =
      getOrderProductsFirestoreData(orderProducts, forFieldValue);
  final nestedData =
      orderProductsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderProducts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderProductsFirestoreData(
  OrderProductsStruct? orderProducts, [
  bool forFieldValue = false,
]) {
  if (orderProducts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderProducts.toMap());

  // Handle nested data for "checkout_products" field.
  addCheckoutProductStructData(
    firestoreData,
    orderProducts.hasCheckoutProducts() ? orderProducts.checkoutProducts : null,
    'checkout_products',
    forFieldValue,
  );

  // Add any Firestore field values
  orderProducts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderProductsListFirestoreData(
  List<OrderProductsStruct>? orderProductss,
) =>
    orderProductss
        ?.map((e) => getOrderProductsFirestoreData(e, true))
        .toList() ??
    [];
