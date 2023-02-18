import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sheached_video_controller.dart';

class SheachedVideoPage extends GetView<SheachedVideoController> {
  const SheachedVideoPage({Key? key}) : super(key: key);
  static String routNamed = "/search";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buscador de Vídeos'),
          centerTitle: true,
        ),
        body: GetBuilder<SheachedVideoController>(
          init: SheachedVideoController(Get.find()),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: TextFormField(
                    controller: controller.searchText,
                    maxLength: 20,
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
                controller.isLoading
                    ? ElevatedButton(
                        onPressed: () => controller.getVideoYT(),
                        child: const Text("Buscar o Vídeo"))
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            );
          },
        ));
  }
}
