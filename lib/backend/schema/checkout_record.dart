import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckoutRecord extends FirestoreRecord {
  CheckoutRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "checkout_id" field.
  String? _checkoutId;
  String get checkoutId => _checkoutId ?? '';
  bool hasCheckoutId() => _checkoutId != null;

  // "product_list" field.
  List<ProductStruct>? _productList;
  List<ProductStruct> get productList => _productList ?? const [];
  bool hasProductList() => _productList != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "sub_total" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "guest_checkout" field.
  bool? _guestCheckout;
  bool get guestCheckout => _guestCheckout ?? false;
  bool hasGuestCheckout() => _guestCheckout != null;

  // "guest_info" field.
  GuestStruct? _guestInfo;
  GuestStruct get guestInfo => _guestInfo ?? GuestStruct();
  bool hasGuestInfo() => _guestInfo != null;

  // "additional_info" field.
  String? _additionalInfo;
  String get additionalInfo => _additionalInfo ?? '';
  bool hasAdditionalInfo() => _additionalInfo != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _currency = snapshotData['currency'] as String?;
    _discount = castToType<double>(snapshotData['discount']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _checkoutId = snapshotData['checkout_id'] as String?;
    _productList = getStructList(
      snapshotData['product_list'],
      ProductStruct.fromMap,
    );
    _address = snapshotData['address'] as String?;
    _total = castToType<double>(snapshotData['total']);
    _subTotal = castToType<double>(snapshotData['sub_total']);
    _guestCheckout = snapshotData['guest_checkout'] as bool?;
    _guestInfo = GuestStruct.maybeFromMap(snapshotData['guest_info']);
    _additionalInfo = snapshotData['additional_info'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checkout');

  static Stream<CheckoutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckoutRecord.fromSnapshot(s));

  static Future<CheckoutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CheckoutRecord.fromSnapshot(s));

  static CheckoutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckoutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckoutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckoutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckoutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckoutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckoutRecordData({
  String? currency,
  double? discount,
  String? phoneNumber,
  String? checkoutId,
  String? address,
  double? total,
  double? subTotal,
  bool? guestCheckout,
  GuestStruct? guestInfo,
  String? additionalInfo,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'currency': currency,
      'discount': discount,
      'phone_number': phoneNumber,
      'checkout_id': checkoutId,
      'address': address,
      'total': total,
      'sub_total': subTotal,
      'guest_checkout': guestCheckout,
      'guest_info': GuestStruct().toMap(),
      'additional_info': additionalInfo,
      'user_ref': userRef,
    }.withoutNulls,
  );

  // Handle nested data for "guest_info" field.
  addGuestStructData(firestoreData, guestInfo, 'guest_info');

  return firestoreData;
}

class CheckoutRecordDocumentEquality implements Equality<CheckoutRecord> {
  const CheckoutRecordDocumentEquality();

  @override
  bool equals(CheckoutRecord? e1, CheckoutRecord? e2) {
    const listEquality = ListEquality();
    return e1?.currency == e2?.currency &&
        e1?.discount == e2?.discount &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.checkoutId == e2?.checkoutId &&
        listEquality.equals(e1?.productList, e2?.productList) &&
        e1?.address == e2?.address &&
        e1?.total == e2?.total &&
        e1?.subTotal == e2?.subTotal &&
        e1?.guestCheckout == e2?.guestCheckout &&
        e1?.guestInfo == e2?.guestInfo &&
        e1?.additionalInfo == e2?.additionalInfo &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(CheckoutRecord? e) => const ListEquality().hash([
        e?.currency,
        e?.discount,
        e?.phoneNumber,
        e?.checkoutId,
        e?.productList,
        e?.address,
        e?.total,
        e?.subTotal,
        e?.guestCheckout,
        e?.guestInfo,
        e?.additionalInfo,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CheckoutRecord;
}
