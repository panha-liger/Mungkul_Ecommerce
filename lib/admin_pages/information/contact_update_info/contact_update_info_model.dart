import '/admin_components/web_nav/web_nav_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'contact_update_info_widget.dart' show ContactUpdateInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ContactUpdateInfoModel extends FlutterFlowModel<ContactUpdateInfoWidget> {
  ///  Local state fields for this page.

  String? visionImage;

  String? processImage;

  String? approachImage = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressController;
  String? Function(BuildContext, String?)? adressControllerValidator;
  // State field(s) for fcebook widget.
  FocusNode? fcebookFocusNode;
  TextEditingController? fcebookController;
  String? Function(BuildContext, String?)? fcebookControllerValidator;
  // State field(s) for telegram widget.
  FocusNode? telegramFocusNode;
  TextEditingController? telegramController;
  String? Function(BuildContext, String?)? telegramControllerValidator;
  // State field(s) for vision widget.
  FocusNode? visionFocusNode;
  TextEditingController? visionController;
  String? Function(BuildContext, String?)? visionControllerValidator;
  // State field(s) for process widget.
  FocusNode? processFocusNode;
  TextEditingController? processController;
  String? Function(BuildContext, String?)? processControllerValidator;
  // State field(s) for approach widget.
  FocusNode? approachFocusNode;
  TextEditingController? approachController;
  String? Function(BuildContext, String?)? approachControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    webNavModel.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    adressFocusNode?.dispose();
    adressController?.dispose();

    fcebookFocusNode?.dispose();
    fcebookController?.dispose();

    telegramFocusNode?.dispose();
    telegramController?.dispose();

    visionFocusNode?.dispose();
    visionController?.dispose();

    processFocusNode?.dispose();
    processController?.dispose();

    approachFocusNode?.dispose();
    approachController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
