import '/admin_components/web_nav/web_nav_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'admin_dashboard_widget.dart' show AdminDashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AdminDashboardModel extends FlutterFlowModel<AdminDashboardWidget> {
  ///  Local state fields for this page.

  int listIndex = 0;

  List<BestSellingProductsStruct> bestSellingProducts = [];
  void addToBestSellingProducts(BestSellingProductsStruct item) =>
      bestSellingProducts.add(item);
  void removeFromBestSellingProducts(BestSellingProductsStruct item) =>
      bestSellingProducts.remove(item);
  void removeAtIndexFromBestSellingProducts(int index) =>
      bestSellingProducts.removeAt(index);
  void insertAtIndexInBestSellingProducts(
          int index, BestSellingProductsStruct item) =>
      bestSellingProducts.insert(index, item);
  void updateBestSellingProductsAtIndex(
          int index, Function(BestSellingProductsStruct) updateFn) =>
      bestSellingProducts[index] = updateFn(bestSellingProducts[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in AdminDashboard widget.
  List<OrderRecord>? orderDocs;
  // Model for webNav component.
  late WebNavModel webNavModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
