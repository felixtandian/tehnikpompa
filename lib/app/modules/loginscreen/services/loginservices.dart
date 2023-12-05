import 'package:get/get.dart';
import 'package:tehnikpompa/utils/baseService.dart';
import 'package:tehnikpompa/utils/constant.dart';

class LoginServices extends BaseService {
  Future<Response> loginService(String email, String password) async {
    var data = {'email': email, 'password': password};

    String url = Constants.baseURL + 'login';
    String content = 'application/json';

    return post(url, data, contentType: content);
  }
}
