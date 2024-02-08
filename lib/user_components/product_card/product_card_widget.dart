import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_model.dart';
export 'product_card_model.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    this.image,
    this.discount,
    this.name,
    this.price,
    required this.productRef,
    this.aboutItem,
    this.description,
    this.status,
    this.id,
    this.catregory,
  });

  final String? image;
  final int? discount;
  final String? name;
  final double? price;
  final DocumentReference? productRef;
  final String? aboutItem;
  final String? description;
  final String? status;
  final String? id;
  final String? catregory;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget>
    with TickerProviderStateMixin {
  late ProductCardModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 6.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 180.ms,
          begin: 0.11,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 6.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 180.ms,
          begin: 0.11,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'product_Detail',
            queryParameters: {
              'productId': serializeParam(
                widget.id,
                ParamType.String,
              ),
              'cstegoryId': serializeParam(
                widget.catregory,
                ParamType.String,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: 280.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 250.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 200.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            widget.image!,
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (widget.discount! > 0)
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                7.0, 7.0, 0.0, 0.0),
                            child: Container(
                              width: 60.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'qj5hvpq7' /* % */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Kantumruy Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.discount?.toString(),
                                          '00',
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Kantumruy Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                        ),
                                  ),
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation1']!,
                            ),
                          ),
                        ),
                      Builder(
                        builder: (context) {
                          if (FFAppState()
                                  .checkoutCart
                                  .where((e) => e.product.id == widget.id)
                                  .toList()
                                  .length <=
                              0) {
                            return Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.updatePage(() {
                                    _model.currentProduct = null;
                                  });
                                  setState(() {
                                    _model.updateCurrentProductStruct(
                                      (e) => e
                                        ..name = widget.name
                                        ..discount = widget.discount
                                        ..description = widget.description
                                        ..aboutItem = widget.aboutItem
                                        ..status = widget.status
                                        ..category = widget.catregory
                                        ..image = widget.image
                                        ..id = widget.id
                                        ..productRef = widget.productRef
                                        ..price = (widget.price!) -
                                            ((widget.price!) *
                                                widget.discount!.toDouble() /
                                                100)
                                        ..basePrice = widget.price,
                                    );
                                  });
                                  _model.updatePage(() {
                                    _model.updateCheckoutProductStruct(
                                      (e) => e
                                        ..product = _model.currentProduct
                                        ..quantity = 1
                                        ..totalPrice =
                                            _model.currentProduct?.price,
                                    );
                                  });
                                  FFAppState().update(() {
                                    FFAppState().sum = FFAppState().sum +
                                        _model.currentProduct!.price;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().discountAmount =
                                        FFAppState().discountAmount +
                                            (widget.price!) *
                                                (widget.discount!) /
                                                100;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().subTotal = widget.price!;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().addToCheckoutCart(
                                        _model.checkoutProduct!);
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '7oy2rv0y' /* Add To Cart */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Kantumruy Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation2']!,
                              ),
                            );
                          } else {
                            return Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().subTotal =
                                        FFAppState().subTotal +
                                            -(widget.price!);
                                    FFAppState().discountAmount =
                                        FFAppState().discountAmount +
                                            -((widget.price!) *
                                                (widget.discount!) /
                                                100);
                                    FFAppState().sum = FFAppState().sum +
                                        -(widget.price!) -
                                        ((widget.price!) *
                                            widget.discount!.toDouble() /
                                            100);
                                  });
                                  _model.updatePage(() {
                                    _model.itemIndex = 0;
                                  });
                                  while (_model.itemIndex <
                                      FFAppState().checkoutCart.length) {
                                    if (FFAppState()
                                            .checkoutCart[_model.itemIndex]
                                            .product
                                            .id ==
                                        widget.id) {
                                      FFAppState().update(() {
                                        FFAppState().updateCheckoutCartAtIndex(
                                          _model.itemIndex,
                                          (e) => e..quantity = null,
                                        );
                                      });
                                      FFAppState().update(() {
                                        FFAppState()
                                            .removeAtIndexFromCheckoutCart(
                                                _model.itemIndex);
                                      });
                                      break;
                                    } else {
                                      _model.updatePage(() {
                                        _model.itemIndex = _model.itemIndex + 1;
                                      });
                                    }
                                  }
                                  _model.updatePage(() {
                                    _model.updateCheckoutProductStruct(
                                      (e) => e
                                        ..quantity = null
                                        ..product = null
                                        ..totalPrice = null,
                                    );
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '756qjeo4' /* Remove */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Kantumruy Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 30.0,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              9.0, 0.0, 9.0, 0.0),
                          child: Text(
                            widget.name!,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Kantumruy Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Text(
                                formatNumber(
                                  (widget.price!) -
                                      ((widget.price!) *
                                          widget.discount!.toDouble() /
                                          100),
                                  formatType: FormatType.custom,
                                  currency: '\$',
                                  format: '0.00',
                                  locale: 'en_US',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Kantumruy Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                              ),
                            ),
                            if (widget.discount! > 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Text(
                                  formatNumber(
                                    widget.price,
                                    formatType: FormatType.custom,
                                    currency: '\$',
                                    format: '0.00',
                                    locale: 'en_US',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Kantumruy Pro',
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
        if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
          animationsMap['containerOnActionTriggerAnimation2']!
              .controller
              .forward(from: 0.0);
        }
        if (widget.discount! > 0) {
          if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
            animationsMap['containerOnActionTriggerAnimation1']!
                .controller
                .forward(from: 0.0);
          }
        }
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
        if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
          animationsMap['containerOnActionTriggerAnimation2']!
              .controller
              .forward()
              .whenComplete(animationsMap['containerOnActionTriggerAnimation2']!
                  .controller
                  .reverse);
        }
        if (widget.discount! > 0) {
          if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
            animationsMap['containerOnActionTriggerAnimation1']!
                .controller
                .forward()
                .whenComplete(
                    animationsMap['containerOnActionTriggerAnimation1']!
                        .controller
                        .reverse);
          }
        }
      }),
    );
  }
}
