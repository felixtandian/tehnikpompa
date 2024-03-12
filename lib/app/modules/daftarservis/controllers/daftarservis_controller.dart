import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:tehnikpompa/app/modules/daftarservis/bindings/daftarservis_binding.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftaerServisSayaModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftarServisModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/detailServiceModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/responHeader.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/responViewDetail.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/teknisiAllModel.dart';
import 'package:tehnikpompa/app/modules/daftarservis/service/daftarservis_service.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/detailServis.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/mobile.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/responDetail.dart';
import 'package:tehnikpompa/app/modules/home/bindings/home_binding.dart';
import 'package:tehnikpompa/app/modules/home/views/home_view.dart';
import 'package:tehnikpompa/utils/messageUtils.dart';

class DaftarservisController extends GetxController {
  //TODO: Implement DaftarservisController

  List<List<String>> listsData = [
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'BUDI'],
    ['SEMARANG', '2023-11-14', 'SEMARANG', 'PENDING', 'AGUS'],
    ['YOGYAKARTA', '2023-11-14', 'YOGYAKARTA', 'PENDING', 'RIO'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'TOMMY'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'YUDI'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'NICHO'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'NICO'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'FELIX'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'IVAN'],
    ['SOLO', '2023-11-14', 'SOLO', 'PENDING', 'LUDWIG'],
  ];

  TextEditingController teknisi1 = TextEditingController();
  TextEditingController teknisi1Id = TextEditingController();
  TextEditingController teknisi2 = TextEditingController();
  TextEditingController teknisi2Id = TextEditingController();
  TextEditingController key1 = TextEditingController();
  TextEditingController key2 = TextEditingController();

  TextEditingController tglKerjaTeknisi = TextEditingController();
  TextEditingController jmlPompaTeknisi = TextEditingController();
  TextEditingController ketPompaTeknisi = TextEditingController();

  TextEditingController tipePompa = TextEditingController();
  TextEditingController partNumber = TextEditingController();
  TextEditingController ketPompa = TextEditingController();
  TextEditingController isolasi1 = TextEditingController();
  TextEditingController isolasi2 = TextEditingController();
  TextEditingController isolasi3 = TextEditingController();
  TextEditingController voltstby1 = TextEditingController();
  TextEditingController voltstby2 = TextEditingController();
  TextEditingController voltstby3 = TextEditingController();
  TextEditingController voltstby4 = TextEditingController();
  TextEditingController voltsr1 = TextEditingController();
  TextEditingController voltsr2 = TextEditingController();
  TextEditingController voltsr3 = TextEditingController();
  TextEditingController voltsr4 = TextEditingController();
  TextEditingController amp1 = TextEditingController();
  TextEditingController amp2 = TextEditingController();
  TextEditingController amp3 = TextEditingController();
  TextEditingController kthn1 = TextEditingController();
  TextEditingController kthn2 = TextEditingController();
  TextEditingController kthn3 = TextEditingController();
  TextEditingController power = TextEditingController();
  TextEditingController konfklien = TextEditingController();
  RxList<XFile>? imagefiles = <XFile>[].obs;
  var p = 1.obs;
  var ubahService = false;
  Rx<TextEditingController> searchTextController = TextEditingController().obs;
  ScrollController scrollController = ScrollController();
  RxInt totalPage = 0.obs;
  RxInt currentPage = 1.obs;
  var daftarServisModel = <DaftarServisModel?>[].obs;
  var daftarServisSayaModel = <DaftarServisSayaModel?>[].obs;
  var responViewDetailModel = <ResponViewDetailModel?>[].obs;
  var responViewDetailModelImages = <ImageResponViewDetail?>[].obs;
  DetailServisModel? detailServisModel;
  ResponHeaderModel? responHeaderModel;
  late List<int> bytes;
  var responId = ''.obs;
  final selectedStatus = 1.obs;
  late Rx<TextEditingController> date;
  final Rx<DateTime>? selectedDate = DateTime.now().obs;
  var isLoading = false.obs;
  var listTeknisi1Search = <DaftarTeknisiModel?>[].obs;
  var listTeknisi2Search = <DaftarTeknisiModel?>[].obs;
  var listTeknisi1 = <DaftarTeknisiModel?>[].obs;
  var listTeknisi2 = <DaftarTeknisiModel?>[].obs;
  final ImagePicker imgpicker = ImagePicker();
  RxList<String> listImagePath = <String>[].obs;
  var selectedFileCount = 0.obs;
  var namaFile;

  RxList<DropdownMenuItem<int>> get dropdownItems2 {
    List<DropdownMenuItem<int>> menuItems = [
      const DropdownMenuItem(child: Text("Pending"), value: 1),
      const DropdownMenuItem(child: Text("Assigned"), value: 2),
      const DropdownMenuItem(child: Text("Unfinished"), value: 3),
      const DropdownMenuItem(child: Text("Finished"), value: 4),
      const DropdownMenuItem(child: Text("Canceled"), value: 5),
      const DropdownMenuItem(child: Text("Deleted"), value: 6),
    ];
    return menuItems.obs;
  }

  void openImages() async {
    try {
      imagefiles!.value = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (imagefiles! != null) {
        for (XFile file in imagefiles!) {
          listImagePath.add(file.path);
        }
      } else {
        Fluttertoast.showToast(msg: "No image is selected.");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "error while picking file.");
    }
    selectedFileCount.value = listImagePath.length;
  }

  void setSelected(int value) {
    selectedStatus.value = value;
  }

  final count = 0.obs;
  @override
  void onInit() {
    date = TextEditingController().obs;
    date.value.text = '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void clear() {
    teknisi1.clear();
    teknisi1Id.clear();
    teknisi1Id.clear();
    setSelected(1);
    teknisi2.clear();
    teknisi2Id.clear();
    key1.clear();
    key2.clear();
    searchTextController.value.clear();
  }

  void detailReponClear() {
    tipePompa.clear();
    partNumber.clear();
    ketPompa.clear();
    konfklien.clear();
    power.clear();
    isolasi1.clear();
    isolasi2.clear();
    isolasi3.clear();
    voltsr1.clear();
    voltsr2.clear();
    voltsr3.clear();
    voltsr4.clear();
    voltstby1.clear();
    voltstby2.clear();
    voltstby3.clear();
    voltstby4.clear();
    amp1.clear();
    amp2.clear();
    amp3.clear();
    kthn1.clear();
    kthn2.clear();
    kthn3.clear();
    listImagePath.clear();
    imagefiles!.clear();
    tglKerjaTeknisi.clear();
    ketPompaTeknisi.clear();
  }

  void scrollToTop() {
    try {
      log('scrolldek');
      scrollController.animateTo(0,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } catch (e) {
      print(e);
    }
  }

  ServisDetail(String serviceId) async {
    EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await DaftarServisService().detailService(serviceId);
      log(response.body.toString());

      if (response.body != null) {
        if (response.body['message'] == 'Berhasil') {
          log('berhasil');
          detailServisModel = DetailServisModel.fromJson(response.body['data']);
          Get.to(() => DetailServis(), binding: DaftarservisBinding());
          EasyLoading.dismiss();
        } else {
          MessageUtils.general(text: 'Terjadi Kesalahan');
          EasyLoading.dismiss();
        }
      }
    } catch (e) {
      log(e.toString());
      MessageUtils.general(text: 'Terjadi Kesalahan Pada Server');
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  insertDetailRespon(
      String userId, String responIdt, List<String> images) async {
    EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());

    if (tipePompa.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (partNumber.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (ketPompa.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (power.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (isolasi1.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (isolasi2.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (isolasi3.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (amp1.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (amp2.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (amp3.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (kthn1.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (kthn2.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (kthn3.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (voltsr1.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (voltsr2.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (voltsr3.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (voltsr4.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (voltstby1.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (voltstby2.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (voltstby3.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (voltstby4.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    if (konfklien.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    EasyLoading.show(dismissOnTap: false);
    try {
      DaftarServisService()
          .insertResponDetail(
              userId,
              responIdt,
              tipePompa.text,
              partNumber.text,
              ketPompa.text,
              konfklien.text,
              power.text,
              isolasi1.text + ';' + isolasi2.text + ';' + isolasi3.text,
              voltstby1.text +
                  ';' +
                  voltstby2.text +
                  ';' +
                  voltstby3.text +
                  ';' +
                  voltstby4.text,
              voltsr1.text +
                  ';' +
                  voltsr2.text +
                  ';' +
                  voltsr3.text +
                  ';' +
                  voltsr4.text,
              amp1.text + ';' + amp2.text + ';' + amp3.text,
              kthn1.text + ';' + kthn2.text + ';' + kthn3.text,
              images)
          .then((value) async {
        log(value.body.toString());
        if (value.body['success'] == 1) {
          MessageUtils.general(text: "Berhasil Insert Respon Detail");
          if (p.value < int.parse(jmlPompaTeknisi.text)) {
            Get.to(() => ResponDetail(), preventDuplicates: true);
            detailReponClear();
            p.value++;
            update();
          } else {
            Get.to(() => HomeView(), binding: HomeBinding());
            detailReponClear();
            jmlPompaTeknisi.clear();
            p.value = 1;
            update();
          }
        } else {
          MessageUtils.failed(
              text: 'Gagal Insert Respon Detail, coba beberapa saat lagi');
        }
      EasyLoading.dismiss();
      });
    } catch (e) {
      log(e.toString());
      MessageUtils.general(text: 'Terjadi Kesalahan Pada Server');
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  insertResponHeader(String projectId, String userId) async {
    EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());

    if (jmlPompaTeknisi.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }

    if (tglKerjaTeknisi.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }

    if (ketPompaTeknisi.text.isEmpty) {
      MessageUtils.failed(text: 'field tidak boleh kosong');
      return;
    }
    try {
      var response = await DaftarServisService().insertResponHeader(
          projectId,
          userId,
          jmlPompaTeknisi.text,
          tglKerjaTeknisi.text,
          ketPompaTeknisi.text);
      log(response.body.toString());

      if (response.body != null) {
        if (response.body['success'] == 1) {
          log('berhasil');
          responId.value = response.body['data'];
          log(responId.value);
          update();
          Get.to(() => ResponDetail(), binding: DaftarservisBinding());
          EasyLoading.dismiss();
        } else {
          MessageUtils.general(text: 'Terjadi Kesalahan');
          EasyLoading.dismiss();
        }
      }
    } catch (e) {
      log(e.toString());
      MessageUtils.general(text: 'Terjadi Kesalahan Pada Server');
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
  }

  Future<void> generatePDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    Rect bounds = Rect.fromLTWH(0, 160, page.graphics.clientSize.width, 30);

    page.graphics.drawImage(
        PdfBitmap(await readImage('kopteknikpompa.png')),
        Rect.fromLTWH(0, 0, 500, 75));


    

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 14),
        cellPadding: PdfPaddings(left: 5, bottom: 2, top: 2, right: 2));

    
    grid.columns.add(count: 2);

    grid.headers.add(5);

    PdfGridRow header1 = grid.headers[0];
    header1.cells[0].value = '';
    header1.cells[0].style.borders.all = PdfPens.transparent;
    header1.cells[1].style.borders.all = PdfPens.transparent;

    PdfGridRow header2 = grid.headers[1];
    header2.cells[0].value = '';
    header2.cells[0].style.borders.all = PdfPens.transparent;
    header2.cells[1].style.borders.all = PdfPens.transparent;

    PdfGridRow header3 = grid.headers[2];
    header3.cells[0].value = '';
    header3.cells[0].style.borders.all = PdfPens.transparent;
    header3.cells[1].style.borders.all = PdfPens.transparent;

    PdfGridRow headers = grid.headers[3];
    headers.cells[0].value = 'BERITA ACARA SUPERVISI';
    headers.cells[0].style.borders.all = PdfPens.transparent;
    headers.cells[1].style.borders.all = PdfPens.transparent;

    PdfGridRow header = grid.headers[4];
    header.cells[0].value = responViewDetailModel[0]!.idRespon;
    header.cells[0].style.borders.all = PdfPens.transparent;
    header.cells[1].style.borders.all = PdfPens.transparent;

    PdfGridRow row;

    row = grid.rows.add();
    row.cells[0].value = '';
    row.cells[1].value = '';
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = '';
    row.cells[1].value = '';
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = 'Tanggal';
    row.cells[1].value = responViewDetailModel[0]!.tglTindakan.toString();
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = 'Nama Project';
    row.cells[1].value = detailServisModel!.nama;
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = 'Lokasi';
    row.cells[1].value = detailServisModel!.lokasi;
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = 'Jumlah Pompa';
    row.cells[1].value = detailServisModel!.jmlPompa.toString();
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = 'Nama Teknisi';
    row.cells[1].value = detailServisModel!.teknisi1;
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = 'Keterangan';
    row.cells[1].value = detailServisModel!.keterangan;
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = 'Konf. Klien';
    row.cells[1].value = responViewDetailModel[0]!.konfirmasiKlien.toString();
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = 'Keterangan';
    row.cells[1].value = responViewDetailModel[0]!.keterangan.toString();
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = '';
    row.cells[1].value = '';
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    row = grid.rows.add();
    row.cells[0].value = '';
    row.cells[1].value = '';
    row.cells[0].style.borders.all = PdfPens.transparent;
    row.cells[1].style.borders.all = PdfPens.transparent;

    for (var i = 0; i < responViewDetailModel.length; i++) {
      row = grid.rows.add();
      row.cells[0].value = 'Pompa ' + (i + 1).toString();
      row.cells[1].value = '';
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = 'Tipe Pompa';
      row.cells[1].value = responViewDetailModel[i]!.tipePompa.toString();
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = 'Part Number';
      row.cells[1].value = responViewDetailModel[i]!.partNumber.toString();
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = 'Power';
      row.cells[1].value = responViewDetailModel[i]!.power.toString() + ' kW';
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = 'Isolasi ';
      row.cells[1].value = responViewDetailModel[i]!.isolation;
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = 'Voltase running (V)';
      row.cells[1].value = responViewDetailModel[i]!.voltageRunning.toString();
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = 'Voltase Standby (V)';
      row.cells[1].value = responViewDetailModel[i]!.voltageStandby.toString();
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = 'Ampere (A)';
      row.cells[1].value = responViewDetailModel[i]!.ampere.toString();
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = 'Ketahanan ';
      row.cells[1].value = responViewDetailModel[i]!.ketahanan;
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = '';
      row.cells[1].value = '';
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;

      row = grid.rows.add();
      row.cells[0].value = '';
      row.cells[1].value = '';
      row.cells[0].style.borders.all = PdfPens.transparent;
      row.cells[1].style.borders.all = PdfPens.transparent;
    }

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 100, 0, 0));

    bytes = await document.save();
    document.dispose();

    saveAndLaunchedFile(bytes, namaFile + '.pdf');
  }

  Future<Uint8List> readImage(String name) async {
    final data = await rootBundle.load('assets/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  getResponServisView(String projectId) async {
    EasyLoading.show(
        status: "Mencari Proyek. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await DaftarServisService().getResponViewDetail(projectId);
      log('awok' + response.toString());
      if (response != []) {
        responViewDetailModel.value = response;

        log(responViewDetailModel.value.toString());
      }
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  getImages(String projectId) async {
    EasyLoading.show(
        status: "Mencari Proyek. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response =
          await DaftarServisService().getResponViewDetailImages(projectId);
      log('awok' + response.toString());
      if (response != []) {
        responViewDetailModelImages.value = response;
      }
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  getDaftarServis(int status, String namaProject, String date, int page) async {
    EasyLoading.show(
        status: "Mencari Proyek. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await DaftarServisService()
          .getDaftarServis(status, namaProject, date, page);
      log('awok' + response.toString());
      if (response != []) {
        daftarServisModel.value = response;
        log(daftarServisModel.toString());
      }
      //   DaftarServisService()
      //     .getDaftarServis(status, namaProject, date, page)
      //     .then((value) async {
      //   log('awok' + value.toString());
      //   if (value != []) {
      //     daftarServisModel.value = value;

      //     log(daftarServisModel.toString());
      //   }
      // });
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  getDaftarServisUser(int status, String namaProject, String date,
      String roleId, String userId, int page) async {
    EasyLoading.show(
        status: "Mencari Proyek. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await DaftarServisService()
          .getDaftarServisUser(status, namaProject, date, roleId, userId, page);
      log('awok' + response.toString());
      if (response != []) {
        daftarServisSayaModel.value = response;
        log(daftarServisSayaModel.toString());
      }
      // DaftarServisService()
      //     .getDaftarServisUser(roleId, userId, page)
      //     .then((value) async {
      //   log('awok' + value.toString());
      //   if (value != []) {
      //     daftarServisSayaModel.value = value;
      //     log(daftarServisModel.toString());
      //   }
      // });
    } catch (e) {
      errorSnackBar('Gagal', e.toString());
    }
    EasyLoading.dismiss();
  }

  Future getTeknisi(bool isLoad, String teknisi) async {
    try {
      if (isLoad) isLoading.value = true;
      teknisi == '1'
          ? await DaftarServisService().getListTeknisi().then((value) async {
              log('masuk');
              if (value!.isNotEmpty) {
                listTeknisi1.value = value;
                listTeknisi1Search.value = value;
              }
              isLoading.value = false;
              update();
            })
          : await DaftarServisService().getListTeknisi().then((value) async {
              log('masuk2');
              if (value!.isNotEmpty) {
                listTeknisi2.value = value;
                listTeknisi2Search.value = value;
              }
              isLoading.value = false;
              update();
            });
    } catch (e) {}
  }

  Future updateStatus(String serviceId, String status) async {
    EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response =
          await DaftarServisService().updateStatusService(serviceId, status);
      if (response.body['message'] == 'Berhasil') {
        snackBar('Berhasil', 'Service anda telah diperbaharui!');
        Get.to(HomeView(), binding: HomeBinding());
        EasyLoading.dismiss();
      }
    } catch (e) {
      errorSnackBar('Gagal', e.toString());

      throw (e);
    }
    EasyLoading.dismiss();
  }

  Future updateTeknisi(
      String serviceId, String teknisi1, String teknisi2) async {
    EasyLoading.show(
        status: "Mohon Tunggu. . .",
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
        indicator: CircularProgressIndicator());
    try {
      var response = await DaftarServisService()
          .updateTeknisiService(serviceId, teknisi1, teknisi2);
      if (response.body['message'] == 'Berhasil') {
        snackBar('Berhasil', 'Service anda telah diperbaharui!');
        Get.to(HomeView(), binding: HomeBinding());
        EasyLoading.dismiss();
      }
    } catch (e) {
      errorSnackBar('Gagal', e.toString());

      throw (e);
    }
    EasyLoading.dismiss();
  }

  void snackBar(String judul, String msg) {
    Get.snackbar(judul, msg,
        colorText: Colors.white,
        backgroundColor: Colors.green[600],
        duration: Duration(seconds: 3));
  }

  void errorSnackBar(String judul, String msg) {
    Get.snackbar(judul, msg,
        colorText: Colors.white,
        backgroundColor: Colors.red[600],
        duration: Duration(seconds: 3));
  }

  void pendingSnackBar(String judul, String msg) {
    Get.snackbar(judul, msg,
        colorText: Colors.white,
        backgroundColor: Colors.orange[600],
        duration: Duration(seconds: 3));
  }
}
