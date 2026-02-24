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
// Save vault state (call after every toggle)
import 'package:shared_preferences/shared_preferences.dart';

Future persistVaultState(List<dynamic> fullList) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = jsonEncode(fullList);
  await prefs.setString('categoryContents', jsonString);
  print('MegaMotivation: Persisted ${fullList.length} items to local storage');
}
