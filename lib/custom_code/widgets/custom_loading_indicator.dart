// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomLoadingIndicator extends StatefulWidget {
  const CustomLoadingIndicator({
    Key? key,
    this.width,
    this.height,
    this.valueColor,
    this.strokeWidth,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? valueColor;
  final double? strokeWidth;

  @override
  _CustomLoadingIndicatorState createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width ?? 50,
        height: widget.height ?? 50,
        child: CircularProgressIndicator(
          strokeWidth: widget.strokeWidth ?? 4.0,
          valueColor:
              AlwaysStoppedAnimation<Color>(widget.valueColor ?? Colors.black),
        ),
      ),
    );
  }
}
