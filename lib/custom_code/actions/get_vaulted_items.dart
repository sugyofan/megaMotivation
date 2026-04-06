// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

Future<List<dynamic>> getVaultedItems(
  List<dynamic> fullList,
  String groupType,
) async {
  final vaulted = fullList.where((item) {
    if (item is! Map) return false;
    final isV = item['isVaulted'];
    if (isV is bool) return isV == true;
    if (isV is String) return isV.toLowerCase() == 'true';
    return false;
  }).toList();

  if (vaulted.isEmpty) return [];

  final now = DateTime.now();
  final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  final weekStart =
      DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);

  List<dynamic> result;

  if (groupType == 'thisWeek') {
    result = vaulted
        .where((item) {
          final savedStr = (item as Map)['savedDate']?.toString() ?? '';
          if (savedStr.isEmpty) return false;
          try {
            final savedDate = DateTime.parse(savedStr);
            return savedDate.isAfter(weekStart) ||
                savedDate.isAtSameMomentAs(weekStart);
          } catch (e) {
            return false;
          }
        })
        .map((e) => jsonDecode(jsonEncode(e)))
        .toList();
  } else {
    result = vaulted
        .where((item) {
          final savedStr = (item as Map)['savedDate']?.toString() ?? '';
          if (savedStr.isEmpty) return true;
          try {
            final savedDate = DateTime.parse(savedStr);
            return savedDate.isBefore(weekStart);
          } catch (e) {
            return true;
          }
        })
        .map((e) => jsonDecode(jsonEncode(e)))
        .toList();
  }

  // Sort by savedDate descending — newest first
  result.sort((a, b) {
    final aDate = (a is Map) ? (a['savedDate']?.toString() ?? '') : '';
    final bDate = (b is Map) ? (b['savedDate']?.toString() ?? '') : '';
    return bDate.compareTo(aDate);
  });

  return result;
}