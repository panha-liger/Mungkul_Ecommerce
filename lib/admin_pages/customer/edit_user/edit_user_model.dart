import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode1;
  TextEditingController? fullnameController1;
  String? Function(BuildContext, String?)? fullnameController1Validator;
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode2;
  TextEditingController? fullnameController2;
  String? Function(BuildContext, String?)? fullnameController2Validator;
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode3;
  TextEditingController? fullnameController3;
  String? Function(BuildContext, String?)? fullnameController3Validator;
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode4;
  TextEditingController? fullnameController4;
  String? Function(BuildContext, String?)? fullnameController4Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    fullnameFocusNode1?.dispose();
    fullnameController1?.dispose();

    fullnameFocusNode2?.dispose();
    fullnameController2?.dispose();

    fullnameFocusNode3?.dispose();
    fullnameController3?.dispose();

    fullnameFocusNode4?.dispose();
    fullnameController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
