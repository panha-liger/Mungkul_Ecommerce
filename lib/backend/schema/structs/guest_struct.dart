// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestStruct extends FFFirebaseStruct {
  GuestStruct({
    String? name,
    String? adress,
    String? location,
    String? phoneNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _adress = adress,
        _location = location,
        _phoneNumber = phoneNumber,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  set adress(String? val) => _adress = val;
  bool hasAdress() => _adress != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  static GuestStruct fromMap(Map<String, dynamic> data) => GuestStruct(
        name: data['name'] as String?,
        adress: data['adress'] as String?,
        location: data['location'] as String?,
        phoneNumber: data['phone_number'] as String?,
      );

  static GuestStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GuestStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'adress': _adress,
        'location': _location,
        'phone_number': _phoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'adress': serializeParam(
          _adress,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static GuestStruct fromSerializableMap(Map<String, dynamic> data) =>
      GuestStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        adress: deserializeParam(
          data['adress'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GuestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GuestStruct &&
        name == other.name &&
        adress == other.adress &&
        location == other.location &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, adress, location, phoneNumber]);
}

GuestStruct createGuestStruct({
  String? name,
  String? adress,
  String? location,
  String? phoneNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GuestStruct(
      name: name,
      adress: adress,
      location: location,
      phoneNumber: phoneNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GuestStruct? updateGuestStruct(
  GuestStruct? guest, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    guest
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGuestStructData(
  Map<String, dynamic> firestoreData,
  GuestStruct? guest,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (guest == null) {
    return;
  }
  if (guest.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && guest.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final guestData = getGuestFirestoreData(guest, forFieldValue);
  final nestedData = guestData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = guest.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGuestFirestoreData(
  GuestStruct? guest, [
  bool forFieldValue = false,
]) {
  if (guest == null) {
    return {};
  }
  final firestoreData = mapToFirestore(guest.toMap());

  // Add any Firestore field values
  guest.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGuestListFirestoreData(
  List<GuestStruct>? guests,
) =>
    guests?.map((e) => getGuestFirestoreData(e, true)).toList() ?? [];
