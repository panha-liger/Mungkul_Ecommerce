import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_card_widget.dart' show ProductCardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCardModel extends FlutterFlowModel<ProductCardWidget> {
  ///  Local state fields for this component.

  ProductStruct? currentProduct;
  void updateCurrentProductStruct(Function(ProductStruct) updateFn) =>
      updateFn(currentProduct ??= ProductStruct());

  CheckoutProductStruct? checkoutProduct;
  void updateCheckoutProductStruct(Function(CheckoutProductStruct) updateFn) =>
      updateFn(checkoutProduct ??= CheckoutProductStruct());

  int itemIndex = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
