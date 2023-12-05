import 'package:get/get.dart' as Getx;
import 'package:tehnikpompa/utils/constant.dart';

class BaseService extends Getx.GetConnect {
  BaseService() {
    timeout = const Duration(minutes: 2);
    maxAuthRetries = 3;
  }

  @override
  void onInit() {
    // add your local storage here to load for every request
    // var token = PrefController().token;
    //1.base_url
    httpClient.baseUrl = Constants.baseURL;
    //2.
    httpClient.defaultContentType = "application/json";
    // httpClient.timeout = Duration(seconds: 300);
    httpClient.addResponseModifier((request, response) async {
      print(response.body);
    });
    // httpClient.addRequestModifier((request) async {
    //   // add request here
    //   return request;
    // });
    // var headers = {'Authorization': "Bearer $token"};
    // httpClient.addAuthenticator((request) async {
    //   request.headers.addAll(headers);
    //   return request;
    // });

    super.onInit();
  }
}
