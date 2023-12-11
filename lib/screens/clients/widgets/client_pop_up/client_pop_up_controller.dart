import 'package:flutter/material.dart';
import 'package:tots_core/tots_core.dart';
import 'package:test_app/entities/entities.dart';
import 'package:test_app/repositories/repositories.dart';
import 'package:test_app/utils/exceptions.dart';

class ClientPopUpController extends ChangeNotifierWithLoading {
  ClientPopUpController({required this.repository});

  final IClientsRepository repository;

  ClientEntity? selectedClient;
  bool actionSucceded = false;
  String? error;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  setData(ClientEntity? client) {
    error = null;
    isLoading = false;
    actionSucceded = false;
    selectedClient = client;

    setTextControllersValues();
  }

  setError(String message) {
    isLoading = false;
    error = message;
    notifyListeners();
  }

  clearError() {
    error = null;
    notifyListeners();
  }

  update() => notifyListeners();

  void setTextControllersValues() {
    if (selectedClient == null) {
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      return;
    }
    firstNameController.text = selectedClient!.firstName;
    lastNameController.text = selectedClient!.lastName;
    emailController.text = selectedClient!.email;
  }

  saveAction() {
    if (!validateControllers()) return;
    selectedClient != null ? editClient() : addNewClient();
  }

  addNewClient() async {
    actionSucceded = false;
    showLoading();
    try {
      final clientData = {
        'firstname': firstNameController.text,
        'lastname': lastNameController.text,
        'email': emailController.text,
        'address': "",
        'photo': "",
        'caption': "",
      };

      await repository.addClient(clientData);
      actionSucceded = true;
      update();
    } on FetchDataException catch (error) {
      setError(error.toString());
    } catch (e) {
      setError("Error saving info. Please try again later...");
    }
  }

  editClient() async {
    actionSucceded = false;
    if (selectedClient == null) return;

    showLoading();
    try {
      final updatedClientData = ClientEntity(
        id: selectedClient!.id,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        address: selectedClient!.address,
        photo: selectedClient!.photo,
        caption: selectedClient!.caption,
      );

      await repository.editClient(updatedClientData);
      actionSucceded = true;
      update();
    } on FetchDataException catch (error) {
      setError(error.toString());
    } catch (e) {
      setError("Error saving info. Please try again later...");
    }
  }

  bool validateControllers() {
    return formKey.currentState?.validate() ?? false;
  }
}
