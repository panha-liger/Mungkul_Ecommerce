import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvertismentBannerCollectionRecord extends FirestoreRecord {
  AdvertismentBannerCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "ad_image" field.
  String? _adImage;
  String get adImage => _adImage ?? '';
  bool hasAdImage() => _adImage != null;

  void _initializeFields() {
    _productId = snapshotData['product_id'] as String?;
    _adImage = snapshotData['ad_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('advertismentBanner_collection');

  static Stream<AdvertismentBannerCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => AdvertismentBannerCollectionRecord.fromSnapshot(s));

  static Future<AdvertismentBannerCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdvertismentBannerCollectionRecord.fromSnapshot(s));

  static AdvertismentBannerCollectionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      AdvertismentBannerCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdvertismentBannerCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdvertismentBannerCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdvertismentBannerCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdvertismentBannerCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdvertismentBannerCollectionRecordData({
  String? productId,
  String? adImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_id': productId,
      'ad_image': adImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdvertismentBannerCollectionRecordDocumentEquality
    implements Equality<AdvertismentBannerCollectionRecord> {
  const AdvertismentBannerCollectionRecordDocumentEquality();

  @override
  bool equals(AdvertismentBannerCollectionRecord? e1,
      AdvertismentBannerCollectionRecord? e2) {
    return e1?.productId == e2?.productId && e1?.adImage == e2?.adImage;
  }

  @override
  int hash(AdvertismentBannerCollectionRecord? e) =>
      const ListEquality().hash([e?.productId, e?.adImage]);

  @override
  bool isValidKey(Object? o) => o is AdvertismentBannerCollectionRecord;
}
