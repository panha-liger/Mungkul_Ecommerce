import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import '/user_components/product_card/product_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_detail_model.dart';
export 'product_detail_model.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    super.key,
    this.productId,
    this.cstegoryId,
  });

  final String? productId;
  final String? cstegoryId;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget>
    with TickerProviderStateMixin {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => ProductDetailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.productOutput = await queryProductsRecordOnce(
        queryBuilder: (productsRecord) => productsRecord.where(
          'id',
          isEqualTo: widget.productId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      setState(() {
        _model.imageView = _model.productOutput!.image.first;
      });
    });

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 1440.0,
                maxHeight: 900.0,
              ),
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.hearderModel,
                      updateCallback: () => setState(() {}),
                      child: HearderWidget(
                        inProductPage: false,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().update(() {});
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            StreamBuilder<List<ProductsRecord>>(
                              stream: queryProductsRecord(
                                queryBuilder: (productsRecord) =>
                                    productsRecord.where(
                                  'id',
                                  isEqualTo: widget.productId,
                                ),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ProductsRecord>
                                    containerProductsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerProductsRecord =
                                    containerProductsRecordList.isNotEmpty
                                        ? containerProductsRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height: 644.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 170.0,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final productImage =
                                                  (containerProductsRecord
                                                              ?.image
                                                              ?.toList() ??
                                                          [])
                                                      .take(4)
                                                      .toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount: productImage.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 16.0),
                                                itemBuilder: (context,
                                                    productImageIndex) {
                                                  final productImageItem =
                                                      productImage[
                                                          productImageIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          setState(() {
                                                            _model.imageView =
                                                                containerProductsRecord!
                                                                        .image[
                                                                    productImageIndex];
                                                          });
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            containerProductsRecord!
                                                                    .image[
                                                                productImageIndex],
                                                            width: 150.0,
                                                            height: 140.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 20.0)),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              _model.imageView,
                                              width: 500.0,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 600.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  containerProductsRecord!.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge,
                                                ),
                                                Text(
                                                  formatNumber(
                                                    containerProductsRecord!
                                                        .price,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '\$',
                                                    format: '0.00',
                                                    locale: '',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Kantumruy Pro',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Text(
                                                  containerProductsRecord!
                                                      .description,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge,
                                                ),
                                                Divider(
                                                  thickness: 3.0,
                                                  color: Color(0x7B39D2C0),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    25.0),
                                                        child: Text(
                                                          containerProductsRecord!
                                                              .aboutItem,
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 10,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              if (FFAppState()
                                                                      .checkoutCart
                                                                      .where((e) =>
                                                                          e.product
                                                                              .id ==
                                                                          widget
                                                                              .productId)
                                                                      .toList()
                                                                      .length ==
                                                                  0) {
                                                                return Container(
                                                                  width: 150.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.currentProduct =
                                                                            null;
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model.currentProduct =
                                                                            ProductStruct(
                                                                          name:
                                                                              containerProductsRecord?.name,
                                                                          description:
                                                                              containerProductsRecord?.description,
                                                                          aboutItem:
                                                                              containerProductsRecord?.aboutItem,
                                                                          status:
                                                                              containerProductsRecord?.status,
                                                                          discount:
                                                                              containerProductsRecord?.discount,
                                                                          category:
                                                                              containerProductsRecord?.category,
                                                                          image: containerProductsRecord
                                                                              ?.image
                                                                              ?.first,
                                                                          id: containerProductsRecord
                                                                              ?.id,
                                                                          productRef:
                                                                              containerProductsRecord?.productRef,
                                                                          price:
                                                                              containerProductsRecord!.price - (containerProductsRecord!.price * containerProductsRecord!.discount.toDouble() / 100),
                                                                          basePrice:
                                                                              containerProductsRecord?.price,
                                                                        );
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .updateCheckoutProductStruct(
                                                                          (e) => e
                                                                            ..incrementQuantity(1)
                                                                            ..product =
                                                                                _model.currentProduct
                                                                            ..totalPrice = _model.currentProduct?.price,
                                                                        );
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState()
                                                                            .sum = FFAppState()
                                                                                .sum +
                                                                            _model.currentProduct!.price;
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState()
                                                                            .discountAmount = FFAppState()
                                                                                .discountAmount +
                                                                            containerProductsRecord!.price *
                                                                                containerProductsRecord!.discount /
                                                                                100;
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().subTotal =
                                                                            containerProductsRecord!.price;
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState()
                                                                            .addToCheckoutCart(_model.checkoutProduct!);
                                                                      });
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pe63hrz7' /* Add to Cart */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Kantumruy Pro',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              9.0),
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Container(
                                                                  width: 150.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                  ),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState()
                                                                            .subTotal = FFAppState()
                                                                                .subTotal +
                                                                            -containerProductsRecord!.price;
                                                                        FFAppState()
                                                                            .discountAmount = FFAppState()
                                                                                .discountAmount +
                                                                            -(containerProductsRecord!.price *
                                                                                containerProductsRecord!.discount /
                                                                                100);
                                                                        FFAppState()
                                                                            .sum = FFAppState()
                                                                                .sum +
                                                                            -containerProductsRecord!
                                                                                .price -
                                                                            (containerProductsRecord!.price *
                                                                                containerProductsRecord!.discount.toDouble() /
                                                                                100);
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model.itemIndex =
                                                                            0;
                                                                      });
                                                                      while (_model
                                                                              .itemIndex <
                                                                          FFAppState()
                                                                              .checkoutCart
                                                                              .length) {
                                                                        if (FFAppState().checkoutCart[_model.itemIndex].product.id ==
                                                                            containerProductsRecord?.id) {
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().updateCheckoutCartAtIndex(
                                                                              _model.itemIndex,
                                                                              (e) => e..quantity = null,
                                                                            );
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().removeAtIndexFromCheckoutCart(_model.itemIndex);
                                                                          });
                                                                          break;
                                                                        } else {
                                                                          setState(
                                                                              () {
                                                                            _model.itemIndex =
                                                                                _model.itemIndex + 1;
                                                                          });
                                                                        }
                                                                      }
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '9085bt5f' /* Remove */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Kantumruy Pro',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              9.0),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              borderRadius: 9.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 45.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .shopping_cart_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<ProductsRecord>>(
                              stream: queryProductsRecord(
                                queryBuilder: (productsRecord) => productsRecord
                                    .where(
                                      'id',
                                      isNotEqualTo: widget.productId,
                                    )
                                    .where(
                                      'category',
                                      isEqualTo: widget.cstegoryId,
                                    )
                                    .orderBy('id'),
                                limit: 4,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ProductsRecord>
                                    containerProductsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 40.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                              height: 50.0,
                                              child: VerticalDivider(
                                                width: 20.0,
                                                thickness: 20.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'avvbrbpa' /* Related Products */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Kantumruy Pro',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              if (containerProductsRecordList
                                                      .length >
                                                  0) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 55.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 370.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final containerVar =
                                                              containerProductsRecordList
                                                                  .toList()
                                                                  .take(4)
                                                                  .toList();
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: List.generate(
                                                                containerVar
                                                                    .length,
                                                                (containerVarIndex) {
                                                              final containerVarItem =
                                                                  containerVar[
                                                                      containerVarIndex];
                                                              return ProductCardWidget(
                                                                key: Key(
                                                                    'Keyqiq_${containerVarIndex}_of_${containerVar.length}'),
                                                                productRef:
                                                                    containerVarItem
                                                                        .reference,
                                                                image:
                                                                    containerVarItem
                                                                        .image
                                                                        .first,
                                                                discount:
                                                                    containerVarItem
                                                                        .discount,
                                                                name:
                                                                    containerVarItem
                                                                        .name,
                                                                price:
                                                                    containerVarItem
                                                                        .price,
                                                                aboutItem:
                                                                    containerVarItem
                                                                        .aboutItem,
                                                                description:
                                                                    containerVarItem
                                                                        .description,
                                                                status:
                                                                    containerVarItem
                                                                        .status,
                                                                id: containerVarItem
                                                                    .id,
                                                                catregory:
                                                                    containerVarItem
                                                                        .category,
                                                              );
                                                            }).divide(SizedBox(
                                                                width: 77.0)),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 181.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .remove_shopping_cart_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 50.0,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'jsfbujlr' /* No Products Available */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Kantumruy Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      50.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 25.0)),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
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
        ),
      ),
    );
  }
}
