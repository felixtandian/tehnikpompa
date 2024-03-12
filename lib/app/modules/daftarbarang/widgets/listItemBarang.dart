import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tehnikpompa/app/modules/daftarbarang/models/daftarBarangModel.dart';
import 'package:tehnikpompa/utils/constant.dart';

class ListItemBarang extends StatelessWidget {
  final DaftarBarangModel? model;
  const ListItemBarang({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.grey.shade500,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            model!.namaBarang,
            style: Constants.boldBlackTitle,
          ),
          SizedBox(height: 10),
          Text(
            model!.kodeBarang,
            style: Constants.blacktextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'Stock Indent : ' + model!.stokIndent.toString(),
            style: Constants.blacktextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'Stock Barang : ' + model!.stokBarang.toString(),
            style: Constants.blacktextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'Total Booking : ' + model!.totalBooking.toString(),
            style: Constants.blacktextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'Keterangan Booking : ' + model!.noteBooking.toString(),
            style: Constants.blacktextStyle,
          )
        ]),
      ),
    );
  }
}
