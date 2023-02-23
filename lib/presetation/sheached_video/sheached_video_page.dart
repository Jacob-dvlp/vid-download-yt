import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../facebook/facebook_page.dart';
import 'sheached_video_controller.dart';

class SheachedVideoPage extends GetView<SheachedVideoController> {
  const SheachedVideoPage({Key? key}) : super(key: key);
  static String routNamed = "/search";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: GetBuilder<SheachedVideoController>(
        init: SheachedVideoController(Get.find()),
        builder: (controller) {
          return SingleChildScrollView(
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
                    maxLength: 50,
                    decoration: const InputDecoration(
                      labelText: 'Titulo do vídeo',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: "Qual vídeo pretendes baixar",
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
                            onPressed: () => controller.getVideoYT(),
                            child: const Text("Buscar o Vídeo no You tube")),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.red,
                          color: Colors.white,
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () => Get.toNamed(FacebookPage.routNamed),
                      child: const Text("Baixar video do facebook")),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
