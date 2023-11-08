import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tehnikpompa/app/modules/home/bindings/home_binding.dart';
import 'package:tehnikpompa/app/modules/home/views/home_view.dart';
import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  final loginKey = GlobalKey<FormState>();
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final diff = DateTime.now().difference(timeBackPressed);
        final isExitWarning = diff >= Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 14);
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Selamat datang di Applikasi',
              style: GoogleFonts.montserrat(fontSize: 18)),
          backgroundColor: const Color.fromRGBO(36, 40, 91, 1),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  'assets/logoTehnikPompa.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Center(
                child: Text(
                  'PT. Tehnik Pompa',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: loginKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: GoogleFonts.montserrat(fontSize: 14),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: 'Masukkan Email Anda',
                            labelStyle: TextStyle(fontSize: 14),
                            hintText: 'example@gmail.com',
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email Wajib Diisi !';
                          } else if (!value.isEmail) {
                            return 'Email Anda Salah !';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Obx(
                        () => TextFormField(
                          obscureText: controller.showPassword.value,
                          controller: controller.password.value,
                          style: GoogleFonts.montserrat(fontSize: 14),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Masukkan Password Anda',
                            labelStyle: const TextStyle(fontSize: 14),
                            hintStyle: const TextStyle(fontSize: 14),
                            border: const OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.toggleVisibility();
                              },
                              child: Icon(
                                controller.showPassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Wajib Diisi !';
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 42),
                            primary: const Color.fromRGBO(36, 40, 91, 1),
                            shadowColor: Colors.black,
                          ),
                          onPressed: () {
                            if (!loginKey.currentState!.validate()) {
                              return;
                            } else {
                              //goto
                              Get.offAll(()=>HomeView(), binding: HomeBinding());
                            }
                          },
                          child: Text(
                            'Masuk',
                            style: GoogleFonts.montserrat(fontSize: 14),
                          )),
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
