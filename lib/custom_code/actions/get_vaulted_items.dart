// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
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
  print('=== GET VAULTED DEBUG ===');
  print('fullList length: ${fullList.length}');
  print('groupType: "$groupType"');

  // Print vault status of every item
  for (int i = 0; i < fullList.length; i++) {
    final item = fullList[i];
    if (item is Map) {
      print(
          'VAULT CHECK item[$i]: id=${item['id']}, isVaulted=${item['isVaulted']} (${item['isVaulted'].runtimeType}), savedDate=${item['savedDate']}');
    } else {
      print('VAULT CHECK item[$i]: NOT a Map, type=${item.runtimeType}');
    }
  }

  final vaulted = fullList.where((item) {
    if (item is! Map) return false;
    final isV = item['isVaulted'];
    // Handle both bool and string "true"/"false"
    if (isV is bool) return isV == true;
    if (isV is String) return isV.toLowerCase() == 'true';
    return false;
  }).toList();

  print('VAULT: total vaulted items: ${vaulted.length}');

  if (vaulted.isEmpty) {
    print('VAULT: no vaulted items found — returning empty list');
    print('=== END GET VAULTED DEBUG ===');
    return [];
  }

  final now = DateTime.now();
  final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  final weekStart =
      DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
  print('VAULT: weekStart = $weekStart');

  List<dynamic> result;

  if (groupType == 'thisWeek') {
    result = vaulted
        .where((item) {
          final savedStr = (item as Map)['savedDate']?.toString() ?? '';
          if (savedStr.isEmpty) return false;
          try {
            final savedDate = DateTime.parse(savedStr);
            final inWeek = savedDate.isAfter(weekStart) ||
                savedDate.isAtSameMomentAs(weekStart);
            print('VAULT thisWeek check: savedDate=$savedDate, inWeek=$inWeek');
            return inWeek;
          } catch (e) {
            print('VAULT thisWeek: parse error for "$savedStr": $e');
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
            final isEarlier = savedDate.isBefore(weekStart);
            print(
                'VAULT earlier check: savedDate=$savedDate, isEarlier=$isEarlier');
            return isEarlier;
          } catch (e) {
            print('VAULT earlier: parse error for "$savedStr": $e');
            return true;
          }
        })
        .map((e) => jsonDecode(jsonEncode(e)))
        .toList();
  }

  print('VAULT: returning ${result.length} items for "$groupType"');
  if (result.isNotEmpty) {
    print('VAULT: first item = ${result[0]}');
  }
  print('=== END GET VAULTED DEBUG ===');

  return result;
}
