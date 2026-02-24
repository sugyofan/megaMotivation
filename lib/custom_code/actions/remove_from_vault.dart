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
Future<List<dynamic>> removeFromVault(
  List<dynamic> fullList,
  String motivationId,
) async {
  if (fullList.isEmpty || motivationId.isEmpty) {
    return fullList;
  }

  // Set isVaulted to false and remove savedDate
  final List<dynamic> updated = fullList.map((item) {
    final Map<String, dynamic> map = Map<String, dynamic>.from(
      item is Map ? item : jsonDecode(jsonEncode(item)),
    );

    if (map['id']?.toString() == motivationId) {
      map['isVaulted'] = false;
      map.remove('savedDate');
      print('MegaMotivation: Removed id "$motivationId" from vault');
    }

    return jsonDecode(jsonEncode(map));
  }).toList();

  return updated;
}
