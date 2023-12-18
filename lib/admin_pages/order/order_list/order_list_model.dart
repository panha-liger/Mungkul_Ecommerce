import '/admin_components/web_nav/web_nav_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'order_list_widget.dart' show OrderListWidget;
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

class OrderListModel extends FlutterFlowModel<OrderListWidget> {
  ///  Local state fields for this page.

  List<OrderRecord> orderlist = [];
  void addToOrderlist(OrderRecord item) => orderlist.add(item);
  void removeFromOrderlist(OrderRecord item) => orderlist.remove(item);
  void removeAtIndexFromOrderlist(int index) => orderlist.removeAt(index);
  void insertAtIndexInOrderlist(int index, OrderRecord item) =>
      orderlist.insert(index, item);
  void updateOrderlistAtIndex(int index, Function(OrderRecord) updateFn) =>
      orderlist[index] = updateFn(orderlist[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Order_list widget.
  List<OrderRecord>? orderLoad;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for searchorder widget.
  FocusNode? searchorderFocusNode;
  TextEditingController? searchorderController;
  String? Function(BuildContext, String?)? searchorderControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in searchorder widget.
  List<OrderRecord>? searchOrderCopy;
  List<OrderRecord> simpleSearchResults1 = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<OrderRecord>? searchOrder;
  List<OrderRecord> simpleSearchResults2 = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<OrderRecord>? statusResult;

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
