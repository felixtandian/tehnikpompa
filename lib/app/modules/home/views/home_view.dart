import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/createservice/bindings/createservice_binding.dart';
import 'package:tehnikpompa/app/modules/createservice/views/createservice_view.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/bindings/daftarbarang_binding.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/controllers/daftarbarang_controller.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/views/daftarbarang_view.dart';
import 'package:tehnikpompa/app/modules/daftarservis/bindings/daftarservis_binding.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/daftarServisSaya.dart';
import 'package:tehnikpompa/app/modules/daftarservis/views/daftarservis_view.dart';
import 'package:tehnikpompa/app/modules/loginscreen/controllers/loginscreen_controller.dart';
import 'package:tehnikpompa/utils/constant.dart';
import 'package:tehnikpompa/utils/prefController.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  DateTime timeBackPressed = DateTime.now();
  DaftarbarangController barangC = Get.put(DaftarbarangController());
  DaftarservisController servisC = Get.put(DaftarservisController());
  LoginscreenController loginC = Get.put(LoginscreenController());
  PrefController prefC = Get.put(PrefController());
  Widget selectedLayanan({required String image, required String name}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: GoogleFonts.montserrat(fontSize: 17),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final diff = DateTime.now().difference(timeBackPressed);
        final isExitWarning = diff >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 14);
          return false;
        } else {
          Fluttertoast.cancel();
          exit(0);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('HomePage', style: GoogleFonts.montserrat(fontSize: 18)),
          backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Apakah anda yakin ingin logout?',
                          style: Constants.blacktextStyle,
                        ),
                        actions: [
                          TextButton(
                                Text("BATAL", style: Constants.blacktextStyle),
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
                              prefC.removeUserInfo();
                              Get.offAndToNamed('/loginscreen');
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.blueGrey],
          )),
          child: Container(
            height: 800,
            width: Get.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.greetings.value == 'Malam'
                            ? Colors.blueGrey[900]
                            : Colors.blue),
                    child: ListTile(
                      title: Text(
                        'Hello, ' + prefC.memberName,
                        style: Constants.whiteTextStyle,
                      ),
                      subtitle: Text(
                        'Selamat ' + controller.greetings.value,
                        style: Constants.whiteTextStyle,
                      ),
                      leading: Icon(Icons.account_circle_rounded, size: 30),
                      iconColor: Colors.white,
                      contentPadding: EdgeInsets.all(20),
                      dense: true,
                    ),
                  ),
                  // Container(
                  //   width: 100.0,
                  //   height: 100.0,
                  //   decoration: const ShapeDecoration(
                  //       shape: CircleBorder(), color: Colors.white),
                  //   child: const Padding(
                  //     padding: EdgeInsets.all(8.0),
                  //     child: DecoratedBox(
                  //       decoration: ShapeDecoration(
                  //           shape: CircleBorder(),
                  //           image: DecorationImage(
                  //               fit: BoxFit.cover,
                  //               image: NetworkImage(
                  //                 'https://icons8.com/icon/H5Opo8lXb2Hy/morning',
                  //               ))),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Layanan',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 280,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.30,
                            children: [
                              prefC.flagIsTeknisi
                                  ? SizedBox(height: 0)
                                  : GestureDetector(
                                      child: selectedLayanan(
                                          image: 'assets/iconProduct.png',
                                          name: 'Daftar Barang'),
                                      onTap: () async {
                                        // await barangC.getData();
                                        await barangC.getDaftarBarang(
                                            1, '', '', 1);

                                        Get.to(() => DaftarbarangView(),
                                            binding: DaftarbarangBinding());
                                      },
                                    ),
                              prefC.flagIsTeknisi
                                  ? SizedBox(height: 0)
                                  : GestureDetector(
                                      child: selectedLayanan(
                                          image: 'assets/iconDocument.png',
                                          name: 'Insert Service'),
                                      onTap: () {
                                        Get.to(() => CreateserviceView(),
                                            binding: CreateserviceBinding());
                                      },
                                    ),
                              GestureDetector(
                                child: selectedLayanan(
                                    image: 'assets/iconDocuments.png',
                                    name: 'Daftar Service'),
                                onTap: () async {
                                  await servisC.getDaftarServis(1, '', '', 1);
                                  Get.to(() => DaftarservisView(),
                                      binding: DaftarservisBinding());
                                },
                              ),
                              GestureDetector(
                                child: selectedLayanan(
                                    image: 'assets/iconProduct.png',
                                    name: 'Service Saya'),
                                onTap: () async {
                                  await servisC.getDaftarServisUser(
                                      prefC.memberRoleId, prefC.memberId, 1);
                                  log(prefC.memberId);
                                  Get.to(() => DaftarServiceSaya(),
                                      binding: DaftarservisBinding());
                                },
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   'Utility',
                        //   style: GoogleFonts.montserrat(
                        //     fontSize: 14,
                        //   ),
                        // ),
                        // Container(
                        //   child: ListView(
                        //     children: [
                        //       ItemUtility(
                        //         id: 1,
                        //         name: 'Pendingan Servis',
                        //         onTap: (){

                        //         },
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
