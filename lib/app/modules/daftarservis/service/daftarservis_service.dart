import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftaerServisSayaModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftarServisModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/teknisiAllModel.dart';
import 'package:tehnikpompa/utils/baseService.dart';
import 'package:tehnikpompa/utils/constant.dart';

class DaftarServisService extends BaseService {
  DaftarservisController servisC = Get.put(DaftarservisController());

  Future<List<DaftarServisModel>> getDaftarServis(
      int status, String namaProject, String date, int page) async {
    try {
      String uri = Constants.baseURL + 'listService';
      Map<String, dynamic> body = {
        'status': status,
        'nama_project': namaProject,
        'date': date,
        'page': page,
      };

      var hasil = json.encode(body);
      log(body.toString());
      Response? resp = await post(
        uri,
        hasil,
      );
      log(resp.body.toString());
      List<DaftarServisModel> response = [];
      if (resp.body['message'] == 'Berhasil') {
        log('awok');
        var rawData = resp.body['data'];
        servisC.totalPage.value = resp.body['total_page'];
        servisC.currentPage.value = resp.body['page'];
        log('halamane : ' +
            servisC.totalPage.value.toString() +
            ' ' +
            servisC.currentPage.value.toString());
        rawData.forEach((element) {
          response.add(DaftarServisModel.fromJson(element));
        });
      }

      return response;
    } catch (e) {
      throw (e);
    }
  }

  Future<List<DaftarTeknisiModel?>?> getListTeknisi() async {
    try {
      String uri = Constants.baseURL + 'listTeknisi';
      Map<String, dynamic> body = {};
      Response? respon = await post(uri, body);
      log('awokakakak' + json.toString());
      List<DaftarTeknisiModel?>? response = [];
      if (respon.body['message'] == 'Berhasil') {
        var rawData = respon.body['data'];
        rawData.forEach((element) {
          response.add(DaftarTeknisiModel.fromJson(element));
        });
      }

      return response;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<Response> updateStatusService(String serviceId, String status) async{
    var data = {
      "projectID" : serviceId,
      "status" : status
    };

    String url = Constants.baseURL + 'updateStatus';
    String content = 'application/json';

    return post(url, data, contentType: content);    
  }

  Future<Response> updateTeknisiService(String serviceId, String teknisi1, String teknisi2) async{
    var data = {
      "projectID" : serviceId,
      "teknisi1" : teknisi1,
      "teknisi2" : teknisi2
    };

    String url = Constants.baseURL + 'updateTeknisi';
    String content = 'application/json';

    return post(url, data, contentType: content);    
  }

  Future<Response> detailService(String serviceId) async {
    var data = {'serviceID': serviceId};

    String url = Constants.baseURL + 'detailService';
    String content = 'application/json';

    return post(url, data, contentType: content);
  }

  Future<List<DaftarServisSayaModel>> getDaftarServisUser(
      int roleId, int userId, int page) async {
    try {
      String uri = Constants.baseURL + 'userServices';
      Map<String, dynamic> body = {
        'role': roleId,
        'userID': userId,
        'page': page
      };

      var hasil = json.encode(body);
      log(body.toString());
      Response? resp = await post(
        uri,
        hasil,
      );
      log(resp.body.toString());
      List<DaftarServisSayaModel> response = [];
      if (resp.body['message'] == 'Berhasil') {
        log('awok');
        var rawData = resp.body['data'];
        servisC.totalPage.value = resp.body['total_page'];
        servisC.currentPage.value = resp.body['page'];
        log('halamane : ' +
            servisC.totalPage.value.toString() +
            ' ' +
            servisC.currentPage.value.toString());
        rawData.forEach((element) {
          response.add(DaftarServisSayaModel.fromJson(element));
        });
      }

      return response;
    } catch (e) {
      throw (e);
    }
  }
}
