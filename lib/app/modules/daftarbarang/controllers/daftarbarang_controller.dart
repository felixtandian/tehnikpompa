import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/modelbarang.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/widgets/itemfetcher.dart';

class DaftarbarangController extends GetxController {
  //TODO: Implement DaftarbarangController
  List<Model> list = [];
  ScrollController scrollController = ScrollController();
  int listLength = 6;

  final pairList = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18.0);
  final itemFetcher = ItemFetcher();
  RxBool isLoading = true.obs;
  RxBool hasMore = true.obs;

  final List<String> _suggestions = [
    'IMPELLER',
    'ISO 65',
    'ELECTRODE MASSA',
    'MCB 20',
    'PFR MINILEC',
    'WLC P1 MINILEC',
    'STEPPING RELAY',
    'CABLE PLUG',
    'OVERLOAD CHINT',
    'PUSH BUTTON'
  ];

  Rx<TextEditingController> searchTextController = TextEditingController().obs;

  void loadMore() {
    isLoading.value = true;
    itemFetcher.fetch().then((List<WordPair> fetchedList) {
      if (fetchedList.isEmpty) {
        isLoading.value = false;
        hasMore.value = false;
      } else {
        isLoading.value = false;
        pairList.addAll(fetchedList);
      }
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    isLoading.value = true;
    hasMore.value = true;
    generateList();
    addItems();
    super.onInit();
  }

  generateList() {
    list = List.generate(
        listLength, (index) => Model(name: (index + 1).toString()));
  }

  addItems() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        for (int i = 0; i < 2; i++) {
          listLength++;
          list.add(Model(name: (listLength).toString()));
          update(); //update GetBuilder each time
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
