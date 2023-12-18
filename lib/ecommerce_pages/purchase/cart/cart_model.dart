import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  bool cartEmptied = false;

  int itemIndex = 0;

  List<ProductStruct> productList = [];
  void addToProductList(ProductStruct item) => productList.add(item);
  void removeFromProductList(ProductStruct item) => productList.remove(item);
  void removeAtIndexFromProductList(int index) => productList.removeAt(index);
  void insertAtIndexInProductList(int index, ProductStruct item) =>
      productList.insert(index, item);
  void updateProductListAtIndex(int index, Function(ProductStruct) updateFn) =>
      productList[index] = updateFn(productList[index]);

  int productListIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for Checkbox_today widget.
  bool? checkboxTodayValue;
  // State field(s) for checkbox_instore widget.
  bool? checkboxInstoreValue;
  // Model for footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hearderModel = createModel(context, () => HearderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    hearderModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
