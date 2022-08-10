import 'package:flutter/material.dart';
import 'package:flutterdevs/repository/repository.dart';

class HomeProvider extends ChangeNotifier {
  bool emailSubmitted = false;
  final Repository repository;

  HomeProvider({
    required this.repository,
  });

  Future<void> notifyMe({required String email}) async {
    repository.subscribe(email);
    emailSubmitted = true;
    notifyListeners();
  }
}
