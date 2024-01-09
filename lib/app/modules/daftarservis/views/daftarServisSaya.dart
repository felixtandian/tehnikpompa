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
import 'package:tehnikpompa/utils/constant.dart';

final NumberPaginatorController _controller = NumberPaginatorController();

class DaftarServiceSaya extends GetView<DaftarservisController> {
  DaftarServiceSaya({Key? key}) : super(key: key);
  LoginscreenController loginC = Get.put(LoginscreenController());
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
                        Obx(
                          () => controller.daftarServisSayaModel.isNotEmpty
                              ? ListView.builder(
                                  padding: const EdgeInsets.all(10),
                                  physics: const ClampingScrollPhysics(),
                                  itemCount:
                                      controller.daftarServisSayaModel.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                  loginC.userModel!.roleId,
                                  loginC.userModel!.id,
                                  pageNumber);
                              EasyLoading.dismiss();
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
