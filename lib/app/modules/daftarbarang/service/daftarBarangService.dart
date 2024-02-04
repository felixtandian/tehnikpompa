import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/controllers/daftarbarang_controller.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/daftarBarangModel.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/listKategoriModel.dart';
import 'package:tehnikpompa/utils/baseService.dart';
import 'package:tehnikpompa/utils/constant.dart';

class DaftarBarangService extends BaseService {
  DaftarbarangController barangC = Get.put(DaftarbarangController());
  Future<List<DaftarBarangModel>> getDaftarBarang(
      int lokasi, String key, String jenis, int page) async {
    try {
      String uri = Constants.baseURL + 'listBarang';
      Map<String, dynamic> body = {
        'lokasi': lokasi,
        'key': key,
        'kategori': jenis,
        'page': page,
      };

      var hasil = json.encode(body);

      log(body.toString());

      Response? resp = await post(
        uri,
        hasil,
      );
      log(resp.body.toString());
      List<DaftarBarangModel> response = [];
      if (resp.body['message'] == 'Berhasil') {
        var rawData = resp.body['data'];
        barangC.totalPage.value = resp.body['total_page'];
        barangC.currentPage.value = resp.body['current_page'];
        log('halamane : ' + barangC.totalPage.value.toString() + ' ' + barangC.currentPage.value.toString());
        rawData.forEach((element) {
          response.add(DaftarBarangModel.fromJson(element));
        });
      }

      return response;
    } catch (e) {
      throw (e);
    }

    
  }
  
  Future<List<KategoriModel>> getKategori() async {
    try {
      String uri = Constants.baseURL + 'listKategoriBarang';
      Map<String, dynamic> body = {
      };
      var hasil = json.encode(body);
      log(body.toString());
      Response? resp = await post(
        uri,
        hasil,
      );
      log(resp.body.toString());
      List<KategoriModel> response = [];
      if (resp.body['message'] == 'Berhasil') {
        var rawData = resp.body['data'];
        rawData.forEach((element) {
          response.add(KategoriModel.fromJson(element));
        });
      }
      return response;
    } catch (e) {
      throw (e);
    }
  }

}
