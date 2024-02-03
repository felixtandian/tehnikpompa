import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/app/modules/daftarservis/widgets/customTextField.dart';
import 'package:tehnikpompa/main.dart';
import 'package:tehnikpompa/utils/constant.dart';

class ResponDetail extends GetView<DaftarservisController> {
  final forms = <Widget>[];
  var i = 0;
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
              Get.offAllNamed('/homepage');
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Obx(
              () => Column(
                children: [
                  // for (i = 0;
                  //     i < controller.p.value;
                  //     i++) ...[
                  //1
                  CustomTextField(
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.tipePompa.clear();
                          },
                          icon: const Icon(Icons.close)),
                      label: 'Tipe Pompa',
                      keyboardType: TextInputType.text,
                      controller: controller.tipePompa),
                  SizedBox(
                    height: 5,
                  ),
                  //2
                  CustomTextField(
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.partNumber.clear();
                        },
                        icon: const Icon(Icons.close)),
                    label: 'Part Number',
                    controller: controller.partNumber,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //3
                  CustomTextField(
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.tglKerjaTeknisi.clear();
                        },
                        icon: const Icon(Icons.close)),
                    label: 'Keterangan Pompa',
                    controller: controller.ketPompa,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //4
                  CustomTextField(
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.power.clear();
                        },
                        icon: const Icon(Icons.close)),
                    label: 'Power',
                    controller: controller.power,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //row

                  //1

                  Row(
                    children: [
                      Expanded(child: Text('Isolasi')),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isolasi1.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'L1',
                            controller: controller.isolasi1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isolasi2.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'L2',
                            controller: controller.isolasi2,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isolasi3.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'L3',
                            controller: controller.isolasi3,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //2
                  Row(children: [
                    Expanded(child: Text('Voltase (Standby)')),
                    Expanded(
                      child: Container(
                        child: CustomTextField(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.voltstby1.clear();
                              },
                              icon: const Icon(Icons.close)),
                          label: 'R-S',
                          controller: controller.voltstby1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: CustomTextField(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.voltstby2.clear();
                              },
                              icon: const Icon(Icons.close)),
                          label: 'R-T',
                          controller: controller.voltstby2,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: CustomTextField(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.voltstby3.clear();
                              },
                              icon: const Icon(Icons.close)),
                          label: 'S-T',
                          controller: controller.voltstby3,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: CustomTextField(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.voltstby4.clear();
                              },
                              icon: const Icon(Icons.close)),
                          label: 'L-N',
                          controller: controller.voltstby4,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  //3
                  Row(
                    children: [
                      Expanded(child: Text('Voltase (Running)')),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.voltsr1.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'R-S',
                            controller: controller.voltstby1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.voltsr2.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'R-T',
                            controller: controller.voltsr2,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.voltsr3.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'S-T',
                            controller: controller.voltsr3,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.voltsr4.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'L-T',
                            controller: controller.voltsr4,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //4
                  SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    Expanded(child: Text('Ampere')),
                    Expanded(
                      child: Container(
                        child: CustomTextField(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.amp1.clear();
                              },
                              icon: const Icon(Icons.close)),
                          label: 'l1',
                          controller: controller.amp1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: CustomTextField(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.amp2.clear();
                              },
                              icon: const Icon(Icons.close)),
                          label: 'l2',
                          controller: controller.amp2,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: CustomTextField(
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.amp3.clear();
                              },
                              icon: const Icon(Icons.close)),
                          label: 'l3',
                          controller: controller.voltsr3,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    )
                  ]),
                  //5
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Ketahanan')),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.kthn1.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'L1-L2',
                            controller: controller.kthn1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.kthn2.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'L2-L3',
                            controller: controller.kthn2,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Container(
                          child: CustomTextField(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.kthn3.clear();
                                },
                                icon: const Icon(Icons.close)),
                            label: 'L3-L1',
                            controller: controller.kthn3,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //uploadfoto
                  SizedBox(
                    height: 5,
                  ),
                  controller.imagefiles!.isEmpty
                      ? Container(
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
                              controller.openImages();
                            },
                            child: Text(
                              'Upload Foto',
                              style: Constants.whiteTextStyle,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.openImages();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Wrap(
                              children: controller.imagefiles!.map((imageone) {
                                return Container(
                                    child: Card(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.file(File(imageone.path)),
                                  ),
                                ));
                              }).toList(),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  //konfklien
                  CustomTextField(
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.konfklien.clear();
                        },
                        icon: const Icon(Icons.close)),
                    label: 'Konfirmasi Klien',
                    controller: controller.konfklien,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10,
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
                        controller.insertDetailRespon(prefC.memberId,
                            controller.responId, controller.listImagePath);
                        controller.p.value++;
                      },
                      child: Text(
                        'Submit',
                        style: Constants.whiteTextStyle,
                      ),
                    ),
                  )
                  //button
                  // ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
