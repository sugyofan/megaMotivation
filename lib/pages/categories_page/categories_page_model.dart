import '/components/category_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'categories_page_widget.dart' show CategoriesPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoriesPageModel extends FlutterFlowModel<CategoriesPageWidget> {
  ///  Local state fields for this page.
  /// midnightBlue
  Color? primaryColor1 = Color(4278849324);

  /// royalGold
  Color? primaryColor2 = Color(4292128567);

  /// CategoryData
  List<dynamic> categoryData = [];
  void addToCategoryData(dynamic item) => categoryData.add(item);
  void removeFromCategoryData(dynamic item) => categoryData.remove(item);
  void removeAtIndexFromCategoryData(int index) => categoryData.removeAt(index);
  void insertAtIndexInCategoryData(int index, dynamic item) =>
      categoryData.insert(index, item);
  void updateCategoryDataAtIndex(int index, Function(dynamic) updateFn) =>
      categoryData[index] = updateFn(categoryData[index]);

  ///  State fields for stateful widgets in this page.

  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel1;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel2;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel3;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel4;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel5;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel6;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel7;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel8;

  @override
  void initState(BuildContext context) {
    categoryCardModel1 = createModel(context, () => CategoryCardModel());
    categoryCardModel2 = createModel(context, () => CategoryCardModel());
    categoryCardModel3 = createModel(context, () => CategoryCardModel());
    categoryCardModel4 = createModel(context, () => CategoryCardModel());
    categoryCardModel5 = createModel(context, () => CategoryCardModel());
    categoryCardModel6 = createModel(context, () => CategoryCardModel());
    categoryCardModel7 = createModel(context, () => CategoryCardModel());
    categoryCardModel8 = createModel(context, () => CategoryCardModel());
  }

  @override
  void dispose() {
    categoryCardModel1.dispose();
    categoryCardModel2.dispose();
    categoryCardModel3.dispose();
    categoryCardModel4.dispose();
    categoryCardModel5.dispose();
    categoryCardModel6.dispose();
    categoryCardModel7.dispose();
    categoryCardModel8.dispose();
  }
}
