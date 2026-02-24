import '/components/icon_text_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  ///  Local state fields for this page.
  /// midnightBlue
  Color? primaryColor1 = Color(4278849324);

  /// royalGold
  Color? primaryColor2 = Color(4292128567);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - loadBoostsIfNeeded] action in HomeScreen widget.
  List<dynamic>? loadedContents;
  // Stores action output result for [Custom Action - getRandomMotivation] action in HomeScreen widget.
  dynamic? todayBoost;
  // Model for IconTextButton component.
  late IconTextButtonModel iconTextButtonModel1;
  // Stores action output result for [Custom Action - toggleVaultStatus] action in IconTextButton widget.
  List<dynamic>? updatedContents;
  // Model for IconTextButton component.
  late IconTextButtonModel iconTextButtonModel2;
  // Model for IconTextButton component.
  late IconTextButtonModel iconTextButtonModel3;
  // Stores action output result for [Custom Action - getRandomMotivation] action in IconTextButton widget.
  dynamic? todayBoostByClick;

  @override
  void initState(BuildContext context) {
    iconTextButtonModel1 = createModel(context, () => IconTextButtonModel());
    iconTextButtonModel2 = createModel(context, () => IconTextButtonModel());
    iconTextButtonModel3 = createModel(context, () => IconTextButtonModel());
  }

  @override
  void dispose() {
    iconTextButtonModel1.dispose();
    iconTextButtonModel2.dispose();
    iconTextButtonModel3.dispose();
  }
}
