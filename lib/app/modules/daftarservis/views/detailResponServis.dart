import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/mobile.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/responDetailHeader.dart';
import 'package:tehnikpompa/app/modules/daftarservis/widgets/customTextField.dart';
import 'package:tehnikpompa/utils/constant.dart';
import 'package:tehnikpompa/utils/messageUtils.dart';
import 'package:tehnikpompa/utils/prefController.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class DetailResponServisView extends GetView<DaftarservisController> {
  PrefController prefC = Get.put(PrefController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
          title: Text(
            'Detail Respon Service',
            style: GoogleFonts.montserrat(
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Row(
                  children: [
                    Text('Detail Service',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.responViewDetailModel[0]!.idRespon,
                        style: Constants.boldBlackTitle),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal Kerja', style: Constants.blacktextStyle),
                        Text(
                            controller.responViewDetailModel[0]!.tglTindakan
                                .toString(),
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Keterangan', style: Constants.blacktextStyle),
                        Text(controller.responViewDetailModel[0]!.ketPompa,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jumlah Pompa', style: Constants.blacktextStyle),
                        Text(
                            controller.responViewDetailModel[0]!.jmlPompa
                                .toString(),
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Konf. Oleh', style: Constants.blacktextStyle),
                        Text(
                            controller.responViewDetailModel[0]!.konfirmasiKlien
                                .toString(),
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Dicek Oleh ', style: Constants.blacktextStyle),
                        Text(
                            controller.responViewDetailModel[0]!.dicekOleh
                                .toString(),
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tggl Cek', style: Constants.blacktextStyle),
                        Text(
                            controller.responViewDetailModel[0]!.tglTindakan
                                .toString(),
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const PageScrollPhysics(),
                          itemCount: controller.responViewDetailModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              width: Get.width - 50,
                              child: Column(children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Tipe Pompa',
                                        style: Constants.blacktextStyle),
                                    Text(
                                        controller.responViewDetailModel[index]!
                                            .tipePompa
                                            .toString(),
                                        style: Constants.detailServisText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Power',
                                        style: Constants.blacktextStyle),
                                    Text(
                                        controller
                                            .responViewDetailModel[index]!.power
                                            .toString(),
                                        style: Constants.detailServisText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Isolasi (mΩ)',
                                        style: Constants.blacktextStyle),
                                    Text(
                                        controller.responViewDetailModel[index]!
                                            .isolation
                                            .toString(),
                                        style: Constants.detailServisText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Voltase Standby (V)',
                                        style: Constants.blacktextStyle),
                                    Text(
                                        controller.responViewDetailModel[index]!
                                            .voltageStandby
                                            .toString(),
                                        style: Constants.detailServisText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Voltase Running (V)',
                                        style: Constants.blacktextStyle),
                                    Text(
                                        controller.responViewDetailModel[index]!
                                            .voltageRunning
                                            .toString(),
                                        style: Constants.detailServisText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Ampere (A)',
                                        style: Constants.blacktextStyle),
                                    Text(
                                        controller.responViewDetailModel[index]!
                                            .ampere
                                            .toString(),
                                        style: Constants.detailServisText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Ketahanan (Ω)',
                                        style: Constants.blacktextStyle),
                                    Text(
                                        controller.responViewDetailModel[index]!
                                            .ketahanan
                                            .toString(),
                                        style: Constants.detailServisText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ]),
                            );
                          }),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Row(
                  children: [
                    Text('Gambar',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: controller.responViewDetailModelImages.length < 0
                    ? GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemCount:
                            controller.responViewDetailModelImages.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 70,
                                child: Image.network(
                                    controller
                                        .responViewDetailModelImages[index]!
                                        .title
                                        .toString(),
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                  return child;
                                }, loadingBuilder:
                                        (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                              ),
                            ],
                          );
                        },
                      )
                    : Container(
                        child: Center(
                          child: Text(
                            'Tidak ada gambar',
                            style: Constants.blacktextStyle,
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Constants.darkBlue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    controller.generatePDF();
                  },
                  child: Text(
                    'Download PDF',
                    style: Constants.whiteTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
