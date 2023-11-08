import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daftarservis_controller.dart';

class DaftarservisView extends GetView<DaftarservisController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DaftarservisView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DaftarservisView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
