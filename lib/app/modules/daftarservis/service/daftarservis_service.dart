import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftarServisModel.dart';
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
      if (resp.body['message'] == 'Sukses') {
        log('awok');
        var rawData = resp.body['data'];
        servisC.totalPage.value = resp.body['total_page'];
        servisC.currentPage.value = resp.body['current_page'];
        log('halamane : ' + servisC.totalPage.value.toString() + ' ' + servisC.currentPage.value.toString());
        rawData.forEach((element) {
          response.add(DaftarServisModel.fromJson(element));
        });
      }

      return response;
    } catch (e) {
      throw (e);
    }

    
  }

}
