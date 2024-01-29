import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tehnikpompa/app/modules/createservice/widgets/utility.dart';
import 'package:tehnikpompa/app/modules/home/bindings/home_binding.dart';
import 'package:tehnikpompa/app/modules/home/views/home_view.dart';
import 'package:tehnikpompa/app/modules/loginscreen/controllers/loginscreen_controller.dart';
import 'package:tehnikpompa/main.dart';
import 'package:tehnikpompa/utils/constant.dart';
import 'package:tehnikpompa/utils/prefController.dart';
import '../controllers/createservice_controller.dart';

class CreateserviceView extends GetView<CreateserviceController> {
  LoginscreenController loginC = Get.put(LoginscreenController());
  PrefController prefC = Get.put(PrefController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.c.value != 0) {
          controller.c.value -= 1;
          controller.update();
        }
        if (controller.c.value == 0) {
          controller.clear();
          Get.offAll(() => HomeView());
        }
        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
            toolbarHeight: 150,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if (controller.c.value != 0) {
                  controller.c.value -= 1;
                }
                if (controller.c.value == 0) {
                  controller.clear();
                  Get.off(() => HomeView(), binding: HomeBinding());
                }
                controller.update();
              },
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            flexibleSpace: SafeArea(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 50,
                ),
                //obx
                Obx(
                  () => Center(
                    child: CircularPercentIndicator(
                        radius: 40,
                        progressColor: Colors.green[600],
                        backgroundColor: Colors.white,
                        lineWidth: 10,
                        animation: true,
                        percent: controller.c.value / 3,
                        center: Text(
                          controller.c.value.toString() + "/3",
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        )),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ListTile(
                      title: Text(
                        "Buat Servis Anda",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            )),
          ),
          body: ConstrainedBox(
            constraints: BoxConstraints(minHeight: Get.height),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Form(
                      key: controller.globalKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() => controller.c.value == 1
                              ? Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Column(children: <Widget>[
                                    Container(
                                      width: Get.width,
                                      child: DropdownButton(
                                        value: controller.selectedServis.value,
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black, fontSize: 14),
                                        onChanged: (String? newValue) {
                                          controller.setSelected(newValue!);
                                          log('selectted Servoce : ' +
                                              controller
                                                  .selectedServisId.value);
                                          controller.update();
                                        },
                                        items: controller.dropdownItems,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    buildServisWidget(
                                      hintText: 'Service Pompa A',
                                      labelText: 'Nama Service',
                                      textField: controller.namaServis,
                                      promptText: 'Nama Service Harus Diisi',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    buildServisWidget(
                                      nomor: 1,
                                      textField: controller.nomorTelepon,
                                      hintText: '085627800080',
                                      labelText: 'Nomor Telepon',
                                      promptText: 'Nomor Telepon Wajib Diisi',
                                      promptText2: 'Nomor Telepon Wajib Angka',
                                      promptText3:
                                          'Nomor Telepon tidak lengkap',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    buildServisWidget(
                                      textField: controller.tipePompa,
                                      hintText: 'Pompa A',
                                      labelText: 'Tipe Pompa',
                                      promptText:
                                          'Tipe Pompa Tidak Boleh Kosong',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    buildServisWidget(
                                      textField: controller.lokasi,
                                      hintText: 'Semarang',
                                      labelText: 'Lokasi',
                                      promptText: 'Lokasi Tidak Boleh Kosong',
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: controller.tglKerja.value,
                                      decoration: InputDecoration(
                                          label: Text(
                                            'Input Tanggal Kerja',
                                            style: Constants.blacktextStyle,
                                          ),
                                          labelStyle: Constants.blacktextStyle),
                                      validator: (value) {},
                                      onTap: () async {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        controller.selectedDate!.value =
                                            (await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(
                                                    DateTime.now().year +
                                                        120)))!;
                                        String format = DateFormat('yyyy-MM-dd')
                                            .format(
                                                controller.selectedDate!.value);
                                        controller.tglKerja.value.text = format;
                                        controller.update();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize:
                                              const Size(double.infinity, 42),
                                          primary: const Color.fromRGBO(
                                              36, 40, 91, 1),
                                          shadowColor: Colors.black,
                                        ),
                                        onPressed: () {
                                          if (!controller
                                              .globalKey.currentState!
                                              .validate()) {
                                            return;
                                          } else {
                                            controller.c.value = 2;
                                            controller.update();
                                          }
                                        },
                                        child: Text(
                                          'Lanjut',
                                          style: Constants.whiteTextStyle,
                                        ))
                                  ]))
                              : controller.c.value == 2
                                  ? Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Column(children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16, top: 16, right: 16),
                                              child: controller
                                                      .imagefiles!.isEmpty
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        controller.openImages();
                                                      },
                                                      child: Container(
                                                        color: Colors.grey[100],
                                                        height: 200,
                                                        width: Get.width,
                                                        child: const Icon(
                                                          Icons.camera_alt,
                                                          size: 50,
                                                        ),
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        controller.openImages();
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Wrap(
                                                          children: controller
                                                              .imagefiles!
                                                              .map((imageone) {
                                                            return Container(
                                                                child: Card(
                                                              child: Container(
                                                                height: 100,
                                                                width: 100,
                                                                child: Image.file(
                                                                    File(imageone
                                                                        .path)),
                                                              ),
                                                            ));
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                              width: 50,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(
                                                      double.infinity, 40),
                                                  primary: const Color.fromRGBO(
                                                      36, 40, 91, 1),
                                                  shadowColor: Colors.black,
                                                ),
                                                onPressed: () {
                                                  if (controller
                                                      .imagefiles!.isEmpty) {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                            'Apakah anda yakin tidak mengupload gambar?',
                                                            style: Constants
                                                                .blacktextStyle,
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              child: Text(
                                                                  "BATAL",
                                                                  style: Constants
                                                                      .blacktextStyle),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: Text(
                                                                "YA",
                                                                style: Constants
                                                                    .blacktextStyle,
                                                              ),
                                                              onPressed: () {
                                                                controller.c
                                                                    .value += 1;
                                                                controller
                                                                    .update();
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    controller.c.value += 1;
                                                    controller.update();
                                                  }
                                                },
                                                child: Text(
                                                  'Lanjut',
                                                  style:
                                                      Constants.whiteTextStyle,
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(
                                                      double.infinity, 40),
                                                  primary: Colors.white,
                                                ),
                                                onPressed: () {
                                                  controller.c.value -= 1;
                                                  controller.update();
                                                },
                                                child: Text(
                                                  'Kembali',
                                                  style:
                                                      Constants.blacktextStyle,
                                                ))
                                          ],
                                        )
                                      ]),
                                    )
                                  : controller.c.value == 3
                                      ? Container(
                                          margin: const EdgeInsets.all(10),
                                          child: Column(children: <Widget>[
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            buildServisWidget(
                                              textField: controller.masalah,
                                              hintText: 'pompa bocor',
                                              labelText: 'Masalah Pompa',
                                              promptText:
                                                  'Masalah Pompa Tidak Boleh Kosong',
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            buildServisWidget(
                                              nomor: 4,
                                              textField: controller.jmlPompa,
                                              hintText: '100',
                                              labelText: 'Jumlah Pompa',
                                              promptText:
                                                  'Jumlah Pompa Tidak Boleh Kosong',
                                              promptText2:
                                                  'Jumlah Pompa Harus Angka',
                                              promptText3:
                                                  'Jumlah Pompa Harus Lebih Dari 0',
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            buildServisWidget(
                                              textField: controller.umrPompa,
                                              hintText: '12 hari/bulan/tahun',
                                              labelText: 'Umur Pompa',
                                              promptText:
                                                  'Umur Pompa Tidak Boleh Kosong',
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            buildServisWidget(
                                              textField: controller.cpName,
                                              hintText: 'Budi',
                                              labelText: 'Nama Contact Person',
                                              promptText:
                                                  'Nama Contact Person Tidak Boleh Kosong',
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            buildServisWidget(
                                              nomor: 1,
                                              textField: controller.cpPhone,
                                              hintText: '0856277XXXXX',
                                              labelText:
                                                  'Nomor Telepon Contact Person',
                                              promptText:
                                                  'Nama Telepon Tidak Boleh Kosong',
                                              promptText2:
                                                  'Nomor Telepon Wajin Angka',
                                              promptText3:
                                                  'Nomor Telepon tidak lengkap',
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            buildServisWidget(
                                              textField:
                                                  controller.rekomTeknisi,
                                              hintText: 'Budi',
                                              labelText: 'Rekomendasi Teknisi',
                                              promptText:
                                                  'Rekomendasi Teknisi Harus Diisi',
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(
                                                      double.infinity, 42),
                                                  primary: const Color.fromRGBO(
                                                      36, 40, 91, 1),
                                                  shadowColor: Colors.black,
                                                ),
                                                onPressed: () {
                                                  if (!controller
                                                      .globalKey.currentState!
                                                      .validate()) {
                                                    return;
                                                  } else {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                            'Pastikan semuanya sudah benar ya?',
                                                            style: Constants
                                                                .blacktextStyle,
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              child: Text(
                                                                  "BATAL",
                                                                  style: Constants
                                                                      .blacktextStyle),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: Text(
                                                                "YA",
                                                                style: Constants
                                                                    .blacktextStyle,
                                                              ),
                                                              onPressed: () async{
                                                                Navigator.pop(
                                                                    context);
                                                                EasyLoading
                                                                    .show();
                                                                controller.cServiceController(
                                                                    controller
                                                                        .listImagePath,
                                                                    controller
                                                                        .selectedServisId
                                                                        .value,
                                                                    controller
                                                                        .namaServis
                                                                        .text,
                                                                    controller
                                                                        .nomorTelepon
                                                                        .text,
                                                                    controller
                                                                        .tipePompa
                                                                        .text,
                                                                    controller
                                                                        .lokasi
                                                                        .text,
                                                                    controller
                                                                        .masalah
                                                                        .text,
                                                                    controller
                                                                        .jmlPompa
                                                                        .text,
                                                                    controller
                                                                        .umrPompa
                                                                        .text,
                                                                    controller
                                                                        .cpName
                                                                        .text,
                                                                    controller
                                                                        .cpPhone
                                                                        .text,
                                                                    controller
                                                                        .rekomTeknisi
                                                                        .value
                                                                        .text,
                                                                    '',
                                                                    '',
                                                                    prefC.memberId);
                                                                controller
                                                                    .update();
                                                                EasyLoading
                                                                    .dismiss();
                                                              },
                                                            )
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Text(
                                                  'Buat Servis !',
                                                  style:
                                                      Constants.whiteTextStyle,
                                                )),
                                            const SizedBox(height: 15),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(
                                                      double.infinity, 40),
                                                  primary: Colors.white,
                                                ),
                                                onPressed: () {
                                                  controller.c.value -= 1;
                                                  controller.update();
                                                },
                                                child: Text(
                                                  'Kembali',
                                                  style:
                                                      Constants.blacktextStyle,
                                                ))
                                          ]))
                                      : Container())
                        ],
                      )),
                ),
              ),
            ),
          )),
    );
  }
}

void snackBar(String judul, String msg) {
  Get.snackbar(judul, msg,
      colorText: Colors.white,
      backgroundColor: Colors.green[600],
      duration: Duration(seconds: 2));
}
