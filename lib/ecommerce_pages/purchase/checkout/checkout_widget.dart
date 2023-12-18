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
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({
    Key? key,
    this.deliveryOption,
    bool? isGetinplace,
  })  : this.isGetinplace = isGetinplace ?? false,
        super(key: key);

  final String? deliveryOption;
  final bool isGetinplace;

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget>
    with TickerProviderStateMixin {
  late CheckoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());

    _model.fullnameloginController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.fullnameloginFocusNode ??= FocusNode();

    _model.addressloginController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.adress, ''));
    _model.addressloginFocusNode ??= FocusNode();

    _model.phoneNumberloginController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.phoneNumberloginFocusNode ??= FocusNode();

    _model.fullnameController ??= TextEditingController(
        text: loggedIn == true
            ? currentUserDisplayName
            : FFAppState().guestInfo.name);
    _model.fullnameFocusNode ??= FocusNode();

    _model.addressController ??=
        TextEditingController(text: FFAppState().guestInfo.adress);
    _model.addressFocusNode ??= FocusNode();

    _model.phoneNumberController ??=
        TextEditingController(text: FFAppState().guestInfo.phoneNumber);
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.additionalDetailController ??= TextEditingController();
    _model.additionalDetailFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.hearderModel,
                  updateCallback: () => setState(() {}),
                  child: HearderWidget(),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: BoxConstraints(
                    maxHeight: 800.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ux03kavx' /* Billing Detail */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          fontFamily: 'Kantumruy Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Builder(
                                    builder: (context) {
                                      if (loggedIn == true) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 40.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7exscl0j' /* Full Name */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        TextFormField(
                                                      controller: _model
                                                          .fullnameloginController,
                                                      focusNode: _model
                                                          .fullnameloginFocusNode,
                                                      autofocus: true,
                                                      readOnly:
                                                          loggedIn == true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .fullnameloginControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  if (widget.isGetinplace ==
                                                      false)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'prjpce88' /* Address */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Kantumruy Pro',
                                                              fontSize: 18.0,
                                                            ),
                                                      ),
                                                    ),
                                                  if (widget.isGetinplace ==
                                                      false)
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          TextFormField(
                                                        controller: _model
                                                            .addressloginController,
                                                        focusNode: _model
                                                            .addressloginFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge,
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent4,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .addressloginControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'bymo6m5h' /* Town/City */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .locationloginValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'kms8mqh4' /* Phnom Penh */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'wfxrb9e3' /* Battambang */,
                                                      )
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .locationloginValue =
                                                          val);
                                                      if (_model.freeDelivery ==
                                                          true) {
                                                        if (_model
                                                                .locationloginValue ==
                                                            'Phnom Penh') {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                false;
                                                          });
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState().sum =
                                                                FFAppState()
                                                                        .sum +
                                                                    1.0;
                                                          });
                                                        }

                                                        return;
                                                      } else {
                                                        if (_model
                                                                .locationloginValue ==
                                                            'Phnom Penh') {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                true;
                                                          });
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState().sum =
                                                                FFAppState()
                                                                        .sum +
                                                                    -1.0;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                false;
                                                          });
                                                        }

                                                        return;
                                                      }
                                                    },
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    searchHintTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium,
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'bhcwtz5x' /* Please select city */,
                                                    ),
                                                    searchHintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'yhvo6upd' /* Search for a city */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    borderWidth: 2.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: true,
                                                    isMultiSelect: false,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9feuyv17' /* Phone Number */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        TextFormField(
                                                      controller: _model
                                                          .phoneNumberloginController,
                                                      focusNode: _model
                                                          .phoneNumberloginFocusNode,
                                                      autofocus: true,
                                                      readOnly:
                                                          loggedIn == true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      validator: _model
                                                          .phoneNumberloginControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 40.0, 0.0, 0.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'o09dkph3' /* Full Name */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        TextFormField(
                                                      controller: _model
                                                          .fullnameController,
                                                      focusNode: _model
                                                          .fullnameFocusNode,
                                                      autofocus: true,
                                                      readOnly:
                                                          loggedIn == true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent4,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                color: Color(
                                                                    0xFF2E00FF),
                                                              ),
                                                      validator: _model
                                                          .fullnameControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ic8ov23c' /* Address */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: _model
                                                        .addressController,
                                                    focusNode:
                                                        _model.addressFocusNode,
                                                    autofocus: true,
                                                    autofillHints: [
                                                      AutofillHints.addressState
                                                    ],
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    validator: _model
                                                        .addressControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'uql0ixt4' /* Town/City */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .locationValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'j21o1pda' /* Phnom Penh */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zf65ols4' /* Battambang */,
                                                      )
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                          .locationValue = val);
                                                      if (_model.freeDelivery ==
                                                          true) {
                                                        if (_model
                                                                .locationValue ==
                                                            'Phnom Penh') {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                true;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                false;
                                                          });
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState().sum =
                                                                FFAppState()
                                                                        .sum +
                                                                    1.0;
                                                          });
                                                        }

                                                        return;
                                                      } else {
                                                        if (_model
                                                                .locationValue ==
                                                            'Phnom Penh') {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                true;
                                                          });
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState().sum =
                                                                FFAppState()
                                                                        .sum +
                                                                    -1.0;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _model.freeDelivery =
                                                                false;
                                                          });
                                                        }

                                                        return;
                                                      }
                                                    },
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    searchHintTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium,
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'e7g2ijxz' /* Please select city */,
                                                    ),
                                                    searchHintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'qy4vaird' /* Search for a city */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    borderWidth: 2.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: true,
                                                    isMultiSelect: false,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'hodwohdj' /* Phone Number */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kantumruy Pro',
                                                                fontSize: 18.0,
                                                              ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: _model
                                                        .phoneNumberController,
                                                    focusNode: _model
                                                        .phoneNumberFocusNode,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    validator: _model
                                                        .phoneNumberControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                      .checkboxSaveValue ??=
                                                                  false,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxSaveValue =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .updateGuestInfoStruct(
                                                                      (e) => e
                                                                        ..name = _model
                                                                            .fullnameController
                                                                            .text
                                                                        ..adress = _model
                                                                            .addressController
                                                                            .text
                                                                        ..location =
                                                                            _model.locationValue
                                                                        ..phoneNumber = _model
                                                                            .phoneNumberController
                                                                            .text,
                                                                    );
                                                                  });
                                                                }
                                                              },
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'n3tme922' /* Save this information for fast... */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                      .checkboxAsguestValue ??=
                                                                  false,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxAsguestValue =
                                                                        newValue!);
                                                              },
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              checkColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                            ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'acx1c4g7' /*  check-out as Guest */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '3z95pjg4' /* Additional Detail */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Kantumruy Pro',
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _model.additionalDetailController,
                                  focusNode: _model.additionalDetailFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent4,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLines: 3,
                                  validator: _model
                                      .additionalDetailControllerValidator
                                      .asValidator(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 30.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 738.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 430.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 24.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 215.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final cartItems = FFAppState()
                                                  .checkoutCart
                                                  .toList();
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      cartItems.length,
                                                      (cartItemsIndex) {
                                                    final cartItemsItem =
                                                        cartItems[
                                                            cartItemsIndex];
                                                    return Visibility(
                                                      visible: cartItemsItem
                                                              .quantity >=
                                                          1,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 0.0,
                                                                color: Color(
                                                                    0xFFE0E3E7),
                                                                offset: Offset(
                                                                    0.0, 1.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.0,
                                                                              1.0,
                                                                              1.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            child:
                                                                                Image.network(
                                                                              cartItemsItem.product.image,
                                                                              width: 222.0,
                                                                              height: 96.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                4.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  cartItemsItem.product.name,
                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Kantumruy Pro',
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 2.0),
                                                                                  child: AutoSizeText(
                                                                                    cartItemsItem.product.description.maybeHandleOverflow(maxChars: 100),
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Kantumruy Pro',
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().sum = FFAppState().sum + -cartItemsItem.product.price * cartItemsItem.quantity;
                                                                                              });
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().subTotal = FFAppState().subTotal + -cartItemsItem.product.basePrice * cartItemsItem.quantity;
                                                                                              });
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().discountAmount = FFAppState().discountAmount + -(cartItemsItem.product.basePrice - cartItemsItem.product.price) * cartItemsItem.quantity;
                                                                                              });
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().updateCheckoutCartAtIndex(
                                                                                                  cartItemsIndex,
                                                                                                  (e) => e..quantity = null,
                                                                                                );
                                                                                              });
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().removeFromCheckoutCart(cartItemsItem);
                                                                                              });
                                                                                              if (FFAppState().checkoutCart.length <= 0) {
                                                                                                setState(() {});
                                                                                              } else {
                                                                                                return;
                                                                                              }
                                                                                            },
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.delete_outline,
                                                                                                  color: Color(0xFFFF5963),
                                                                                                  size: 30.0,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 16.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'hwszcnn9' /* Remove */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          fontFamily: 'Kantumruy Pro',
                                                                                                          fontSize: 13.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 140.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(9.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).accent2,
                                                                                              ),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      if (cartItemsItem.quantity > 1) {
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().sum = FFAppState().sum + -cartItemsItem.product.price;
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().subTotal = FFAppState().subTotal + -cartItemsItem.product.basePrice;
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().discountAmount = FFAppState().discountAmount + -cartItemsItem.product.basePrice * cartItemsItem.product.discount / 100;
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().updateCheckoutCartAtIndex(
                                                                                                            cartItemsIndex,
                                                                                                            (e) => e
                                                                                                              ..incrementQuantity(-1)
                                                                                                              ..incrementTotalPrice(-cartItemsItem.product.price),
                                                                                                          );
                                                                                                        });
                                                                                                        return;
                                                                                                      } else {
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().sum = FFAppState().sum + -cartItemsItem.product.price;
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().subTotal = FFAppState().subTotal + -cartItemsItem.product.basePrice;
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().discountAmount = FFAppState().discountAmount + -cartItemsItem.product.basePrice * cartItemsItem.product.discount / 100;
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().updateCheckoutCartAtIndex(
                                                                                                            cartItemsIndex,
                                                                                                            (e) => e..quantity = null,
                                                                                                          );
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().removeFromCheckoutCart(cartItemsItem);
                                                                                                        });
                                                                                                      }
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 36.0,
                                                                                                      height: 90.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                        shape: BoxShape.rectangle,
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: FaIcon(
                                                                                                          FontAwesomeIcons.minus,
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    cartItemsItem.quantity.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          fontFamily: 'Kantumruy Pro',
                                                                                                          fontSize: 18.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      FFAppState().update(() {
                                                                                                        FFAppState().updateCheckoutCartAtIndex(
                                                                                                          cartItemsIndex,
                                                                                                          (e) => e
                                                                                                            ..incrementQuantity(1)
                                                                                                            ..incrementTotalPrice(cartItemsItem.product.price),
                                                                                                        );
                                                                                                      });
                                                                                                      FFAppState().update(() {
                                                                                                        FFAppState().sum = FFAppState().sum + cartItemsItem.product.price;
                                                                                                        FFAppState().discountAmount = FFAppState().discountAmount + cartItemsItem.product.basePrice * cartItemsItem.product.discount / 100;
                                                                                                        FFAppState().subTotal = FFAppState().subTotal + cartItemsItem.product.basePrice;
                                                                                                      });
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 36.0,
                                                                                                      height: 90.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(9.0),
                                                                                                      ),
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: FaIcon(
                                                                                                          FontAwesomeIcons.plus,
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              formatNumber(
                                                                                cartItemsItem.totalPrice,
                                                                                formatType: FormatType.custom,
                                                                                currency: '\$',
                                                                                format: '0.00',
                                                                                locale: 'en_US',
                                                                              ),
                                                                              textAlign: TextAlign.end,
                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Kantumruy Pro',
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Divider(
                                          height: 32.0,
                                          thickness: 2.0,
                                          color: Color(0xFFE0E3E7),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 12.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qzta9j10' /* Price Breakdown */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            'Kantumruy Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '5ebrx26z' /* Subtotal */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      FFAppState().subTotal,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: '\$',
                                                      format: '0.00',
                                                      locale: 'en_US',
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'hujefqei' /* Discount */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      FFAppState()
                                                          .discountAmount,
                                                      formatType:
                                                          FormatType.custom,
                                                      currency: '\$',
                                                      format: '0.00',
                                                      locale: 'en_US',
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'u46knt37' /* Delivery Fee */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Text(
                                                    _model.freeDelivery == true
                                                        ? 'Free'
                                                        : '\$1.00',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0bkjys6y' /* Total */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 36.0,
                                                          icon: Icon(
                                                            Icons.info_outlined,
                                                            color: Color(
                                                                0xFF57636C),
                                                            size: 18.0,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      formatNumber(
                                                        FFAppState().sum,
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: '\$',
                                                        format: '0.00',
                                                        locale: '',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 36.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                      .onDeliveryValue ??= true,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.onDeliveryValue =
                                                            newValue!);
                                                    if (newValue!) {
                                                      setState(() {
                                                        _model.abaValue = false;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _model.abaValue = true;
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'hyj9l3ac' /* Cash On Delivery */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    visualDensity:
                                                        VisualDensity.compact,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                                child: Checkbox(
                                                  value: _model.abaValue ??=
                                                      false,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                        .abaValue = newValue!);
                                                    if (newValue!) {
                                                      setState(() {
                                                        _model.onDeliveryValue =
                                                            false;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _model.abaValue = true;
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'i9bih6u4' /* Online payment */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://play-lh.googleusercontent.com/-deHHbwBUh2I4dzTjq9n4ggBGPqJwKzj9pwvPqyaR-hPxzKN9QVJOBsZP_ShlCDmX60',
                                                  width: 43.0,
                                                  height: 30.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://asset.brandfetch.io/iduTsrn35q/idZnP-pDVO.jpeg',
                                                  width: 43.0,
                                                  height: 30.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: (_model
                                                                    .fullnameloginController
                                                                    .text ==
                                                                null ||
                                                            _model
                                                                    .fullnameloginController
                                                                    .text ==
                                                                '') &&
                                                        (_model.addressloginController
                                                                    .text ==
                                                                null ||
                                                            _model.addressloginController
                                                                    .text ==
                                                                '') &&
                                                        (_model.locationloginValue ==
                                                                null ||
                                                            _model.locationloginValue ==
                                                                '') &&
                                                        (_model.fullnameController
                                                                    .text ==
                                                                null ||
                                                            _model.fullnameController
                                                                    .text ==
                                                                '')
                                                    ? null
                                                    : () async {
                                                        if (loggedIn == true) {
                                                          await OrderRecord
                                                              .collection
                                                              .doc()
                                                              .set({
                                                            ...createOrderRecordData(
                                                              currency: '\$',
                                                              discount: FFAppState()
                                                                  .discountAmount,
                                                              phoneNumber: _model
                                                                  .phoneNumberloginController
                                                                  .text,
                                                              address: _model
                                                                  .addressloginController
                                                                  .text,
                                                              total: double.parse(
                                                                  FFAppState()
                                                                      .sum
                                                                      .toStringAsFixed(
                                                                          2)),
                                                              subTotal:
                                                                  FFAppState()
                                                                      .subTotal,
                                                              guestCheckout:
                                                                  false,
                                                              additionalInfo: _model
                                                                  .additionalDetailController
                                                                  .text,
                                                              userRef:
                                                                  currentUserReference,
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              orderId: random_data
                                                                  .randomString(
                                                                1,
                                                                10,
                                                                true,
                                                                true,
                                                                true,
                                                              ),
                                                              paymentMethod: _model
                                                                          .onDeliveryValue ==
                                                                      true
                                                                  ? 'Cash on Delivery'
                                                                  : 'Online Payment',
                                                              status: 'Pending',
                                                              location: _model
                                                                  .locationloginValue,
                                                              isGuest: false,
                                                              deliveryOption: widget
                                                                  .deliveryOption,
                                                              guestInfo:
                                                                  updateGuestStruct(
                                                                null,
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'checkout_products':
                                                                    getCheckoutProductListFirestoreData(
                                                                  FFAppState()
                                                                      .checkoutCart,
                                                                ),
                                                              },
                                                            ),
                                                          });
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                .checkoutCart = [];
                                                            FFAppState().sum =
                                                                0.0;
                                                            FFAppState()
                                                                    .discountAmount =
                                                                0.0;
                                                            FFAppState()
                                                                .subTotal = 0.0;
                                                          });
                                                          await showAlignedDialog(
                                                            barrierColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                            context: context,
                                                            isGlobal: true,
                                                            avoidOverflow:
                                                                false,
                                                            targetAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            followerAnchor:
                                                                AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                            builder:
                                                                (dialogContext) {
                                                              return Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () => _model
                                                                          .unfocusNode
                                                                          .canRequestFocus
                                                                      ? FocusScope.of(
                                                                              context)
                                                                          .requestFocus(_model
                                                                              .unfocusNode)
                                                                      : FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        350.0,
                                                                    width:
                                                                        1000.0,
                                                                    child:
                                                                        SuccessfulPlaceOrderWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        } else {
                                                          if (_model
                                                                  .checkboxAsguestValue ==
                                                              true) {
                                                            if (_model
                                                                    .checkboxSaveValue ==
                                                                true) {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .updateGuestInfoStruct(
                                                                  (e) => e
                                                                    ..name = _model
                                                                        .fullnameController
                                                                        .text
                                                                    ..adress = _model
                                                                        .addressController
                                                                        .text
                                                                    ..location =
                                                                        _model
                                                                            .locationValue
                                                                    ..phoneNumber =
                                                                        _model
                                                                            .phoneNumberController
                                                                            .text,
                                                                );
                                                              });
                                                            }

                                                            var orderRecordReference2 =
                                                                OrderRecord
                                                                    .collection
                                                                    .doc();
                                                            await orderRecordReference2
                                                                .set({
                                                              ...createOrderRecordData(
                                                                currency: '\$',
                                                                discount:
                                                                    FFAppState()
                                                                        .discountAmount,
                                                                phoneNumber: _model
                                                                    .phoneNumberloginController
                                                                    .text,
                                                                address: _model
                                                                    .addressloginController
                                                                    .text,
                                                                total: double.parse(
                                                                    FFAppState()
                                                                        .sum
                                                                        .toStringAsFixed(
                                                                            2)),
                                                                subTotal:
                                                                    FFAppState()
                                                                        .subTotal,
                                                                guestCheckout:
                                                                    _model
                                                                        .onDeliveryValue,
                                                                additionalInfo:
                                                                    _model
                                                                        .additionalDetailController
                                                                        .text,
                                                                createdAt:
                                                                    getCurrentTimestamp,
                                                                orderId: random_data
                                                                    .randomString(
                                                                  1,
                                                                  10,
                                                                  true,
                                                                  true,
                                                                  true,
                                                                ),
                                                                paymentMethod: _model
                                                                            .onDeliveryValue ==
                                                                        true
                                                                    ? 'Cash on Delivery'
                                                                    : 'Online Payment',
                                                                status:
                                                                    'Pending',
                                                                location: _model
                                                                    .locationloginValue,
                                                                isGuest: true,
                                                                guestInfo:
                                                                    updateGuestStruct(
                                                                  GuestStruct(
                                                                    name: _model
                                                                        .fullnameController
                                                                        .text,
                                                                    adress: _model
                                                                        .addressController
                                                                        .text,
                                                                    location: _model
                                                                        .locationValue,
                                                                    phoneNumber:
                                                                        _model
                                                                            .phoneNumberController
                                                                            .text,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                  create: true,
                                                                ),
                                                                deliveryOption:
                                                                    widget
                                                                        .deliveryOption,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'checkout_products':
                                                                      getCheckoutProductListFirestoreData(
                                                                    FFAppState()
                                                                        .checkoutCart,
                                                                  ),
                                                                },
                                                              ),
                                                            });
                                                            _model.orderPlaced =
                                                                OrderRecord
                                                                    .getDocumentFromData({
                                                              ...createOrderRecordData(
                                                                currency: '\$',
                                                                discount:
                                                                    FFAppState()
                                                                        .discountAmount,
                                                                phoneNumber: _model
                                                                    .phoneNumberloginController
                                                                    .text,
                                                                address: _model
                                                                    .addressloginController
                                                                    .text,
                                                                total: double.parse(
                                                                    FFAppState()
                                                                        .sum
                                                                        .toStringAsFixed(
                                                                            2)),
                                                                subTotal:
                                                                    FFAppState()
                                                                        .subTotal,
                                                                guestCheckout:
                                                                    _model
                                                                        .onDeliveryValue,
                                                                additionalInfo:
                                                                    _model
                                                                        .additionalDetailController
                                                                        .text,
                                                                createdAt:
                                                                    getCurrentTimestamp,
                                                                orderId: random_data
                                                                    .randomString(
                                                                  1,
                                                                  10,
                                                                  true,
                                                                  true,
                                                                  true,
                                                                ),
                                                                paymentMethod: _model
                                                                            .onDeliveryValue ==
                                                                        true
                                                                    ? 'Cash on Delivery'
                                                                    : 'Online Payment',
                                                                status:
                                                                    'Pending',
                                                                location: _model
                                                                    .locationloginValue,
                                                                isGuest: true,
                                                                guestInfo:
                                                                    updateGuestStruct(
                                                                  GuestStruct(
                                                                    name: _model
                                                                        .fullnameController
                                                                        .text,
                                                                    adress: _model
                                                                        .addressController
                                                                        .text,
                                                                    location: _model
                                                                        .locationValue,
                                                                    phoneNumber:
                                                                        _model
                                                                            .phoneNumberController
                                                                            .text,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                  create: true,
                                                                ),
                                                                deliveryOption:
                                                                    widget
                                                                        .deliveryOption,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'checkout_products':
                                                                      getCheckoutProductListFirestoreData(
                                                                    FFAppState()
                                                                        .checkoutCart,
                                                                  ),
                                                                },
                                                              ),
                                                            }, orderRecordReference2);
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                  .checkoutCart = [];
                                                              FFAppState().sum =
                                                                  0.0;
                                                              FFAppState()
                                                                      .discountAmount =
                                                                  0.0;
                                                              FFAppState()
                                                                      .subTotal =
                                                                  0.0;
                                                            });
                                                            await showAlignedDialog(
                                                              barrierColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent2,
                                                              context: context,
                                                              isGlobal: true,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          350.0,
                                                                      width:
                                                                          1000.0,
                                                                      child:
                                                                          SuccessfulPlaceOrderWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          } else {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                  .updateGuestInfoStruct(
                                                                (e) => e
                                                                  ..name = _model
                                                                      .fullnameController
                                                                      .text
                                                                  ..adress = _model
                                                                      .addressController
                                                                      .text
                                                                  ..location =
                                                                      _model
                                                                          .locationValue
                                                                  ..phoneNumber =
                                                                      _model
                                                                          .phoneNumberController
                                                                          .text,
                                                              );
                                                            });
                                                            await showAlignedDialog(
                                                              context: context,
                                                              isGlobal: true,
                                                              avoidOverflow:
                                                                  false,
                                                              targetAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              followerAnchor:
                                                                  AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                              builder:
                                                                  (dialogContext) {
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        SignUpPopupWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          }
                                                        }

                                                        setState(() {});
                                                      },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '5gehuddh' /* Place order */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 150.0,
                                                  height: 50.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                  hoverColor: Colors.black,
                                                  hoverBorderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  hoverTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['rowOnPageLoadAnimation']!),
                  ),
                ),
                wrapWithModel(
                  model: _model.footerModel,
                  updateCallback: () => setState(() {}),
                  child: FooterWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
