import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom/custom_widget_list_download/custom_list_type_download.dart';
import '../facebook/facebook_controller.dart';

class FacebookListDownloadPage extends GetView<FacebookController> {
  const FacebookListDownloadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FacebookController>(
      init: FacebookController(Get.find()),
      builder: (controller) {
        return SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          width: 40,
                          imageUrl:
                              "https://t.ctcdn.com.br/EcVRwWsN2h2cC3imhLhAddCcZsg=/400x400/smart/filters:format(webp)/i489928.jpeg",
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                            color: Colors.white,
                          )),
                          errorWidget: (context, url, error) => const Padding(
                            padding: EdgeInsets.only(top: 5, left: 8),
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          controller.responseFacebook!.hasil.title,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.ideographic),
                        ),
                      ),
                    ],
                  ),
                  // const Divider(),
                  const SizedBox(
                    height: 4,
                  ),
                  const Divider(),

                  Row(
                    children: const [
                      Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Vídeo",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  controller.responseFacebook == null
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            controller.arquivo =
                                controller.responseFacebook!.hasil.hd;
                            controller.format = ".mp4";

                            controller.isSelected();
                          },
                          child: CustomListTypeDownload(
                              type: "760P",
                              typesize: "MP4",
                              size: "N/P",
                              isSelected: controller.isSelectedItem),
                        ),

                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          child: controller.isBtnDownload
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  onPressed: () {
                                    controller.downloadFile();
                                  },
                                  child: const Text(
                                    "Baixar",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ))
                              : const Center(
                                  child: CircularProgressIndicator(
                                  backgroundColor: Colors.red,
                                  color: Colors.white,
                                ))))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
