import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _categoryContents = prefs.getStringList('ff_categoryContents')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _categoryContents;
    });
    _safeInit(() {
      _weekVaultItems = prefs.getStringList('ff_weekVaultItems')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _weekVaultItems;
    });
    _safeInit(() {
      _earlierVaultItems =
          prefs.getStringList('ff_earlierVaultItems')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _earlierVaultItems;
    });
    _safeInit(() {
      _displayName = prefs.getString('ff_displayName') ?? _displayName;
    });
    _safeInit(() {
      _contentVersion = prefs.getInt('ff_contentVersion') ?? _contentVersion;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _categoryContents = [];
  List<dynamic> get categoryContents => _categoryContents;
  set categoryContents(List<dynamic> value) {
    _categoryContents = value;
    prefs.setStringList(
        'ff_categoryContents', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCategoryContents(dynamic value) {
    categoryContents.add(value);
    prefs.setStringList('ff_categoryContents',
        _categoryContents.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCategoryContents(dynamic value) {
    categoryContents.remove(value);
    prefs.setStringList('ff_categoryContents',
        _categoryContents.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCategoryContents(int index) {
    categoryContents.removeAt(index);
    prefs.setStringList('ff_categoryContents',
        _categoryContents.map((x) => jsonEncode(x)).toList());
  }

  void updateCategoryContentsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    categoryContents[index] = updateFn(_categoryContents[index]);
    prefs.setStringList('ff_categoryContents',
        _categoryContents.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCategoryContents(int index, dynamic value) {
    categoryContents.insert(index, value);
    prefs.setStringList('ff_categoryContents',
        _categoryContents.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _categoryDatailsData = [];
  List<dynamic> get categoryDatailsData => _categoryDatailsData;
  set categoryDatailsData(List<dynamic> value) {
    _categoryDatailsData = value;
  }

  void addToCategoryDatailsData(dynamic value) {
    categoryDatailsData.add(value);
  }

  void removeFromCategoryDatailsData(dynamic value) {
    categoryDatailsData.remove(value);
  }

  void removeAtIndexFromCategoryDatailsData(int index) {
    categoryDatailsData.removeAt(index);
  }

  void updateCategoryDatailsDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    categoryDatailsData[index] = updateFn(_categoryDatailsData[index]);
  }

  void insertAtIndexInCategoryDatailsData(int index, dynamic value) {
    categoryDatailsData.insert(index, value);
  }

  List<dynamic> _weekVaultItems = [];
  List<dynamic> get weekVaultItems => _weekVaultItems;
  set weekVaultItems(List<dynamic> value) {
    _weekVaultItems = value;
    prefs.setStringList(
        'ff_weekVaultItems', value.map((x) => jsonEncode(x)).toList());
  }

  void addToWeekVaultItems(dynamic value) {
    weekVaultItems.add(value);
    prefs.setStringList('ff_weekVaultItems',
        _weekVaultItems.map((x) => jsonEncode(x)).toList());
  }

  void removeFromWeekVaultItems(dynamic value) {
    weekVaultItems.remove(value);
    prefs.setStringList('ff_weekVaultItems',
        _weekVaultItems.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromWeekVaultItems(int index) {
    weekVaultItems.removeAt(index);
    prefs.setStringList('ff_weekVaultItems',
        _weekVaultItems.map((x) => jsonEncode(x)).toList());
  }

  void updateWeekVaultItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    weekVaultItems[index] = updateFn(_weekVaultItems[index]);
    prefs.setStringList('ff_weekVaultItems',
        _weekVaultItems.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInWeekVaultItems(int index, dynamic value) {
    weekVaultItems.insert(index, value);
    prefs.setStringList('ff_weekVaultItems',
        _weekVaultItems.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _earlierVaultItems = [];
  List<dynamic> get earlierVaultItems => _earlierVaultItems;
  set earlierVaultItems(List<dynamic> value) {
    _earlierVaultItems = value;
    prefs.setStringList(
        'ff_earlierVaultItems', value.map((x) => jsonEncode(x)).toList());
  }

  void addToEarlierVaultItems(dynamic value) {
    earlierVaultItems.add(value);
    prefs.setStringList('ff_earlierVaultItems',
        _earlierVaultItems.map((x) => jsonEncode(x)).toList());
  }

  void removeFromEarlierVaultItems(dynamic value) {
    earlierVaultItems.remove(value);
    prefs.setStringList('ff_earlierVaultItems',
        _earlierVaultItems.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromEarlierVaultItems(int index) {
    earlierVaultItems.removeAt(index);
    prefs.setStringList('ff_earlierVaultItems',
        _earlierVaultItems.map((x) => jsonEncode(x)).toList());
  }

  void updateEarlierVaultItemsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    earlierVaultItems[index] = updateFn(_earlierVaultItems[index]);
    prefs.setStringList('ff_earlierVaultItems',
        _earlierVaultItems.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInEarlierVaultItems(int index, dynamic value) {
    earlierVaultItems.insert(index, value);
    prefs.setStringList('ff_earlierVaultItems',
        _earlierVaultItems.map((x) => jsonEncode(x)).toList());
  }

  dynamic _todayMotivation;
  dynamic get todayMotivation => _todayMotivation;
  set todayMotivation(dynamic value) {
    _todayMotivation = value;
  }

  /// Homepage screen,
  String _displayName = '';
  String get displayName => _displayName;
  set displayName(String value) {
    _displayName = value;
    prefs.setString('ff_displayName', value);
  }

  int _contentVersion = 0;
  int get contentVersion => _contentVersion;
  set contentVersion(int value) {
    _contentVersion = value;
    prefs.setInt('ff_contentVersion', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
