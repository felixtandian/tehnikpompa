import 'package:flutter/material.dart';
import 'package:tehnikpompa/app/modules/daftarservis/model/daftarServisModel.dart';
import 'package:tehnikpompa/utils/constant.dart';

class DaftarServisWidget extends StatelessWidget {
  final DaftarServisModel? model;
  final Function() onTap;
  const DaftarServisWidget({
    Key? key,
    required this.onTap,
    required this.model,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
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
            model!.id,
            style: Constants.boldBlackTitle,
          ),
          Text(
            model!.nama,
            style: Constants.boldBlackTitle,
          ),
          SizedBox(height: 10),
          Text(
            model!.createdDate.toString(),
            style: Constants.blacktextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'Status : ' + model!.status.toString(),
            style: Constants.blacktextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'Teknisi 1 : ' + model!.teknisi1.toString(),
            style: Constants.blacktextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'Teknisi 2 : ' + model!.teknisi2.toString(),
            style: Constants.blacktextStyle,
          )
        ]),
      ),
    );
  }
}
