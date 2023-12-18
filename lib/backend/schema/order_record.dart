import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
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

  // "checkout_products" field.
  List<CheckoutProductStruct>? _checkoutProducts;
  List<CheckoutProductStruct> get checkoutProducts =>
      _checkoutProducts ?? const [];
  bool hasCheckoutProducts() => _checkoutProducts != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "is_guest" field.
  bool? _isGuest;
  bool get isGuest => _isGuest ?? false;
  bool hasIsGuest() => _isGuest != null;

  // "delivery_option" field.
  String? _deliveryOption;
  String get deliveryOption => _deliveryOption ?? '';
  bool hasDeliveryOption() => _deliveryOption != null;

  void _initializeFields() {
    _currency = snapshotData['currency'] as String?;
    _discount = castToType<double>(snapshotData['discount']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _address = snapshotData['address'] as String?;
    _total = castToType<double>(snapshotData['total']);
    _subTotal = castToType<double>(snapshotData['sub_total']);
    _guestCheckout = snapshotData['guest_checkout'] as bool?;
    _guestInfo = GuestStruct.maybeFromMap(snapshotData['guest_info']);
    _additionalInfo = snapshotData['additional_info'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _checkoutProducts = getStructList(
      snapshotData['checkout_products'],
      CheckoutProductStruct.fromMap,
    );
    _createdAt = snapshotData['created_at'] as DateTime?;
    _orderId = snapshotData['order_id'] as String?;
    _paymentMethod = snapshotData['payment_method'] as String?;
    _status = snapshotData['status'] as String?;
    _location = snapshotData['location'] as String?;
    _isGuest = snapshotData['is_guest'] as bool?;
    _deliveryOption = snapshotData['delivery_option'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  String? currency,
  double? discount,
  String? phoneNumber,
  String? address,
  double? total,
  double? subTotal,
  bool? guestCheckout,
  GuestStruct? guestInfo,
  String? additionalInfo,
  DocumentReference? userRef,
  DateTime? createdAt,
  String? orderId,
  String? paymentMethod,
  String? status,
  String? location,
  bool? isGuest,
  String? deliveryOption,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'currency': currency,
      'discount': discount,
      'phone_number': phoneNumber,
      'address': address,
      'total': total,
      'sub_total': subTotal,
      'guest_checkout': guestCheckout,
      'guest_info': GuestStruct().toMap(),
      'additional_info': additionalInfo,
      'user_ref': userRef,
      'created_at': createdAt,
      'order_id': orderId,
      'payment_method': paymentMethod,
      'status': status,
      'location': location,
      'is_guest': isGuest,
      'delivery_option': deliveryOption,
    }.withoutNulls,
  );

  // Handle nested data for "guest_info" field.
  addGuestStructData(firestoreData, guestInfo, 'guest_info');

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.currency == e2?.currency &&
        e1?.discount == e2?.discount &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.address == e2?.address &&
        e1?.total == e2?.total &&
        e1?.subTotal == e2?.subTotal &&
        e1?.guestCheckout == e2?.guestCheckout &&
        e1?.guestInfo == e2?.guestInfo &&
        e1?.additionalInfo == e2?.additionalInfo &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.checkoutProducts, e2?.checkoutProducts) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.orderId == e2?.orderId &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.status == e2?.status &&
        e1?.location == e2?.location &&
        e1?.isGuest == e2?.isGuest &&
        e1?.deliveryOption == e2?.deliveryOption;
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.currency,
        e?.discount,
        e?.phoneNumber,
        e?.address,
        e?.total,
        e?.subTotal,
        e?.guestCheckout,
        e?.guestInfo,
        e?.additionalInfo,
        e?.userRef,
        e?.checkoutProducts,
        e?.createdAt,
        e?.orderId,
        e?.paymentMethod,
        e?.status,
        e?.location,
        e?.isGuest,
        e?.deliveryOption
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
