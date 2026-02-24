// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
// In your loadBoostsFromAsset custom action:

Future<List<dynamic>> loadBoostsIfNeeded(
  List<dynamic> existingData,
  int currentVersion, // pass this from App State (persisted)
) async {
  const int latestVersion = 2; // bump this number whenever you update the JSON

  const String url =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mega-motivation-ydk0kj/assets/45jj1oq1d52a/contents.json';

  // Use persisted data ONLY if version matches
  if (existingData.isNotEmpty && currentVersion == latestVersion) {
    print(
        'MegaMotivation: Using persisted data (${existingData.length} items, v$currentVersion)');
    return existingData.map((e) => jsonDecode(jsonEncode(e))).toList();
  }

  // Version mismatch or no data — force re-fetch
  print(
      'MegaMotivation: Fetching fresh data (persisted v$currentVersion, latest v$latestVersion)...');

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print('MegaMotivation: HTTP ${response.statusCode}');
      return existingData; // fall back to old data if fetch fails
    }
    final String jsonString = response.body;
    if (jsonString.trim().isEmpty) return existingData;

    final decoded = jsonDecode(jsonString);
    final list = (decoded is List) ? decoded : [decoded];
    final typed = list.map((item) => jsonDecode(jsonEncode(item))).toList();
    print('MegaMotivation: Loaded ${typed.length} fresh items');

    // IMPORTANT: After this returns, update App State:
    // 1. Set your data list App State to the returned list
    // 2. Set contentVersion App State to latestVersion (2)

    return typed;
  } catch (e) {
    print('MegaMotivation: Error: $e');
    return existingData;
  }
}
