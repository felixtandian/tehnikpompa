import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/app/modules/daftarservis/widgets/customTextField.dart';
import 'package:tehnikpompa/utils/constant.dart';
import 'package:tehnikpompa/utils/prefController.dart';

class DetailServis extends GetView<DaftarservisController> {
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
            'Detail Service',
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
                    Text(controller.detailServisModel!.id,
                        style: Constants.boldBlackTitle),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status Project', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.statusId,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nama Project', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.nama,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                   
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lokasi', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.lokasi,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tipe Pompa', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.tipePompa,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Request Tanggal',
                            style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.reqTanggal,
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
                        Text(controller.detailServisModel!.jmlPompa.toString(),
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cp Nama', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.cpNama,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cp Telepon', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.cpTelp,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Umur Pompa', style: Constants.blacktextStyle),
                        Spacer(),
                        Expanded(
                          flex: 0,
                          child: Text(controller.detailServisModel!.umurPompa,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: Constants.detailServisText),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keterangan',
                          style: Constants.blacktextStyle,
                        ),
                        Spacer(),
                        Expanded(
                          flex: 1,
                          child: Text(controller.detailServisModel!.keterangan,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: Constants.detailServisText),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tipe Request', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.tipeRequestId,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rekomendasi Teknisi',
                            style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.rekomendasiTeknisi,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal Assign', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.tanggalAssign,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Teknisi 1', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.teknisi1,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Teknisi 2', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.teknisi2,
                            style: Constants.detailServisText),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Created By ', style: Constants.blacktextStyle),
                        Text(controller.detailServisModel!.createdBy,
                            style: Constants.detailServisText),
                      ],
                    ),
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
                child: controller.detailServisModel!.images.length > 0
                    ? GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                        itemCount: controller.detailServisModel!.images.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 70,
                                child: Image.network(
                                    controller.detailServisModel!.images[index]
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
              const SizedBox(
                height: 10,
              ),
              // Container(
              //         width: Get.width,
              //         padding: const EdgeInsets.all(5.0),
              //         alignment: Alignment.topLeft,
              //         decoration: BoxDecoration(
              //             border: Border.all(width: 1.5, color: Colors.black),
              //             borderRadius:
              //                 const BorderRadius.all(const Radius.circular(5))),
              //         child: Container(
              //           padding: const EdgeInsets.all(8),
              //           child: Column(children: <Widget>[
              //             Obx(
              //               () => DropdownButton(
              //                 isExpanded: true,
              //                 value: controller.selectedStatus.value,
              //                 style: GoogleFonts.montserrat(
              //                     color: Colors.black, fontSize: 14),
              //                 onChanged: (int? newValue) {
              //                   controller.setSelected(newValue!);
              //                   controller.update();
              //                 },
              //                 items: controller.dropdownItems2,
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ), CustomTextField(
              //               controller: controller.teknisi1,
              //               keyboardType: TextInputType.text,
              //               label: 'Teknisi 1',
              //               readOnly: true,
              //               onTap: () async {
              //                 EasyLoading.show();
              //                 await controller.getTeknisi(false, '1');
              //                 EasyLoading.dismiss();
              //                 bottomSheetStation(context, '1');
              //               },
              //             ),
              //             const SizedBox(
              //               height: 5,
              //             ),CustomTextField(
              //               controller: controller.teknisi1,
              //               keyboardType: TextInputType.text,
              //               label: 'Teknisi 1',
              //               readOnly: true,
              //               onTap: () async {
              //                 EasyLoading.show();
              //                 await controller.getTeknisi(false, '2');
              //                 EasyLoading.dismiss();
              //                 bottomSheetStation(context, '2');
              //               },
              //             ),
              //           ]),
              //         ))
              prefC.flagisSuper
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          Text('Update Service',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  : SizedBox(),
              prefC.flagisSuper
                  ? Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Obx(
                            () => DropdownButton(
                              isExpanded: true,
                              value: controller.selectedStatus.value,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black, fontSize: 14),
                              onChanged: (int? newValue) {
                                controller.setSelected(newValue!);
                                controller.update();
                              },
                              items: controller.dropdownItems2,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.teknisi1.clear();
                                },
                                icon: const Icon(Icons.close)),
                            controller: controller.teknisi1,
                            keyboardType: TextInputType.text,
                            label: 'Teknisi 1',
                            readOnly: true,
                            onTap: () async {
                              EasyLoading.show();
                              await controller.getTeknisi(false, '1');
                              EasyLoading.dismiss();
                              bottomSheetStation(context, '1');
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.teknisi2.clear();
                                },
                                icon: const Icon(Icons.close)),
                            controller: controller.teknisi2,
                            keyboardType: TextInputType.text,
                            label: 'Teknisi 2',
                            readOnly: true,
                            onTap: () async {
                              EasyLoading.show();
                              await controller.getTeknisi(false, '2');
                              EasyLoading.dismiss();
                              bottomSheetStation(context, '2');
                            },
                          ),
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
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Apakah anda yakin semuanya sudah benar?',
                                        style: Constants.blacktextStyle,
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text("BATAL",
                                              style: Constants.blacktextStyle),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            "YA",
                                            style: Constants.blacktextStyle,
                                          ),
                                          onPressed: () {
                                            if (controller.teknisi1.text !=
                                                    "" ||
                                                controller.teknisi2.text !=
                                                    "") {
                                              controller.updateTeknisi(
                                                  controller
                                                      .detailServisModel!.id,
                                                  controller.teknisi1Id.text,
                                                  controller.teknisi2Id.text);
                                              controller.updateStatus(
                                                  controller
                                                      .detailServisModel!.id,
                                                  controller
                                                      .selectedStatus.value
                                                      .toString());
                                            } else {
                                              //update status
                                              controller.updateStatus(
                                                  controller
                                                      .detailServisModel!.id,
                                                  controller
                                                      .selectedStatus.value
                                                      .toString());
                                            }
                                            controller.update();
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                'Simpan',
                                style: Constants.whiteTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  bottomSheetStation(BuildContext context, String isTeknisi1) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            height: Get.height * 0.8,
            padding: EdgeInsets.only(
              left: 10,
              top: 15,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
            child: GetBuilder<DaftarservisController>(builder: (ctrl) {
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: Get.width * 0.18,
                        height: 3,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextField(
                      suffixIcon: SizedBox(height: 0),
                      controller: ctrl.key1,
                      keyboardType: TextInputType.text,
                      readOnly: false,
                      hint: 'Cari Teknisi',
                      action: (value) {
                        if (ctrl.key1.text.isEmpty || ctrl.key1.text == '') {
                          isTeknisi1 == '1'
                              ? ctrl.getTeknisi(false, '1')
                              : ctrl.getTeknisi(false, '2');
                        } else {
                          var results;
                          isTeknisi1 == '1'
                              ? results = ctrl.listTeknisi1
                                  .where((s) =>
                                      s!.name.toLowerCase().contains(value))
                                  .toList()
                              : results = ctrl.listTeknisi2
                                  .where((s) =>
                                      s!.name.toLowerCase().contains(value))
                                  .toList();
                          if (isTeknisi1 == '1') {
                            ctrl.listTeknisi1Search.value = results;
                          } else {
                            ctrl.listTeknisi2Search.value = results;
                          }
                          ctrl.update();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ctrl.listTeknisi1Search
                            .isNotEmpty //&& ctrl.listDestination.isNotEmpty
                        ? ListView.builder(
                            padding: EdgeInsets.all(10),
                            physics: ClampingScrollPhysics(),
                            itemCount: isTeknisi1 == '1'
                                ? ctrl.listTeknisi1Search.length
                                : ctrl.listTeknisi2Search.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () {
                                  if (isTeknisi1 == '1') {
                                    ctrl.teknisi1.text =
                                        ctrl.listTeknisi1Search[index]!.name;
                                    ctrl.teknisi1Id.text = ctrl
                                        .listTeknisi1Search[index]!.id
                                        .toString();
                                  } else {
                                    ctrl.teknisi2.text =
                                        ctrl.listTeknisi2Search[index]!.name;
                                    ctrl.teknisi2Id.text = ctrl
                                        .listTeknisi2Search[index]!.id
                                        .toString();
                                  }
                                  Get.back();
                                },
                                title: isTeknisi1 == '1'
                                    ? Text(ctrl.listTeknisi1Search[index]!.name)
                                    : Text(
                                        ctrl.listTeknisi2Search[index]!.name),
                              );
                            })
                        : Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(child: Text('Tidak ada data')),
                          ),
                  )
                ],
              );
            }),
          );
        });
  }
}
