import 'package:get/get.dart';
import 'package:tehnikpompa/utils/baseService.dart';
import 'package:tehnikpompa/utils/constant.dart';

class CreateServices extends BaseService {

  //kurang multiple images
  Future<Response> createService(
      /*String images,*/
      String serviceType,
      String namaService,
      String noTelp,
      String lokasi,
      String notes,
      String jmlPompa,
      String umurPompa,
      String namaCp,
      String telpCp,
      String rekomTeknisi,
      String teknisi1,
      String teknisi2,
      String userId) async {
    var data = {
      //'images' = '',
      'service_type': serviceType,
      'nama_service': namaService,
      'no_telp': noTelp,
      'lokasi': lokasi,
      'notes': notes,
      'jml_pompa': jmlPompa,
      'umur_pompa': umurPompa,
      'nama_cp': namaCp,
      'tlp_cp': telpCp,
      'rekomendasi_teknisi': rekomTeknisi,
      'teknisi1': teknisi1,
      'teknisi2': teknisi2,
      'userid': 1
    };

    String url = Constants.baseURL + 'login';
    String content = 'application/json';

    return post(url, data, contentType: content);
  }

}
