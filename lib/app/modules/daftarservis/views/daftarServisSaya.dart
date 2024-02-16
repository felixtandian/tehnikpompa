import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:tehnikpompa/app/modules/daftarservis/bindings/daftarservis_binding.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/detailServis.dart';
import 'package:tehnikpompa/app/modules/daftarservis/widgets/daftarServisSayaWidget.dart';
import 'package:tehnikpompa/app/modules/daftarservis/widgets/dafterServisWidget.dart';
import 'package:tehnikpompa/app/modules/loginscreen/controllers/loginscreen_controller.dart';
import 'package:tehnikpompa/main.dart';
import 'package:tehnikpompa/utils/constant.dart';
import 'package:tehnikpompa/utils/prefController.dart';

final NumberPaginatorController _controller = NumberPaginatorController();

class DaftarServiceSaya extends GetView<DaftarservisController> {
  DaftarServiceSaya({Key? key}) : super(key: key);
  LoginscreenController loginC = Get.put(LoginscreenController());
  PrefController prefC = Get.put(PrefController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
        title: Text(
          'Daftar Service',
          style: GoogleFonts.montserrat(
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        margin: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(5))),
                      child: Container(
                        padding: const EdgeInsets.all(8),
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
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: controller.date.value,
                              decoration: InputDecoration(
                                  isDense: true,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.date.value.clear();
                                      },
                                      icon: const Icon(Icons.close)),
                                  label: Text(
                                    'Input Tanggal Proyek',
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
                                        firstDate:
                                            DateTime(DateTime.now().year - 10),
                                        lastDate: DateTime.now()))!;
                                String format = DateFormat('yyyy-MM-dd')
                                    .format(controller.selectedDate!.value);
                                controller.date.value.text = format;
                                controller.update();
                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => TextFormField(
                                controller:
                                    controller.searchTextController.value,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.searchTextController.value
                                              .clear();
                                        },
                                        icon: const Icon(Icons.close)),
                                    hintText: 'Pdam Jogja ',
                                    hintStyle: Constants.blacktextStyle,
                                    labelText: 'Cari Proyek',
                                    labelStyle: Constants.blacktextStyle,
                                    border: const OutlineInputBorder()),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 42),
                                  primary: const Color.fromRGBO(36, 40, 91, 1),
                                  shadowColor: Colors.black,
                                ),
                                onPressed: () async {
                                  EasyLoading.show(
                                      status: "Mencari Project. . .",
                                      dismissOnTap: false,
                                      maskType: EasyLoadingMaskType.black,
                                      indicator:
                                          const CircularProgressIndicator());
                                  
                                  await controller.getDaftarServisUser(
                                      controller.selectedStatus.value,
                                      controller
                                          .searchTextController.value.text,
                                      controller.date.value.text,
                                      prefC.memberRoleId,
                                      prefC.memberId,
                                      1);
                                  controller.scrollToTop();
                                  EasyLoading.dismiss();
                                },
                                child: Text(
                                  'Cari',
                                  style: Constants.whiteTextStyle,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.daftarServisSayaModel.isNotEmpty
                          ? ListView.builder(
                              padding: const EdgeInsets.all(10),
                              physics: const ClampingScrollPhysics(),
                              itemCount:
                                  controller.daftarServisSayaModel.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return DaftarServisSayaWidget(
                                  onTap: () async {
                                    await controller.ServisDetail(controller
                                        .daftarServisSayaModel[index]!.id);
                                  },
                                  model:
                                      controller.daftarServisSayaModel[index],
                                );
                              })
                          : const Center(
                              child: SizedBox(
                                  height: 20,
                                  child: Text('Proyek tidak ditemukan'))),
                    ),
                    Obx(
                      () => NumberPagination(
                        onPageChanged: (int pageNumber) async {
                          EasyLoading.show();
                          await controller.getDaftarServisUser(
                              controller.selectedStatus.value,
                              controller.searchTextController.value.text,
                              controller.date.value.text,
                              prefC.memberRoleId,
                              prefC.memberId,
                              pageNumber);
                          EasyLoading.dismiss();
                          controller.scrollToTop();
                        },
                        threshold: 3,
                        pageTotal: controller.totalPage.value,
                        pageInit: 1, // picked number when init page
                        colorPrimary: Colors.black,
                        colorSub: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
