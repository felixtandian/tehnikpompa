import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/daftarBarangModel.dart';
import 'package:tehnikpompa/utils/baseService.dart';
import 'package:tehnikpompa/utils/constant.dart';

class DaftarBarangService extends BaseService {
  Future<List<DaftarBarangModel>> getDaftarBarang(
      int lokasi, String key, String jenis, int page) async {
    try {
      String uri = Constants.baseURL + 'listBarang';
      Map<String, dynamic> body = {
        'lokasi': lokasi,
        'key': key,
        'jenis': jenis,
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

        rawData.forEach((element) {
          response.add(DaftarBarangModel.fromJson(element));
        });
      }

      return response;
    } catch (e) {
      throw (e);
    }
  }
}
