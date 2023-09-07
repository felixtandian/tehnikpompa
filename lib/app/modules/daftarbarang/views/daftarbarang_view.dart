import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/itemfetcher.dart';
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
                AnimSearchBar(
                  color: Colors.white,
                  helpText: 'Masukkan Nama Barang',
                  width: Get.width,
                  textController: controller.searchTextController.value,
                  onSuffixTap: () {
                    controller.searchTextController.value.clear();
                  },
                  onSubmitted: (String) {},
                  autoFocus: true,
                  closeSearchOnSuffixTap: true,
                  animationDurationInMilli: 2000,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 500,
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 100,
                          child: Center(
                            child: Text(
                              'Barang ' + controller.list[index].name,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
