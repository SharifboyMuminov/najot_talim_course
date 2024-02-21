import 'package:default_project/data/network/api_preovider.dart';

import '../moduls/network_response.dart';

class CompyuterRepository {
  Future<NetworkResponse> fitchAll() => ApiPreovider.fitchAll();
}
