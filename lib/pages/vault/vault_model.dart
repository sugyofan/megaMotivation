import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'vault_widget.dart' show VaultWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VaultModel extends FlutterFlowModel<VaultWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getVaultedItems] action in Vault widget.
  List<dynamic>? weekResult;
  // Stores action output result for [Custom Action - getVaultedItems] action in Vault widget.
  List<dynamic>? earlierResult;
  // Stores action output result for [Custom Action - removeFromVault] action in IconButton widget.
  List<dynamic>? updatedResult;
  // Stores action output result for [Custom Action - getVaultedItems] action in IconButton widget.
  List<dynamic>? weekResult2;
  // Stores action output result for [Custom Action - removeFromVault] action in IconButton widget.
  List<dynamic>? updatedEarlyResult;
  // Stores action output result for [Custom Action - getVaultedItems] action in IconButton widget.
  List<dynamic>? earlierResult2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
