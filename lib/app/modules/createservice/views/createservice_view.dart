import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tehnikpompa/app/modules/createservice/widgets/utility.dart';
import 'package:tehnikpompa/app/modules/home/views/home_view.dart';
import 'package:tehnikpompa/utils/constant.dart';
import '../controllers/createservice_controller.dart';

class CreateserviceView extends GetView<CreateserviceController> {
  // Future getImages() async {
  //   final pickedFile = await controller.picker.pickMultiImage(
  //       imageQuality: 100, // To set quality of images
  //       maxHeight: 1000, // To set maxheight of images that you want in your app
  //       maxWidth: 1000); // To set maxheight of images that you want in your app
  //   List<XFile> xfilePick = pickedFile;

  //   // if atleast 1 images is selected it will add
  //   // all images in selectedImages
  //   // variable so that we can easily show them in UI
  //   if (xfilePick.isNotEmpty) {
  //     for (var i = 0; i < xfilePick.length; i++) {
  //       // controller.selectedImages.add(File(xfilePick[i].path));
  //     }
  //     controller.update();
  //   } else {
  //     // If no image is selected it will show a
  //     // snackbar saying nothing is selected
  //     const SnackBar(content: Text('Nothing is selected'));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.c.value != 0) {
          controller.c.value -= 1;
        }
        if (controller.c.value == 0) {
          controller.clear();
          Get.offAll(() => HomeView());
        }
        controller.update();
        return true;
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
                  Get.offAll(() => HomeView());
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
                margin: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Form(
                      key: controller.globalKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => Container(
                              margin: const EdgeInsets.all(10),
                              child: controller.c.value == 1
                                  ? Column(children: <Widget>[
                                      Container(
                                        width: Get.width,
                                        child: DropdownButton(
                                          value: controller.selectedServis.value,
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 14),
                                          onChanged: (String? newValue) {
                                            controller.setSelected(newValue!);
                                            controller.update();
                                          },
                                          items: controller.dropdownItems,
                                        ),
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
                                        promptText2:
                                            'Nomor Telepon Wajin Angka',
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
                                    ])
                                  : controller.c.value == 2
                                      ? Column(
                                          children: <Widget>[
                                            
                                          ],
                                        )
                                      : Container(),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
          )),
    );
  }
}
