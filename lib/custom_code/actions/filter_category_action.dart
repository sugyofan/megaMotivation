// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';

Future<List<dynamic>> filterCategoryAction(
  List<dynamic> fullList,
  String categoryName,
) async {
  if (fullList.isEmpty || categoryName.isEmpty) return [];

  final name = categoryName.trim().toLowerCase();

  final filtered = fullList.where((item) {
    if (item is! Map) return false;
    final cat = (item['category'] ?? '').toString().trim().toLowerCase();
    return cat == name;
  }).toList();

  // Force clean types
  final result = filtered.map((item) => jsonDecode(jsonEncode(item))).toList();

  print('MegaMotivation action: returning ${result.length} items');
  print('MegaMotivation filter: returning ${result[0]['id']} id');
  print('MegaMotivation filter: returning ${result[0]['title']} title');
  print('MegaMotivation filter: returning ${result[0]['category']} category');
  return result;
}
