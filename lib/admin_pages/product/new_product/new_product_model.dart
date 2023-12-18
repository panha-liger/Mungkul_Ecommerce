import '/admin_components/web_nav/web_nav_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'new_product_widget.dart' show NewProductWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewProductModel extends FlutterFlowModel<NewProductWidget> {
  ///  Local state fields for this page.

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  int listIndex = 0;

  String previewImage = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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

  bool isDataUploading3 = false;
  List<FFUploadedFile> uploadedLocalFiles3 = [];
  List<String> uploadedFileUrls3 = [];

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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

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
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
