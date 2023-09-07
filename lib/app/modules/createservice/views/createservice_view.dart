import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../controllers/createservice_controller.dart';

class CreateserviceView extends GetView<CreateserviceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
          toolbarHeight: 150,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          flexibleSpace: SafeArea(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              //obx
              Center(
                child: CircularPercentIndicator(
                    radius: 40,
                    progressColor: Colors.green[600],
                    backgroundColor: Colors.white,
                    lineWidth: 10,
                    animation: true,
                    percent: 1 / 4,
                    center: Text(
                      "1/4",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    )),
              ),
              Expanded(
                child: Center(
                  child: ListTile(
                    title: Text(
                      "Buat Servis Anda",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Form(
                  key: controller.globalKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(children: <Widget>[
                          TextFormField(
                            controller: controller.NomorKTP,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(16)
                            ],
                            maxLength: 16,
                            decoration: InputDecoration(
                                labelText: 'Nama Service',
                                labelStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama Service Wajib Diisi!';
                              }
                            },
                            onSaved: (value) {
                              controller.NomorKTP.text = value!;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: controller.NomorTelepon,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(13)
                            ],
                            maxLength: 13,
                            decoration: InputDecoration(
                                labelText: 'Nomor Telepon',
                                labelStyle: TextStyle(fontSize: 14),
                                hintText: '85627900888',
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nomor Telepon Wajib Diisi!';
                              } else if (!value.isNum) {
                                return 'Nomor Telepon Wajib Angka!';
                              } else if (int.parse(value) < 10) {
                                return 'Nomor Telepon Kurang Lengkap!';
                              }
                            },
                            onSaved: (value) {
                              controller.NomorTelepon.text = value!;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: controller.Email,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(13)
                            ],
                            maxLength: 13,
                            decoration: InputDecoration(
                                labelText: 'Lokasi',
                                labelStyle: TextStyle(fontSize: 14),
                                hintText: 'Semarang',
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nomor Lokasi Wajib Diisi!';
                              }
                            },
                            onSaved: (value) {
                              controller.NomorTelepon.text = value!;
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 42),
                                primary: Color.fromRGBO(36, 40, 91, 1),
                                shadowColor: Colors.black,
                              ),
                              onPressed: () {
                                if (!controller.globalKey.currentState!
                                    .validate()) {
                                  return;
                                } else {}
                              },
                              child: Text(
                                'Lanjut',
                                style: TextStyle(fontSize: 14),
                              ))
                        ]),
                      ),
                    ],
                  )),
            ),
          ),
        ));
  }
}
