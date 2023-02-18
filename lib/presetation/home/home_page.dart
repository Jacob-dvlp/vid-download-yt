import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  static String routNamed = "/home";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Vidéos'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: List.generate(
                  12,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 40,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                    child: FlutterLogo(
                                      textColor: Colors.red,
                                      size: 100,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Flutterando",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        const Text(
                                          "Estudando o flutter 2023",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text("Download disponível"),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.download,
                                                  color: Colors.red,
                                                ),
                                                Text("MP4"),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.download,
                                                  color: Colors.red,
                                                ),
                                                Text("MP3"),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                    width: 52,
                                                    child:
                                                        LinearProgressIndicator(
                                                      color: Colors.red,
                                                      backgroundColor:
                                                          Colors.white,
                                                      value: 5,
                                                    ))
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
            ),
          ),
        );
      },
    );
  }
}
