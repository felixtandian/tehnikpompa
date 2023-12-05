import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/itemfetcher.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/listItemBarang.dart';
import 'package:tehnikpompa/utils/constant.dart';
import '../controllers/daftarbarang_controller.dart';

DaftarbarangController daftarbarangController =
    Get.put(DaftarbarangController());

class DaftarbarangView extends GetView<DaftarbarangController> {
  final _pairList = <WordPair>[WordPair.random()];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _itemFetcher = ItemFetcher();
  final DaftarbarangController daftarbarangController =
      Get.put(DaftarbarangController());
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
        child: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.searchTextController.value,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: Constants.blacktextStyle,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () =>
                            controller.searchTextController.value.clear(),
                      ),
                      // Add a search icon or button to the search bar
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Perform the search here
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Obx(
                            () => controller.daftarBarangModel.isNotEmpty
                                ? ListView.builder(
                                    padding: EdgeInsets.all(10),
                                    physics: ClampingScrollPhysics(),
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
                                : Center(child: Text('Barang tidak ditemukan')),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
