import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

List<dynamic>? filterCategoryContents(
  List<dynamic> fullList,
  String? categoryName,
) {
  if (fullList.isEmpty || categoryName == null || categoryName.isEmpty) {
    return [];
  }

  final name = categoryName.trim().toLowerCase();

  final filtered = fullList.where((item) {
    if (item is! Map) return false;
    final cat = (item['category'] ?? '').toString().trim().toLowerCase();
    return cat == name;
  }).toList();

  // THIS IS THE KEY FIX:
  // Re-encode and decode each item so FlutterFlow gets clean Map<String, dynamic>
  final result = filtered.map((item) {
    return jsonDecode(jsonEncode(item));
  }).toList();

  print('MegaMotivation filter: returning ${result.length} items');
  return result;
}

String? formatShareText(
  String? title,
  String? content,
) {
  final t = title ?? '';
  final c = content ?? '';
  return '$t\n\n$c\n\n— From MegaMotivation\nIgnite Greatness Within';
}

String? getGreeting(String? displayName) {
  if (displayName == null || displayName.trim().isEmpty) {
    return 'Hello,';
  }
  return 'Hello ${displayName.trim()},';
}
