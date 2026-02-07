import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  static const String _keyPrefix = 'stadion_diary_';

  static Future<void> saveMatch(String leagueName, String data) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> entries = prefs.getStringList(_keyPrefix + leagueName) ?? [];
    entries.add(data);
    await prefs.setStringList(_keyPrefix + leagueName, entries);
  }

  static Future<List<String>> getMatches(String leagueName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyPrefix + leagueName) ?? [];
  }
}