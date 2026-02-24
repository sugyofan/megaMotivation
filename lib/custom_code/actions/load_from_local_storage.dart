// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:shared_preferences/shared_preferences.dart';

/// Set your action name, define your arguments and return parameter, and then
/// add the boilerplate code using the green button on the right!
///
/// Load on app start (call on home page load)
Future<List<dynamic>> loadFromLocalStorage() async {
  final prefs = await SharedPreferences.getInstance();
  final stored = prefs.getString('categoryContents');

  if (stored != null && stored.isNotEmpty) {
    final decoded = jsonDecode(stored);
    if (decoded is List) {
      print(
          'MegaMotivation: Loaded ${decoded.length} items from local storage');
      return decoded.map((e) => jsonDecode(jsonEncode(e))).toList();
    }
  }

  print('MegaMotivation: No local data, will load from URL');
  return [];
}
