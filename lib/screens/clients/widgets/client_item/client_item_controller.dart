import 'package:flutter/material.dart';

class ClientItemController extends ChangeNotifier {
  ClientItemController();

  bool showEditButton = false;

  changeShowEditButtonValue({bool? value}) {
    showEditButton = value ?? !showEditButton;
    notifyListeners();
  }
}
