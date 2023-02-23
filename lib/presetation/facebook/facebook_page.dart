import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'facebook_controller.dart';

class FacebookPage extends GetView<FacebookController> {
  const FacebookPage({Key? key}) : super(key: key);
  static String routNamed = "/facebook";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacebookController>(
      init: FacebookController(Get.find()),
      builder: (controller) {
        return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: CircleAvatar(
                backgroundColor: Colors.red,
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 450,
                        width: Get.width,
                        color: const Color(0xFFF44336),
                        child: Image.asset(
                          "assets/bg.png",
                          color: Colors.white,
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(),
                    child: TextFormField(
                      controller: controller.searchText,
                      decoration: const InputDecoration(
                        labelText: 'Cola o link do vídeo',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                        helperText: "Colar o link do video do  facebook",
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  controller.isLoading
                      ? SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () => controller.facebook(),
                              child: const Text("Buscar o Vídeo no facebook")),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                            color: Colors.white,
                          ),
                        ),
                ],
              ),
            ));
      },
    );
  }
}
