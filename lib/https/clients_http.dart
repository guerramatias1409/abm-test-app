import 'package:tots_core/tots_core.dart';
import 'package:test_app/entities/client.dart';
import 'package:test_app/utils/utils.dart';

class ClientsHttp {
  static Future<List<ClientEntity>> getClients({String? page}) async {
    return await TotsHttp.post(
      '/client/list',
      {
        "page": page ?? "1",
      },
      (data) {
        if (data['error'] != null) {
          throw FetchDataException(message: data['error']['message'] ?? '');
        }
        final responseData = data['response']['data'] as List<dynamic>;
        return responseData.map((item) => ClientEntity.fromJson(item)).toList();
      },
    );
  }

  static Future<void> addClient(Map<String, dynamic> clientData) async {
    try {
      await TotsHttp.post(
        '/client/save',
        clientData,
        (data) {
          if (data['error'] != null) {
            throw FetchDataException(message: data['error']['message'] ?? '');
          }
        },
      );
    } catch (e) {
      throw Exception();
    }
  }

  static Future<void> editClient(ClientEntity client) async {
    try {
      await TotsHttp.post(
        '/client/save',
        client.toJson(),
        (data) {
          if (data['error'] != null) {
            throw FetchDataException(message: data['error']['message'] ?? '');
          }
        },
      );
    } catch (e) {
      throw Exception();
    }
  }
}
