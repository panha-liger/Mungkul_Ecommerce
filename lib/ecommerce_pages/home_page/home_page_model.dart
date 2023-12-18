import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import '/user_components/product_card/product_card_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<ProductsRecord> allProductsList = [];
  void addToAllProductsList(ProductsRecord item) => allProductsList.add(item);
  void removeFromAllProductsList(ProductsRecord item) =>
      allProductsList.remove(item);
  void removeAtIndexFromAllProductsList(int index) =>
      allProductsList.removeAt(index);
  void insertAtIndexInAllProductsList(int index, ProductsRecord item) =>
      allProductsList.insert(index, item);
  void updateAllProductsListAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      allProductsList[index] = updateFn(allProductsList[index]);

  List<ProductsRecord> listShownProductsList = [];
  void addToListShownProductsList(ProductsRecord item) =>
      listShownProductsList.add(item);
  void removeFromListShownProductsList(ProductsRecord item) =>
      listShownProductsList.remove(item);
  void removeAtIndexFromListShownProductsList(int index) =>
      listShownProductsList.removeAt(index);
  void insertAtIndexInListShownProductsList(int index, ProductsRecord item) =>
      listShownProductsList.insert(index, item);
  void updateListShownProductsListAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      listShownProductsList[index] = updateFn(listShownProductsList[index]);

  int startIndex = 0;

  int endIndex = 0;

  int pageIndex = 1;

  int prevStartIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<ProductsRecord>? allProducts;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<OrderRecord>? orderDocsList;
  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for footer component.
  late FooterModel footerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    hearderModel = createModel(context, () => HearderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  void dispose() {
    unfocusNode.dispose();
    hearderModel.dispose();
    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
