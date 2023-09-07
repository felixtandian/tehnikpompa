import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/createservice/bindings/createservice_binding.dart';
import 'package:tehnikpompa/app/modules/createservice/views/createservice_view.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/bindings/daftarbarang_binding.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/views/daftarbarang_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
          SizedBox(
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
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage', style: GoogleFonts.montserrat(fontSize: 18)),
        backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color.fromRGBO(36, 40, 91, 1),
        child: Container(
          height: 800,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Container(
            margin: EdgeInsets.all(5),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                ExpansionCard(
                  background: Image.asset('assets/navyblue.jpg'),
                  borderRadius: 30,
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Selamat Siang,",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Felix",
                          style: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Text("Content goes over here !",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, color: Colors.white)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Layanan',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
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
                            GestureDetector(
                              child: selectedLayanan(
                                  image: 'assets/iconProduct.png',
                                  name: 'Daftar Barang'),
                              onTap: () {
                                Get.to(DaftarbarangView(),
                                    binding: DaftarbarangBinding());
                              },
                            ),
                            GestureDetector(
                              child: selectedLayanan(
                                  image: 'assets/iconDocument.png',
                                  name: 'Insert Service'),
                              onTap: () {
                                Get.to(CreateserviceView(),
                                    binding: CreateserviceBinding());
                              },
                            ),
                            GestureDetector(
                              child: selectedLayanan(
                                  image: 'assets/iconDocuments.png',
                                  name: 'Daftar Service'),
                              onTap: () {
                                Get.to(DaftarbarangView(),
                                    binding: DaftarbarangBinding());
                              },
                            ),
                            selectedLayanan(
                                image: 'assets/iconProduct.png',
                                name: 'Service Saya'),
                          ],
                        ),
                      ),
                      Text(
                        'Utility',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
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
    );
  }
}
