import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_guestInfo')) {
        try {
          final serializedData = prefs.getString('ff_guestInfo') ?? '{}';
          _guestInfo =
              GuestStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _sum = 0.0;
  double get sum => _sum;
  set sum(double _value) {
    _sum = _value;
  }

  double _discountAmount = 0.0;
  double get discountAmount => _discountAmount;
  set discountAmount(double _value) {
    _discountAmount = _value;
  }

  double _subTotal = 0.0;
  double get subTotal => _subTotal;
  set subTotal(double _value) {
    _subTotal = _value;
  }

  List<CheckoutProductStruct> _checkoutCart = [];
  List<CheckoutProductStruct> get checkoutCart => _checkoutCart;
  set checkoutCart(List<CheckoutProductStruct> _value) {
    _checkoutCart = _value;
  }

  void addToCheckoutCart(CheckoutProductStruct _value) {
    _checkoutCart.add(_value);
  }

  void removeFromCheckoutCart(CheckoutProductStruct _value) {
    _checkoutCart.remove(_value);
  }

  void removeAtIndexFromCheckoutCart(int _index) {
    _checkoutCart.removeAt(_index);
  }

  void updateCheckoutCartAtIndex(
    int _index,
    CheckoutProductStruct Function(CheckoutProductStruct) updateFn,
  ) {
    _checkoutCart[_index] = updateFn(_checkoutCart[_index]);
  }

  void insertAtIndexInCheckoutCart(int _index, CheckoutProductStruct _value) {
    _checkoutCart.insert(_index, _value);
  }

  GuestStruct _guestInfo = GuestStruct.fromSerializableMap(jsonDecode('{}'));
  GuestStruct get guestInfo => _guestInfo;
  set guestInfo(GuestStruct _value) {
    _guestInfo = _value;
    prefs.setString('ff_guestInfo', _value.serialize());
  }

  void updateGuestInfoStruct(Function(GuestStruct) updateFn) {
    updateFn(_guestInfo);
    prefs.setString('ff_guestInfo', _guestInfo.serialize());
  }

  bool _phoneNoSent = false;
  bool get phoneNoSent => _phoneNoSent;
  set phoneNoSent(bool _value) {
    _phoneNoSent = _value;
  }

  List<DocumentReference> _searchResult = [];
  List<DocumentReference> get searchResult => _searchResult;
  set searchResult(List<DocumentReference> _value) {
    _searchResult = _value;
  }

  void addToSearchResult(DocumentReference _value) {
    _searchResult.add(_value);
  }

  void removeFromSearchResult(DocumentReference _value) {
    _searchResult.remove(_value);
  }

  void removeAtIndexFromSearchResult(int _index) {
    _searchResult.removeAt(_index);
  }

  void updateSearchResultAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _searchResult[_index] = updateFn(_searchResult[_index]);
  }

  void insertAtIndexInSearchResult(int _index, DocumentReference _value) {
    _searchResult.insert(_index, _value);
  }

  double _totalRevenue = 0.0;
  double get totalRevenue => _totalRevenue;
  set totalRevenue(double _value) {
    _totalRevenue = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
