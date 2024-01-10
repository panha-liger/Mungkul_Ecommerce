import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'footer_model.dart';
export 'footer_model.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  late FooterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FooterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AdminInfoRecord>>(
      stream: queryAdminInfoRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<AdminInfoRecord> columnAdminInfoRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final columnAdminInfoRecord = columnAdminInfoRecordList.isNotEmpty
            ? columnAdminInfoRecordList.first
            : null;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: Color(0xFFE2C721),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/MK_MONGKUL_LOGO-03.png',
                            width: 248.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 290.0,
                      height: 158.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '83quhi7v' /* Support */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Kantumruy Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          Text(
                            columnAdminInfoRecord!.email,
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Kantumruy Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                          ),
                          Text(
                            columnAdminInfoRecord!.adress,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Kantumruy Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                          ),
                          Text(
                            '+885-${columnAdminInfoRecord?.phoneNumber}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Kantumruy Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                    Container(
                      height: 158.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'd1v3ouk6' /* Account */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Kantumruy Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          if (loggedIn == true)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Account');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'lb1d85ld' /* My Account */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Kantumruy Pro',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          if (loggedIn == false)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Log_in');
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gei0bxgx' /* Login / Register */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Kantumruy Pro',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Cart');
                            },
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '26xu9s4w' /* Cart */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Kantumruy Pro',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ),
                    Container(
                      height: 158.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '917kreup' /* Quick Link */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Kantumruy Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                          Flexible(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('contact');
                              },
                              child: Container(
                                width: 109.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'b8qs74uh' /* Contact */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Kantumruy Pro',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('about_us');
                              },
                              child: Container(
                                width: 110.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'fpa4rpgu' /* About Us */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Kantumruy Pro',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(
                                columnAdminInfoRecord!.faceBookLink);
                          },
                          child: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 40.0,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL(
                                columnAdminInfoRecord!.telegramLink);
                          },
                          child: Icon(
                            Icons.telegram,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 40.0,
                          ),
                        ),
                      ].divide(SizedBox(width: 40.0)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryText,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copyright,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 24.0,
                  ),
                  Text(
                    dateTimeFormat(
                      'yyyy',
                      getCurrentTimestamp,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Kantumruy Pro',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '1jxehsmc' /* Mungkul Technology. All Rights... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Kantumruy Pro',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                    ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ],
        );
      },
    );
  }
}
