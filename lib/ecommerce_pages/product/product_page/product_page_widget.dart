import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/product_card/product_card_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'product_page_model.dart';
export 'product_page_model.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    Key? key,
    this.categoryId,
    this.searchId,
    this.discountId,
    bool? isDiscount,
  })  : this.isDiscount = isDiscount ?? false,
        super(key: key);

  final String? categoryId;
  final String? searchId;
  final String? discountId;
  final bool isDiscount;

  @override
  _ProductPageWidgetState createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget>
    with TickerProviderStateMixin {
  late ProductPageModel _model;

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
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 44.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'gridViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 11.000000000000014),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoaded = false;
      });
      if (widget.categoryId != null && widget.categoryId != '') {
        _model.initialList = await queryProductsRecordOnce(
          queryBuilder: (productsRecord) => productsRecord.where(
            'category',
            isEqualTo: widget.categoryId,
          ),
        );
        setState(() {
          _model.filteredProdutList =
              _model.initialList!.toList().cast<ProductsRecord>();
        });
      } else if (widget.searchId != null && widget.searchId != '') {
        await queryProductsRecordOnce()
            .then(
              (records) => _model.simpleSearchResults1 = TextSearch(
                records
                    .map(
                      (record) => TextSearchItem.fromTerms(
                          record, [record.name!, record.category!]),
                    )
                    .toList(),
              ).search(widget.searchId!).map((r) => r.object).take(25).toList(),
            )
            .onError((_, __) => _model.simpleSearchResults1 = [])
            .whenComplete(() => setState(() {}));

        setState(() {
          _model.filteredProdutList =
              _model.simpleSearchResults1.toList().cast<ProductsRecord>();
        });
      } else if (widget.isDiscount == true) {
        _model.isDiscountProductList = await queryProductsRecordOnce(
          queryBuilder: (productsRecord) => productsRecord.where(
            'discount',
            isGreaterThan: 0,
          ),
        );
        setState(() {
          _model.filteredProdutList =
              _model.isDiscountProductList!.toList().cast<ProductsRecord>();
        });
      } else {
        _model.defaultProductList = await queryProductsRecordOnce(
          queryBuilder: (productsRecord) => productsRecord.orderBy('name'),
        );
        setState(() {
          _model.filteredProdutList =
              _model.defaultProductList!.toList().cast<ProductsRecord>();
        });
      }

      setState(() {
        _model.isLoaded = true;
      });
    });

    _model.textController ??= TextEditingController(text: widget.searchId);
    _model.textFieldFocusNode ??= FocusNode();
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

    return StreamBuilder<List<ProductsRecord>>(
      stream: queryProductsRecord(),
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
        List<ProductsRecord> productPageProductsRecordList = snapshot.data!;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  50.0, 0.0, 50.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/MK_MONGKUL_LOGO-03.png',
                                      width: 241.0,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 6.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('HomePage');
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'bn6s7wf1' /* Home */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Kantumruy Pro',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('contact');
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '5azw7fy9' /* Contact */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Kantumruy Pro',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('about_us');
                                          },
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'myf8i6nt' /* About */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Kantumruy Pro',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
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
                                              context
                                                  .pushNamed('signUp_Editio1');
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'z2ocozfp' /* Sign Up */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Kantumruy Pro',
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 30.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 12.0, 8.0),
                                    child: Container(
                                      width: 340.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController,
                                                  focusNode:
                                                      _model.textFieldFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  onFieldSubmitted: (_) async {
                                                    FFAppState().update(() {});

                                                    context.pushNamed(
                                                      'productPage',
                                                      queryParameters: {
                                                        'searchId':
                                                            serializeParam(
                                                          _model.textController
                                                              .text,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '2r1art8o' /* What are you looking for? */,
                                                    ),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                  validator: _model
                                                      .textControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 60.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(9.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().update(() {});
                                                    safeSetState(() {
                                                      _model.simpleSearchResults2 =
                                                          TextSearch(
                                                        productPageProductsRecordList
                                                            .map(
                                                              (record) =>
                                                                  TextSearchItem
                                                                      .fromTerms(
                                                                          record,
                                                                          [
                                                                    record
                                                                        .name!,
                                                                    record
                                                                        .category!
                                                                  ]),
                                                            )
                                                            .toList(),
                                                      )
                                                              .search(_model
                                                                  .textController
                                                                  .text)
                                                              .map((r) =>
                                                                  r.object)
                                                              .take(25)
                                                              .toList();
                                                      ;
                                                    });
                                                    setState(() {
                                                      _model.filteredProdutList = _model
                                                          .simpleSearchResults2
                                                          .toList()
                                                          .cast<
                                                              ProductsRecord>();
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.search_rounded,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                          ),
                                          child: Visibility(
                                            visible: loggedIn == true,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed('Account');
                                                },
                                                child: FaIcon(
                                                  FontAwesomeIcons.userCircle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 27.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.pushNamedAuth(
                                                'Log_in', context.mounted);
                                          },
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                            size: 27.0,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Cart');
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 55.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 1.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .shopping_cart_outlined,
                                                        color: Colors.white,
                                                        size: 27.0,
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                            .checkoutCart
                                                            .length >
                                                        0)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                        child: Container(
                                                          width: 21.0,
                                                          height: 21.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFAppState()
                                                                  .checkoutCart
                                                                  .length
                                                                  .toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowLanguageSelector(
                                        width: 120.0,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderColor: Colors.transparent,
                                        dropdownIconColor: Colors.white,
                                        borderRadius: 8.0,
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0,
                                        ),
                                        hideFlags: true,
                                        flagSize: 24.0,
                                        flagTextGap: 8.0,
                                        currentLanguage:
                                            FFLocalizations.of(context)
                                                .languageCode,
                                        languages: FFLocalizations.languages(),
                                        onChanged: (lang) =>
                                            setAppLanguage(context, lang),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(width: 20.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 60.0)),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE2C721),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 270.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: SwitchListTile.adaptive(
                                            value:
                                                _model.switchListTileValue ??=
                                                    widget.isDiscount,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.switchListTileValue =
                                                      newValue!);
                                              if (newValue!) {
                                                setState(() {
                                                  _model.categoryName = '';
                                                });
                                                _model.discountProducts =
                                                    await queryProductsRecordOnce(
                                                  queryBuilder:
                                                      (productsRecord) =>
                                                          productsRecord.where(
                                                    'discount',
                                                    isGreaterThan: 0,
                                                  ),
                                                );
                                                setState(() {
                                                  _model.filteredProdutList =
                                                      _model.discountProducts!
                                                          .toList()
                                                          .cast<
                                                              ProductsRecord>();
                                                });

                                                setState(() {});
                                              } else {
                                                setState(() {
                                                  _model.categoryName = '';
                                                });
                                                _model.products =
                                                    await queryProductsRecordOnce();
                                                setState(() {
                                                  _model.filteredProdutList =
                                                      _model.products!
                                                          .toList()
                                                          .cast<
                                                              ProductsRecord>();
                                                });

                                                setState(() {});
                                              }
                                            },
                                            title: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bbaxtjrt' /* Discount */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Kantumruy Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                            ),
                                            subtitle: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xs0pc2ye' /*  Discount product */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Kantumruy Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                            ),
                                            tileColor: Color(0x00E2C721),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Container(
                                    width: 270.0,
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
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<List<ProductsRecord>>(
                                          stream: queryProductsRecord(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ProductsRecord>
                                                containerProductsRecordList =
                                                snapshot.data!;
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 16.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final categoryList = functions
                                                        .repeatedCatefory(
                                                            containerProductsRecordList
                                                                .map((e) =>
                                                                    e.category)
                                                                .toList())
                                                        .toList();
                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.0),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          categoryList.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 5.0),
                                                      itemBuilder: (context,
                                                          categoryListIndex) {
                                                        final categoryListItem =
                                                            categoryList[
                                                                categoryListIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.resultedListCopy2 =
                                                                  await queryProductsRecordOnce(
                                                                queryBuilder:
                                                                    (productsRecord) =>
                                                                        productsRecord
                                                                            .where(
                                                                  'category',
                                                                  isEqualTo:
                                                                      categoryListItem,
                                                                ),
                                                              );
                                                              setState(() {
                                                                _model.categoryName =
                                                                    categoryListItem;
                                                              });
                                                              setState(() {
                                                                _model.discountProductList =
                                                                    0;
                                                                _model.tempProductList =
                                                                    [];
                                                              });
                                                              if (_model
                                                                      .switchListTileValue ==
                                                                  true) {
                                                                while (_model
                                                                        .discountProductList <
                                                                    _model
                                                                        .resultedListCopy2!
                                                                        .length) {
                                                                  if (_model
                                                                          .resultedListCopy2![
                                                                              _model.discountProductList]
                                                                          .discount >
                                                                      0) {
                                                                    setState(
                                                                        () {
                                                                      _model.addToTempProductList(_model
                                                                              .resultedListCopy2![
                                                                          _model
                                                                              .discountProductList]);
                                                                    });
                                                                  }
                                                                  setState(() {
                                                                    _model.discountProductList =
                                                                        _model.discountProductList +
                                                                            1;
                                                                  });
                                                                }
                                                                setState(() {
                                                                  _model.filteredProdutList = _model
                                                                      .tempProductList
                                                                      .toList()
                                                                      .cast<
                                                                          ProductsRecord>();
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _model.filteredProdutList = _model
                                                                      .resultedListCopy2!
                                                                      .toList()
                                                                      .cast<
                                                                          ProductsRecord>();
                                                                });
                                                              }

                                                              setState(() {});
                                                            },
                                                            text:
                                                                categoryListItem,
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: _model
                                                                          .categoryName ==
                                                                      categoryListItem
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Kantumruy Pro',
                                                                        color: _model.categoryName ==
                                                                                categoryListItem
                                                                            ? FlutterFlowTheme.of(context).primaryBackground
                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              hoverTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                            showLoadingIndicator:
                                                                false,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ].divide(SizedBox(height: 14.0)),
                          ),
                          Builder(
                            builder: (context) {
                              if ((_model.filteredProdutList.length == 0) &&
                                  (_model.isLoaded == true)) {
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 1040.0,
                                    height: 510.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.remove_shopping_cart_outlined,
                                            color: Color(0xFFDDDDDD),
                                            size: 120.0,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0h422m33' /* No Products Available */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: 'Kantumruy Pro',
                                                    color: Color(0xFFDDDDDD),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!),
                                );
                              } else if ((_model.filteredProdutList.length >
                                      0) &&
                                  (_model.isLoaded == true)) {
                                return Container(
                                  width: 1040.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final productSearchResult =
                                          _model.filteredProdutList.toList();
                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 60.0,
                                          mainAxisSpacing: 30.0,
                                          childAspectRatio: 0.85,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: productSearchResult.length,
                                        itemBuilder: (context,
                                            productSearchResultIndex) {
                                          final productSearchResultItem =
                                              productSearchResult[
                                                  productSearchResultIndex];
                                          return ProductCardWidget(
                                            key: Key(
                                                'Keyz7z_${productSearchResultIndex}_of_${productSearchResult.length}'),
                                            productRef: productSearchResultItem
                                                .reference,
                                            image: productSearchResultItem
                                                .image.first,
                                            discount: productSearchResultItem
                                                .discount,
                                            name: productSearchResultItem.name,
                                            price:
                                                productSearchResultItem.price,
                                            aboutItem: productSearchResultItem
                                                .aboutItem,
                                            description: productSearchResultItem
                                                .description,
                                            status:
                                                productSearchResultItem.status,
                                            id: productSearchResultItem.id,
                                            catregory: productSearchResultItem
                                                .category,
                                          );
                                        },
                                      ).animateOnPageLoad(animationsMap[
                                          'gridViewOnPageLoadAnimation']!);
                                    },
                                  ),
                                );
                              } else {
                                return Container(
                                  width: 1040.0,
                                  height: 510.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 200.0,
                                      height: 200.0,
                                      child:
                                          custom_widgets.CustomLoadingIndicator(
                                        width: 200.0,
                                        height: 200.0,
                                        valueColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        strokeWidth: 9.0,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ].divide(SizedBox(width: 40.0)),
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
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
      },
    );
  }
}
