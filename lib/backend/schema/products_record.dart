import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "about_item" field.
  String? _aboutItem;
  String get aboutItem => _aboutItem ?? '';
  bool hasAboutItem() => _aboutItem != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  bool hasDiscount() => _discount != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "preview_image" field.
  String? _previewImage;
  String get previewImage => _previewImage ?? '';
  bool hasPreviewImage() => _previewImage != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _aboutItem = snapshotData['about_item'] as String?;
    _status = snapshotData['status'] as String?;
    _discount = castToType<int>(snapshotData['discount']);
    _category = snapshotData['category'] as String?;
    _image = getDataList(snapshotData['image']);
    _id = snapshotData['id'] as String?;
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _previewImage = snapshotData['preview_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  String? description,
  String? aboutItem,
  String? status,
  int? discount,
  String? category,
  String? id,
  DocumentReference? productRef,
  double? price,
  DateTime? createdAt,
  String? previewImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'about_item': aboutItem,
      'status': status,
      'discount': discount,
      'category': category,
      'id': id,
      'product_ref': productRef,
      'price': price,
      'created_at': createdAt,
      'preview_image': previewImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.aboutItem == e2?.aboutItem &&
        e1?.status == e2?.status &&
        e1?.discount == e2?.discount &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.image, e2?.image) &&
        e1?.id == e2?.id &&
        e1?.productRef == e2?.productRef &&
        e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.previewImage == e2?.previewImage;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.aboutItem,
        e?.status,
        e?.discount,
        e?.category,
        e?.image,
        e?.id,
        e?.productRef,
        e?.price,
        e?.createdAt,
        e?.previewImage
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
