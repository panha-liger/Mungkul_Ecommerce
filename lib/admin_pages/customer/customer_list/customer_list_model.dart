import '/admin_components/web_nav/web_nav_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'customer_list_widget.dart' show CustomerListWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class CustomerListModel extends FlutterFlowModel<CustomerListWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> customerList = [];
  void addToCustomerList(UsersRecord item) => customerList.add(item);
  void removeFromCustomerList(UsersRecord item) => customerList.remove(item);
  void removeAtIndexFromCustomerList(int index) => customerList.removeAt(index);
  void insertAtIndexInCustomerList(int index, UsersRecord item) =>
      customerList.insert(index, item);
  void updateCustomerListAtIndex(int index, Function(UsersRecord) updateFn) =>
      customerList[index] = updateFn(customerList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Customer_List widget.
  List<UsersRecord>? userOutput;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for searchorder widget.
  FocusNode? searchorderFocusNode;
  TextEditingController? searchorderController;
  String? Function(BuildContext, String?)? searchorderControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in searchorder widget.
  List<UsersRecord>? searchOrderCopy;
  List<UsersRecord> simpleSearchResults1 = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? searchOrder;
  List<UsersRecord> simpleSearchResults2 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    searchorderFocusNode?.dispose();
    searchorderController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
