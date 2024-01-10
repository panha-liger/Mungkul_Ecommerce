import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_components/footer/footer_widget.dart';
import '/user_components/hearder/hearder_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
export 'cart_model.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> with TickerProviderStateMixin {
  late CartModel _model;

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
    _model = createModel(context, () => CartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().checkoutCart.length > 0) {
        setState(() {
          _model.cartEmptied = false;
        });
      } else {
        setState(() {
          _model.cartEmptied = true;
        });
      }
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: SingleChildScrollView(
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 750.0,
                                maxHeight: 900.0,
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
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '6actum8c' /* Your Cart */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Kantumruy Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 12.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'czfamzfo' /* Below is the list of items in ... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Color(0xFF0B0001),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (_model.cartEmptied == false) {
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.537,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      0.0,
                                                                  color: Color(
                                                                      0xFFE0E3E7),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.0),
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
                                                                              .center,
                                                                      children: [
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
                                                                              height: 214.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 4.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    cartItemsItem.product.name,
                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                          fontFamily: 'Kantumruy Pro',
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 8.0, 12.0),
                                                                                    child: AutoSizeText(
                                                                                      cartItemsItem.product.description.maybeHandleOverflow(maxChars: 100),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Kantumruy Pro',
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
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
                                                                                                setState(() {
                                                                                                  _model.cartEmptied = true;
                                                                                                });
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
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'nus25p16' /* Remove */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
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
                                                                                                          if (FFAppState().checkoutCart.length <= 0) {
                                                                                                            setState(() {
                                                                                                              _model.cartEmptied = true;
                                                                                                            });
                                                                                                          } else {
                                                                                                            return;
                                                                                                          }

                                                                                                          return;
                                                                                                        }
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 46.0,
                                                                                                        height: 100.0,
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
                                                                                                        width: 46.0,
                                                                                                        height: 100.0,
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
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: Text(
                                                                                formatNumber(
                                                                                  cartItemsItem.totalPrice,
                                                                                  formatType: FormatType.custom,
                                                                                  currency: '\$',
                                                                                  format: '0.00',
                                                                                  locale: 'en_US',
                                                                                ),
                                                                                textAlign: TextAlign.end,
                                                                                style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      fontFamily: 'Kantumruy Pro',
                                                                                      fontSize: 30.0,
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
                                          );
                                        } else {
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 216.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .remove_shopping_cart_outlined,
                                                  color: Color(0xFFDDDDDD),
                                                  size: 80.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'wve0by8c' /* Cart is empty */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Kantumruy Pro',
                                                          color:
                                                              Color(0xFFDDDDDD),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          while (_model.itemIndex <
                                              FFAppState()
                                                  .checkoutCart
                                                  .length) {
                                            FFAppState().update(() {
                                              FFAppState()
                                                  .updateCheckoutCartAtIndex(
                                                _model.itemIndex,
                                                (e) => e..quantity = null,
                                              );
                                            });
                                            setState(() {
                                              _model.itemIndex =
                                                  _model.itemIndex + 1;
                                            });
                                          }
                                          FFAppState().update(() {
                                            FFAppState().sum = 0.0;
                                            FFAppState().discountAmount = 0.0;
                                            FFAppState().subTotal = 0.0;
                                            FFAppState().checkoutCart = [];
                                          });
                                          setState(() {
                                            _model.cartEmptied = true;
                                          });
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          're1f9ii7' /* Remove All */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Kantumruy Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'oibcjac7' /* Delivery Option For */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            'Kantumruy Pro',
                                                        fontSize: 30.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'fahvhc4m' /* User */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Kantumruy Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          height: 32.0,
                                          thickness: 2.0,
                                          color: Color(0xFFE0E3E7),
                                        ),
                                        Row(
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
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkboxTodayValue ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .checkboxTodayValue =
                                                      newValue!);
                                                  if (newValue!) {
                                                    setState(() {
                                                      _model.checkboxInstoreValue =
                                                          false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.checkboxInstoreValue =
                                                          true;
                                                    });
                                                  }
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            Icon(
                                              Icons.airport_shuttle_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 34.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qvpn00zq' /* Express delivery  */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    fontFamily: 'Kantumruy Pro',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkboxInstoreValue ??=
                                                        true,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .checkboxInstoreValue =
                                                          newValue!);
                                                      if (newValue!) {
                                                        setState(() {
                                                          _model.checkboxTodayValue =
                                                              false;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          _model.checkboxTodayValue =
                                                              true;
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
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.store_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 34.0,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'r01vjxdk' /* Pick Up in place */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Kantumruy Pro',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 30.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
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
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'fyljedv3' /* Order Summary */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 0.0, 12.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dmos5l7z' /* Below is a list of your items. */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 4.0, 0.0, 12.0),
                                              child: Text(
                                                FFAppState()
                                                    .checkoutCart
                                                    .length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 4.0, 0.0, 12.0),
                                              child: Text(
                                                _model.itemIndex.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
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
                                                    'a5qxqdc9' /* Price Breakdown */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'y9rqzu1i' /* Subtotal */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Color(
                                                                    0xFF14181B),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ytbg9zla' /* Discount */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: Color(
                                                                    0xFF14181B),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 8.0),
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
                                                            'lmu4tn6s' /* Total */,
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
                                                      _model.cartEmptied ==
                                                              false
                                                          ? formatNumber(
                                                              FFAppState().sum,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              currency: '\$',
                                                              format: '0.00',
                                                              locale: '',
                                                            )
                                                          : '0.00',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Kantumruy Pro',
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: (FFAppState()
                                                      .checkoutCart
                                                      .length <
                                                  1)
                                              ? null
                                              : () async {
                                                  setState(() {
                                                    _model.productList = [];
                                                  });
                                                  setState(() {
                                                    _model.productListIndex = 0;
                                                  });
                                                  while (
                                                      _model.productListIndex <
                                                          FFAppState()
                                                              .checkoutCart
                                                              .length) {
                                                    setState(() {
                                                      _model.addToProductList(
                                                          FFAppState()
                                                              .checkoutCart[_model
                                                                  .productListIndex]
                                                              .product);
                                                    });
                                                    setState(() {
                                                      _model.productListIndex =
                                                          _model.productListIndex +
                                                              1;
                                                    });
                                                  }

                                                  context.pushNamed(
                                                    'Checkout',
                                                    queryParameters: {
                                                      'deliveryOption':
                                                          serializeParam(
                                                        _model.checkboxTodayValue ==
                                                                true
                                                            ? 'Delivery By Today'
                                                            : 'Get In Place ',
                                                        ParamType.String,
                                                      ),
                                                      'isGetinplace':
                                                          serializeParam(
                                                        !(_model.checkboxInstoreValue ==
                                                                true
                                                            ? false
                                                            : true),
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'nzrnijv6' /* Continue to Checkout */,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 50.0,
                                            padding: EdgeInsets.all(0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                                BorderRadius.circular(9.0),
                                            disabledColor: Color(0xFFA3A3A3),
                                            hoverColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            hoverBorderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            hoverTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
            wrapWithModel(
              model: _model.footerModel,
              updateCallback: () => setState(() {}),
              child: FooterWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
