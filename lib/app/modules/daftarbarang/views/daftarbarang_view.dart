import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/listKategoriModel.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/itemfetcher.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/listItemBarang.dart';
import 'package:tehnikpompa/utils/constant.dart';
import '../controllers/daftarbarang_controller.dart';

DaftarbarangController daftarbarangController =
    Get.put(DaftarbarangController());
final NumberPaginatorController _controller = NumberPaginatorController();

class DaftarbarangView extends GetView<DaftarbarangController> {
  final DaftarbarangController daftarbarangController =
      Get.put(DaftarbarangController());

  DaftarbarangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
        title: Text(
          'Daftar Barang',
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
                          value: controller.selectedLokasi.value,
                          style: GoogleFonts.montserrat(
                              color: Colors.black, fontSize: 14),
                          onChanged: (String? newValue) {
                            controller.setSelected(newValue!);
                            if (controller.selectedLokasi.value == 'Semarang') {
                              controller.lokasi.value = 1;
                            } else {
                              controller.lokasi.value = 2;
                            }
                            controller.update();
                          },
                          items: controller.dropdownItems2,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // DropdownButton<KategoriModel>(
                      //   items: ,
                      //   onChanged: onChanged),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // DropdownButtonFormField2<KategoriModel>(
                      //   items: controller.kategoriModel.map((KategoriModel item) 
                      //   => DropdownMenuItem<KategoriModel>(
                      //     value: item.kodeKtgrBarang, 
                      //     child: Text(item.namaKtgrBarang
                      //       ),
                      //     ),
                      //   ).toList(),
                      // ),
                      Obx(
                        () => TextFormField(
                          controller: controller.searchTextController.value,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              isDense: true,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.searchTextController.value
                                        .clear();
                                  },
                                  icon: const Icon(Icons.close)),
                              hintText: 'ADC  ',
                              hintStyle: Constants.blacktextStyle,
                              labelText: 'Cari Barang',
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
                                status: "Mencari Barang. . .",
                                dismissOnTap: false,
                                maskType: EasyLoadingMaskType.black,
                                indicator: const CircularProgressIndicator());
                            await controller.getDaftarBarang(
                                controller.lokasi.value,
                                controller.searchTextController.value.text,
                                controller.selectedCategory.value,
                                1);
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
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                  height: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Obx(
                          () => controller.daftarBarangModel.isNotEmpty
                              ? ListView.builder(
                                  padding: const EdgeInsets.all(10),
                                  physics: const ClampingScrollPhysics(),
                                  itemCount:
                                      controller.daftarBarangModel.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListItemBarang(
                                      model:
                                          controller.daftarBarangModel[index],
                                    );
                                  })
                              : const Center(
                                  child: SizedBox(
                                      height: 20,
                                      child: Text('Barang tidak ditemukan'))),
                        ),
                        Obx(
                          ()=> NumberPagination(
                            onPageChanged: (int pageNumber) async {
                              await controller.getDaftarBarang(
                                  controller.lokasi.value,
                                  controller.searchTextController.value.text,
                                  '',
                                  pageNumber);
                            },
                            threshold: 2,
                            pageTotal: controller.totalPage.value,
                            pageInit:
                                1, // picked number when init page
                            colorPrimary: Colors.black,
                            colorSub: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        )
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
