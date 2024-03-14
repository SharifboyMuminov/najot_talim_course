import 'package:default_project/data/models/network_response.dart';
import 'package:default_project/data/network/api_provider.dart';

class UserRepository {
  Future<NetworkResponse> getAllUser() async => ApiProvider.getAllUsers();
}
