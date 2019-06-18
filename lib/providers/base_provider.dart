import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AppState with ChangeNotifier {
  bool  _isLoading = false;

  get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    var response = await http.get("https://reqres.in/api/users?per_page=20");
    if (response.statusCode == 200) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
