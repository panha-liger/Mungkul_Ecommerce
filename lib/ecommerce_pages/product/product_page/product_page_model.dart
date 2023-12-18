import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/product_card/product_card_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_page_widget.dart' show ProductPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ProductPageModel extends FlutterFlowModel<ProductPageWidget> {
  ///  Local state fields for this page.

  bool isSelect = false;

  String? selectedCategory = '';

  List<ProductsRecord> filteredProdutList = [];
  void addToFilteredProdutList(ProductsRecord item) =>
      filteredProdutList.add(item);
  void removeFromFilteredProdutList(ProductsRecord item) =>
      filteredProdutList.remove(item);
  void removeAtIndexFromFilteredProdutList(int index) =>
      filteredProdutList.removeAt(index);
  void insertAtIndexInFilteredProdutList(int index, ProductsRecord item) =>
      filteredProdutList.insert(index, item);
  void updateFilteredProdutListAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      filteredProdutList[index] = updateFn(filteredProdutList[index]);

  int discountProductList = 0;

  List<ProductsRecord> tempProductList = [];
  void addToTempProductList(ProductsRecord item) => tempProductList.add(item);
  void removeFromTempProductList(ProductsRecord item) =>
      tempProductList.remove(item);
  void removeAtIndexFromTempProductList(int index) =>
      tempProductList.removeAt(index);
  void insertAtIndexInTempProductList(int index, ProductsRecord item) =>
      tempProductList.insert(index, item);
  void updateTempProductListAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      tempProductList[index] = updateFn(tempProductList[index]);

  bool isLoaded = true;

  bool isCategory = false;

  String categoryName = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in productPage widget.
  List<ProductsRecord>? initialList;
  List<ProductsRecord> simpleSearchResults1 = [];
  // Stores action output result for [Firestore Query - Query a collection] action in productPage widget.
  List<ProductsRecord>? isDiscountProductList;
  // Stores action output result for [Firestore Query - Query a collection] action in productPage widget.
  List<ProductsRecord>? defaultProductList;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProductsRecord> simpleSearchResults2 = [];
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Firestore Query - Query a collection] action in SwitchListTile widget.
  List<ProductsRecord>? discountProducts;
  // Stores action output result for [Firestore Query - Query a collection] action in SwitchListTile widget.
  List<ProductsRecord>? products;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductsRecord>? resultedListCopy2;
  // Model for footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
