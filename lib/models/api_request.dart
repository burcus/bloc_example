
import 'package:bloc_example/utils/credentials.dart';

class ApiRequest {
  static const _authorization = Credentials.apiKey;
  static const _contentType = "application/json";

  static get authorization => _authorization;
  static get contentType => _contentType;
}