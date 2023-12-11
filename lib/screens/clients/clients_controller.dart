import 'package:flutter/material.dart';
import 'package:tots_core/tots_core.dart';
import 'package:test_app/entities/client.dart';
import 'package:test_app/repositories/clients_repository.dart';

class ClientsController extends ChangeNotifierWithLoading {
  ClientsController({required this.repository});

  final IClientsRepository repository;

  String? error;
  ScrollController listScrollController = ScrollController();
  List<ClientEntity> clientsList = [];
  List<ClientEntity> filteredClients = [];
  bool showFilteredList = false;
  int visibleItemsCount = 5;
  int currentPage = 1;

  loadClients({bool resetList = true}) async {
    if (resetList) clientsList.clear();
    showLoading();
    try {
      final response = await repository.getClients(
        page: currentPage.toString(),
      );
      clientsList.addAll(response);
      error = null;
    } catch (e) {
      error = "Couldn't obtain data. Please try again";
    } finally {
      hideLoading();
    }
  }

  showMoreClients() {
    if (visibleItemsCount >= clientsList.length) {
      currentPage++;
      loadClients(resetList: false);
    }
    visibleItemsCount += 5;
    notifyListeners();
    goToEndOfList();
  }

  goToEndOfList() async {
    await listScrollController.animateTo(
      listScrollController.position.extentTotal,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  filterList(String? value) {
    if (value == null || value.isEmpty) {
      filteredClients.clear();
      showFilteredList = false;
      notifyListeners();
      return;
    }
    filteredClients = clientsList
        .where(
          (client) =>
              client.firstName.toLowerCase().contains(value.toLowerCase()) ||
              client.firstName.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    showFilteredList = true;
    notifyListeners();
  }
}
