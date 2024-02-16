import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tehnikpompa/app/modules/loginscreen/controllers/loginscreen_controller.dart';
import 'package:tehnikpompa/utils/baseService.dart';
import 'package:tehnikpompa/utils/constant.dart';

class CreateServices extends BaseService {
  LoginscreenController loginC = Get.put(LoginscreenController());
  //kurang multiple images
  Future<Response> createService(
      List<String> images,
      String serviceType,
      String namaService,
      String noTelp,
      String tipePompa,
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
    
    FormData form = FormData({
      'service_type': serviceType,
      'nama_service': namaService,
      'no_telp': noTelp,
      'lokasi': lokasi,
      'tipe_pompa' : tipePompa,
      'notes': notes,
      'jml_pompa': jmlPompa,
      'umur_pompa': umurPompa,
      'nama_cp': namaCp,
      'tlp_cp': telpCp,
      'rekomendasi_teknisi': rekomTeknisi,
      'teknisi1': teknisi1,
      'teknisi2': teknisi2,
      'userid': userId,
    });

    for(String path in images){
      form.files.add(MapEntry("image[]", MultipartFile(File(path), filename: '${DateTime.now().millisecondsSinceEpoch}')));     
    }

    String url = Constants.baseURL + 'insertService';
    String content = 'application/json';

    return post(url, form, contentType: content);
  }

    Future<Response> updateService(
      List<String> images,
      String serviceType,
      String namaService,
      String noTelp,
      String tipePompa,
      String lokasi,
      String notes,
      String jmlPompa,
      String umurPompa,
      String namaCp,
      String telpCp,
      String rekomTeknisi,
      String teknisi1,
      String teknisi2,
      String userId,
      String projectId) async {
    
    FormData form = FormData({
      'service_type': serviceType,
      'nama_service': namaService,
      'no_telp': noTelp,
      'lokasi': lokasi,
      'tipe_pompa' : tipePompa,
      'notes': notes,
      'jml_pompa': jmlPompa,
      'umur_pompa': umurPompa,
      'nama_cp': namaCp,
      'tlp_cp': telpCp,
      'rekomendasi_teknisi': rekomTeknisi,
      'teknisi1': teknisi1,
      'teknisi2': teknisi2,
      'userid': userId,
      'projectID': projectId
    });

    for(String path in images){
      form.files.add(MapEntry("image[]", MultipartFile(File(path), filename: '${DateTime.now().millisecondsSinceEpoch}')));     
    }

    String url = Constants.baseURL + 'updateStatus';
    String content = 'application/json';

    return post(url, form, contentType: content);
  }


}
