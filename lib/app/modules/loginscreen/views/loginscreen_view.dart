import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        
      ),
      body: Center(
        child: Text(
          'LoginscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
