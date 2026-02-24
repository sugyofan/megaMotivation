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
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<List<dynamic>> toggleVaultStatus(
  List<dynamic> fullList,
  String motivationId,
  bool saveToVault,
) async {
  print('=== TOGGLE VAULT DEBUG ===');
  print('fullList length: ${fullList.length}');
  print('motivationId: "$motivationId"');
  print('saveToVault: $saveToVault');

  if (fullList.isEmpty || motivationId.isEmpty) {
    print('TOGGLE: returning early — empty list or id');
    return fullList;
  }

  final now = DateTime.now().toIso8601String();
  bool found = false;

  final List<dynamic> updated = fullList.map((item) {
    final Map<String, dynamic> map = Map<String, dynamic>.from(
      item is Map ? item : jsonDecode(jsonEncode(item)),
    );

    if (map['id']?.toString() == motivationId) {
      found = true;
      print('TOGGLE: FOUND item with id "$motivationId"');
      print(
          'TOGGLE: BEFORE — isVaulted=${map['isVaulted']}, savedDate=${map['savedDate']}');
      map['isVaulted'] = saveToVault;
      if (saveToVault) {
        map['savedDate'] = now;
      } else {
        map.remove('savedDate');
      }
      print(
          'TOGGLE: AFTER — isVaulted=${map['isVaulted']}, savedDate=${map['savedDate']}');
    }

    return jsonDecode(jsonEncode(map));
  }).toList();

  if (!found) {
    print('TOGGLE: WARNING — item with id "$motivationId" NOT FOUND in list!');
  }

  // Count vaulted items
  final vaultedCount = updated.where((item) {
    if (item is Map) return item['isVaulted'] == true;
    return false;
  }).length;
  print('TOGGLE: total vaulted items after update: $vaultedCount');
  print('=== END TOGGLE DEBUG ===');

  return updated;
}
