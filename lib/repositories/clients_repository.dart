import 'package:test_app/entities/client.dart';
import 'package:test_app/https/clients_http.dart';

abstract class IClientsRepository {
  Future<List<ClientEntity>> getClients({String? page});
  Future<void> addClient(Map<String, dynamic> clientData);
  Future<void> editClient(ClientEntity client);
}

class ClientsRepositoryImpl implements IClientsRepository {
  @override
  Future<List<ClientEntity>> getClients({
    String? page,
  }) =>
      ClientsHttp.getClients(page: page);

  @override
  Future<void> addClient(Map<String, dynamic> clientData) =>
      ClientsHttp.addClient(clientData);

  @override
  Future<void> editClient(ClientEntity client) =>
      ClientsHttp.editClient(client);
}
