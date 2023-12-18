import '/admin_components/web_nav/web_nav_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_product_widget.dart' show EditProductWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProductModel extends FlutterFlowModel<EditProductWidget> {
  ///  Local state fields for this page.

  List<String> editImageList = [];
  void addToEditImageList(String item) => editImageList.add(item);
  void removeFromEditImageList(String item) => editImageList.remove(item);
  void removeAtIndexFromEditImageList(int index) =>
      editImageList.removeAt(index);
  void insertAtIndexInEditImageList(int index, String item) =>
      editImageList.insert(index, item);
  void updateEditImageListAtIndex(int index, Function(String) updateFn) =>
      editImageList[index] = updateFn(editImageList[index]);

  ProductStruct? queriedProduct;
  void updateQueriedProductStruct(Function(ProductStruct) updateFn) =>
      updateFn(queriedProduct ??= ProductStruct());

  String? previewImg;

  int? imageIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Edit_product widget.
  ProductsRecord? productDocOutput;
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for productsName widget.
  FocusNode? productsNameFocusNode;
  TextEditingController? productsNameController;
  String? Function(BuildContext, String?)? productsNameControllerValidator;
  // State field(s) for Descriptiom widget.
  FocusNode? descriptiomFocusNode;
  TextEditingController? descriptiomController;
  String? Function(BuildContext, String?)? descriptiomControllerValidator;
  // State field(s) for Aboutitem widget.
  FocusNode? aboutitemFocusNode;
  TextEditingController? aboutitemController;
  String? Function(BuildContext, String?)? aboutitemControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // State field(s) for basePrice widget.
  FocusNode? basePriceFocusNode;
  TextEditingController? basePriceController;
  String? Function(BuildContext, String?)? basePriceControllerValidator;
  // State field(s) for Status widget.
  String? statusValue;
  FormFieldController<String>? statusValueController;
  // State field(s) for percentage widget.
  FocusNode? percentageFocusNode;
  TextEditingController? percentageController;
  String? Function(BuildContext, String?)? percentageControllerValidator;
  // State field(s) for category widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryController;
  String? Function(BuildContext, String?)? categoryControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    productsNameFocusNode?.dispose();
    productsNameController?.dispose();

    descriptiomFocusNode?.dispose();
    descriptiomController?.dispose();

    aboutitemFocusNode?.dispose();
    aboutitemController?.dispose();

    basePriceFocusNode?.dispose();
    basePriceController?.dispose();

    percentageFocusNode?.dispose();
    percentageController?.dispose();

    categoryFocusNode?.dispose();
    categoryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
