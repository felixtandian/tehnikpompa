import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/itemfetcher.dart';
import 'package:tehnikpompa/app/modules/daftarservis/controllers/daftarservis_controller.dart';
import 'package:tehnikpompa/utils/constant.dart';


class DaftarservisView extends GetView<DaftarservisController> {
  final _pairList = <WordPair>[WordPair.random()];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _itemFetcher = ItemFetcher();
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
        child: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all( 8.0),
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
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.listsData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 120,
                          child: Container(
                            
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Nama : ' + controller.listsData[index].first,
                                  style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Tanggal  : ' + controller.listsData[index][1],
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ),
                                Text(
                                  'Status : ' + controller.listsData[index][3],
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ),
                                Text(
                                  'Teknisi  : ' + controller.listsData[index].last,
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ),
                              ],
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
