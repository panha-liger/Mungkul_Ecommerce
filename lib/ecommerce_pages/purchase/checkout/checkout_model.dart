import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/function/sign_up_popup/sign_up_popup_widget.dart';
import '/function/successful_place_order/successful_place_order_widget.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  Local state fields for this page.

  bool freeDelivery = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for hearder component.
  late HearderModel hearderModel;
  // State field(s) for Fullnamelogin widget.
  FocusNode? fullnameloginFocusNode;
  TextEditingController? fullnameloginController;
  String? Function(BuildContext, String?)? fullnameloginControllerValidator;
  // State field(s) for Addresslogin widget.
  FocusNode? addressloginFocusNode;
  TextEditingController? addressloginController;
  String? Function(BuildContext, String?)? addressloginControllerValidator;
  // State field(s) for Locationlogin widget.
  String? locationloginValue;
  FormFieldController<String>? locationloginValueController;
  // State field(s) for PhoneNumberlogin widget.
  FocusNode? phoneNumberloginFocusNode;
  TextEditingController? phoneNumberloginController;
  String? Function(BuildContext, String?)? phoneNumberloginControllerValidator;
  // State field(s) for Fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameController;
  String? Function(BuildContext, String?)? fullnameControllerValidator;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  // State field(s) for Location widget.
  String? locationValue;
  FormFieldController<String>? locationValueController;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for CheckboxSave widget.
  bool? checkboxSaveValue;
  // State field(s) for CheckboxAsguest widget.
  bool? checkboxAsguestValue;
  // State field(s) for AdditionalDetail widget.
  FocusNode? additionalDetailFocusNode;
  TextEditingController? additionalDetailController;
  String? Function(BuildContext, String?)? additionalDetailControllerValidator;
  // State field(s) for ABA widget.
  bool? abaValue;
  // State field(s) for OnDelivery widget.
  bool? onDeliveryValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrderRecord? orderPlaced;
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
    fullnameloginFocusNode?.dispose();
    fullnameloginController?.dispose();

    addressloginFocusNode?.dispose();
    addressloginController?.dispose();

    phoneNumberloginFocusNode?.dispose();
    phoneNumberloginController?.dispose();

    fullnameFocusNode?.dispose();
    fullnameController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    additionalDetailFocusNode?.dispose();
    additionalDetailController?.dispose();

    footerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
