import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminInfoRecord extends FirestoreRecord {
  AdminInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "PhoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "ourVision" field.
  String? _ourVision;
  String get ourVision => _ourVision ?? '';
  bool hasOurVision() => _ourVision != null;

  // "ourProcess" field.
  String? _ourProcess;
  String get ourProcess => _ourProcess ?? '';
  bool hasOurProcess() => _ourProcess != null;

  // "ourApproach" field.
  String? _ourApproach;
  String get ourApproach => _ourApproach ?? '';
  bool hasOurApproach() => _ourApproach != null;

  // "visionImage" field.
  String? _visionImage;
  String get visionImage => _visionImage ?? '';
  bool hasVisionImage() => _visionImage != null;

  // "processImage" field.
  String? _processImage;
  String get processImage => _processImage ?? '';
  bool hasProcessImage() => _processImage != null;

  // "approachImage" field.
  String? _approachImage;
  String get approachImage => _approachImage ?? '';
  bool hasApproachImage() => _approachImage != null;

  // "FaceBook_link" field.
  String? _faceBookLink;
  String get faceBookLink => _faceBookLink ?? '';
  bool hasFaceBookLink() => _faceBookLink != null;

  // "Telegram_link" field.
  String? _telegramLink;
  String get telegramLink => _telegramLink ?? '';
  bool hasTelegramLink() => _telegramLink != null;

  void _initializeFields() {
    _phoneNumber = snapshotData['PhoneNumber'] as String?;
    _email = snapshotData['email'] as String?;
    _adress = snapshotData['adress'] as String?;
    _ourVision = snapshotData['ourVision'] as String?;
    _ourProcess = snapshotData['ourProcess'] as String?;
    _ourApproach = snapshotData['ourApproach'] as String?;
    _visionImage = snapshotData['visionImage'] as String?;
    _processImage = snapshotData['processImage'] as String?;
    _approachImage = snapshotData['approachImage'] as String?;
    _faceBookLink = snapshotData['FaceBook_link'] as String?;
    _telegramLink = snapshotData['Telegram_link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('adminInfo');

  static Stream<AdminInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminInfoRecord.fromSnapshot(s));

  static Future<AdminInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminInfoRecord.fromSnapshot(s));

  static AdminInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminInfoRecordData({
  String? phoneNumber,
  String? email,
  String? adress,
  String? ourVision,
  String? ourProcess,
  String? ourApproach,
  String? visionImage,
  String? processImage,
  String? approachImage,
  String? faceBookLink,
  String? telegramLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'PhoneNumber': phoneNumber,
      'email': email,
      'adress': adress,
      'ourVision': ourVision,
      'ourProcess': ourProcess,
      'ourApproach': ourApproach,
      'visionImage': visionImage,
      'processImage': processImage,
      'approachImage': approachImage,
      'FaceBook_link': faceBookLink,
      'Telegram_link': telegramLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminInfoRecordDocumentEquality implements Equality<AdminInfoRecord> {
  const AdminInfoRecordDocumentEquality();

  @override
  bool equals(AdminInfoRecord? e1, AdminInfoRecord? e2) {
    return e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email &&
        e1?.adress == e2?.adress &&
        e1?.ourVision == e2?.ourVision &&
        e1?.ourProcess == e2?.ourProcess &&
        e1?.ourApproach == e2?.ourApproach &&
        e1?.visionImage == e2?.visionImage &&
        e1?.processImage == e2?.processImage &&
        e1?.approachImage == e2?.approachImage &&
        e1?.faceBookLink == e2?.faceBookLink &&
        e1?.telegramLink == e2?.telegramLink;
  }

  @override
  int hash(AdminInfoRecord? e) => const ListEquality().hash([
        e?.phoneNumber,
        e?.email,
        e?.adress,
        e?.ourVision,
        e?.ourProcess,
        e?.ourApproach,
        e?.visionImage,
        e?.processImage,
        e?.approachImage,
        e?.faceBookLink,
        e?.telegramLink
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminInfoRecord;
}
