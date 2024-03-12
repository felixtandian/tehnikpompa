import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/app/modules/daftarservis/widgets/customTextField.dart';
import 'package:tehnikpompa/utils/constant.dart';
import 'package:tehnikpompa/utils/prefController.dart';

class ResponDetailHeader extends GetView<DaftarservisController> {
  PrefController prefC = Get.put(PrefController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
            title: Text(
              'Respon Service',
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
          body: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                
                CustomTextField(
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.tglKerjaTeknisi.clear();
                      },
                      icon: const Icon(Icons.close)),
                  controller: controller.tglKerjaTeknisi,
                  label: 'Input Tanggal Kerja',
                  keyboardType: TextInputType.text,
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    controller.selectedDate!.value = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 12),
                        lastDate: DateTime(DateTime.now().year + 120)))!;
                    String format = DateFormat('yyyy-MM-dd')
                        .format(controller.selectedDate!.value);
                    controller.tglKerjaTeknisi.text = format;
                    controller.update();
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.ketPompaTeknisi.clear();
                      },
                      icon: const Icon(Icons.close)),
                  controller: controller.ketPompaTeknisi,
                  label: 'Keterangan Pompa',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.jmlPompaTeknisi.clear();
                      },
                      icon: const Icon(Icons.close)),
                  controller: controller.jmlPompaTeknisi,
                  label: 'Jumlah Pompa',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 5,
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
                      controller.insertResponHeader(controller.detailServisModel!.id, prefC.memberId);
                    },
                    child: Text(
                      'Lanjut Isi Detail',
                      style: Constants.whiteTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
