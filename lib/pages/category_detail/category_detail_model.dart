import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'category_detail_widget.dart' show CategoryDetailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryDetailModel extends FlutterFlowModel<CategoryDetailWidget> {
  ///  Local state fields for this page.

  List<dynamic> categoryData = [];
  void addToCategoryData(dynamic item) => categoryData.add(item);
  void removeFromCategoryData(dynamic item) => categoryData.remove(item);
  void removeAtIndexFromCategoryData(int index) => categoryData.removeAt(index);
  void insertAtIndexInCategoryData(int index, dynamic item) =>
      categoryData.insert(index, item);
  void updateCategoryDataAtIndex(int index, Function(dynamic) updateFn) =>
      categoryData[index] = updateFn(categoryData[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - filterCategoryAction] action in CategoryDetail widget.
  List<dynamic>? filteredContent;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
