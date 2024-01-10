import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_account_model.dart';
export 'user_account_model.dart';

class UserAccountWidget extends StatefulWidget {
  const UserAccountWidget({
    Key? key,
    this.selection,
  }) : super(key: key);

  final int? selection;

  @override
  _UserAccountWidgetState createState() => _UserAccountWidgetState();
}

class _UserAccountWidgetState extends State<UserAccountWidget> {
  late UserAccountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserAccountModel());

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

    return Container(
      width: 374.0,
      height: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'ncl3dx2t' /* Manage My Account */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed('Account');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: widget.selection == 1
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.userCircle,
                              color: widget.selection == 1
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'qtttxdym' /* My Account */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Kantumruy Pro',
                                      color: widget.selection == 1
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'zg98mdkw' /* My Order */,
              ),
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('my_Order');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: widget.selection == 2
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: widget.selection == 2
                                  ? FlutterFlowTheme.of(context)
                                      .primaryBackground
                                  : FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sgnfdnav' /* My Order */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Kantumruy Pro',
                                      color: widget.selection == 2
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      fontWeight: FontWeight.w500,
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
          ].divide(SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
