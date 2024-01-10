import '/admin_components/web_nav/web_nav_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'contact_update_info_model.dart';
export 'contact_update_info_model.dart';

class ContactUpdateInfoWidget extends StatefulWidget {
  const ContactUpdateInfoWidget({Key? key}) : super(key: key);

  @override
  _ContactUpdateInfoWidgetState createState() =>
      _ContactUpdateInfoWidgetState();
}

class _ContactUpdateInfoWidgetState extends State<ContactUpdateInfoWidget> {
  late ContactUpdateInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactUpdateInfoModel());

    _model.emailFocusNode ??= FocusNode();

    _model.phoneFocusNode ??= FocusNode();

    _model.adressFocusNode ??= FocusNode();

    _model.fcebookFocusNode ??= FocusNode();

    _model.telegramFocusNode ??= FocusNode();

    _model.visionFocusNode ??= FocusNode();

    _model.processFocusNode ??= FocusNode();

    _model.approachFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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

    return FutureBuilder<List<AdminInfoRecord>>(
      future: queryAdminInfoRecordOnce(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<AdminInfoRecord> contactUpdateInfoAdminInfoRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final contactUpdateInfoAdminInfoRecord =
            contactUpdateInfoAdminInfoRecordList.isNotEmpty
                ? contactUpdateInfoAdminInfoRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.webNavModel,
                      updateCallback: () => setState(() {}),
                      child: WebNavWidget(
                        selectedNav: 6,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 40.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 40.0, 16.0, 40.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'nub3vokg' /* General Information */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'fq50x627' /* Email */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _model.emailController ??=
                                            TextEditingController(
                                          text: contactUpdateInfoAdminInfoRecord
                                              ?.email,
                                        ),
                                        focusNode: _model.emailFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .emailControllerValidator
                                            .asValidator(context),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'xjenhxm9' /* Phone number */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _model.phoneController ??=
                                            TextEditingController(
                                          text: contactUpdateInfoAdminInfoRecord
                                              ?.phoneNumber,
                                        ),
                                        focusNode: _model.phoneFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .phoneControllerValidator
                                            .asValidator(context),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'jdq7gr8j' /* Adress */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _model.adressController ??=
                                            TextEditingController(
                                          text: contactUpdateInfoAdminInfoRecord
                                              ?.adress,
                                        ),
                                        focusNode: _model.adressFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .adressControllerValidator
                                            .asValidator(context),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'fg0yr901' /* Facebook Link */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _model.fcebookController ??=
                                            TextEditingController(
                                          text: contactUpdateInfoAdminInfoRecord
                                              ?.faceBookLink,
                                        ),
                                        focusNode: _model.fcebookFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .fcebookControllerValidator
                                            .asValidator(context),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '1h5tnerd' /* Telegram Link */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.telegramController ??=
                                                TextEditingController(
                                          text: contactUpdateInfoAdminInfoRecord
                                              ?.telegramLink,
                                        ),
                                        focusNode: _model.telegramFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        maxLines: null,
                                        validator: _model
                                            .telegramControllerValidator
                                            .asValidator(context),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 40.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 40.0, 16.0, 40.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'rhvgbi4h' /* About US */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '8sq2gcd5' /* Our Vision */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _model.visionController ??=
                                            TextEditingController(
                                          text: contactUpdateInfoAdminInfoRecord
                                              ?.ourVision,
                                        ),
                                        focusNode: _model.visionFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                        maxLines: 9,
                                        validator: _model
                                            .visionControllerValidator
                                            .asValidator(context),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ywa7a2dd' /* Our Process */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _model.processController ??=
                                            TextEditingController(
                                          text: contactUpdateInfoAdminInfoRecord
                                              ?.ourProcess,
                                        ),
                                        focusNode: _model.processFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                        maxLines: 9,
                                        validator: _model
                                            .processControllerValidator
                                            .asValidator(context),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            't893u643' /* Our Approach */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.approachController ??=
                                                TextEditingController(
                                          text: contactUpdateInfoAdminInfoRecord
                                              ?.ourApproach,
                                        ),
                                        focusNode: _model.approachFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(9.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                        maxLines: 9,
                                        validator: _model
                                            .approachControllerValidator
                                            .asValidator(context),
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 40.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 40.0, 16.0, 40.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'hokxi4e4' /* About US Image */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'xr6b725l' /* Our Vision */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (_model.visionImage == null ||
                                              _model.visionImage == '') {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.isDataUploading1 =
                                                      false;
                                                  _model.uploadedLocalFile1 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl1 = '';
                                                });

                                                final selectedMedia =
                                                    await selectMedia(
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading1 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading1 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile1 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl1 =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(
                                                        context, 'Success!');
                                                  } else {
                                                    setState(() {});
                                                    showUploadMessage(context,
                                                        'Failed to upload data');
                                                    return;
                                                  }
                                                }

                                                setState(() {
                                                  _model.visionImage =
                                                      _model.uploadedFileUrl1;
                                                });
                                                setState(() {
                                                  _model.isDataUploading1 =
                                                      false;
                                                  _model.uploadedLocalFile1 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl1 = '';
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 550.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 73.0,
                                                      height: 73.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFDEDEFA),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.image_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ecsng6zk' /* Drag and drop image here, or c... */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge,
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 550.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(40.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9.0),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .visionImage,
                                                                    'data:image/jpeg;base64,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',
                                                                  ),
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  borderRadius:
                                                                      9.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .minus,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.visionImage =
                                                                          null;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '0fwytgnw' /* Our Process */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (_model.processImage == null ||
                                              _model.processImage == '') {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.isDataUploading2 =
                                                      false;
                                                  _model.uploadedLocalFile2 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl2 = '';
                                                });

                                                final selectedMedia =
                                                    await selectMedia(
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading2 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading2 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile2 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl2 =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(
                                                        context, 'Success!');
                                                  } else {
                                                    setState(() {});
                                                    showUploadMessage(context,
                                                        'Failed to upload data');
                                                    return;
                                                  }
                                                }

                                                setState(() {
                                                  _model.processImage =
                                                      _model.uploadedFileUrl2;
                                                });
                                                setState(() {
                                                  _model.isDataUploading2 =
                                                      false;
                                                  _model.uploadedLocalFile2 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl2 = '';
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 550.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 73.0,
                                                      height: 73.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFDEDEFA),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.image_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '7ov4flwk' /* Drag and drop image here, or c... */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge,
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 550.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(40.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9.0),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .processImage,
                                                                    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR8gzwJ1OSntOGq0FZ5NnT8c9pOprbC2qMG7i7W3NTX60NG4QhV',
                                                                  ),
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  borderRadius:
                                                                      9.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .minus,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.processImage =
                                                                          null;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'gkf2ltfr' /* Our Approach */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (_model.approachImage == null ||
                                              _model.approachImage == '') {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.isDataUploading3 =
                                                      false;
                                                  _model.uploadedLocalFile3 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl3 = '';
                                                });

                                                final selectedMedia =
                                                    await selectMedia(
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading3 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading3 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile3 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl3 =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(
                                                        context, 'Success!');
                                                  } else {
                                                    setState(() {});
                                                    showUploadMessage(context,
                                                        'Failed to upload data');
                                                    return;
                                                  }
                                                }

                                                setState(() {
                                                  _model.approachImage =
                                                      _model.uploadedFileUrl3;
                                                });
                                                setState(() {
                                                  _model.isDataUploading3 =
                                                      false;
                                                  _model.uploadedLocalFile3 =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]));
                                                  _model.uploadedFileUrl3 = '';
                                                });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 550.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF5F5F5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 73.0,
                                                      height: 73.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFDEDEFA),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.image_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'l9tm5zgl' /* Drag and drop image here, or c... */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge,
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 550.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(40.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          child: Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            9.0),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .approachImage,
                                                                    'https://www.popsci.com/uploads/2023/05/15/ButterflyFamilyTree.png?auto=webp',
                                                                  ),
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  borderRadius:
                                                                      9.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .minus,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.approachImage =
                                                                          '';
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                    ].divide(SizedBox(height: 16.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 40.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await contactUpdateInfoAdminInfoRecord!
                                      .reference
                                      .update(createAdminInfoRecordData(
                                    phoneNumber: _model.phoneController.text,
                                    email: _model.emailController.text,
                                    adress: _model.adressController.text,
                                    ourVision: _model.visionController.text,
                                    ourProcess: _model.processController.text,
                                    ourApproach: _model.approachController.text,
                                    visionImage: _model.visionImage,
                                    processImage: _model.processImage,
                                    approachImage: _model.approachImage,
                                    faceBookLink: _model.fcebookController.text,
                                    telegramLink:
                                        _model.telegramController.text,
                                  ));

                                  context.goNamed('AdminDashboard');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'jakenu73' /* Submit Product */,
                                ),
                                icon: Icon(
                                  Icons.check_circle_outlined,
                                  size: 34.0,
                                ),
                                options: FFButtonOptions(
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Kantumruy Pro',
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(9.0),
                                  hoverColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 40.0))
                            .around(SizedBox(height: 40.0)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 40.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
