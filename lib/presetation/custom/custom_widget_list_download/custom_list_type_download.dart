import 'package:flutter/material.dart';

class CustomListTypeDownload extends StatelessWidget {
  final String type;
  final String typesize;
  final String size;
  final bool isSelected;
  const CustomListTypeDownload(
      {Key? key,
      required this.type,
      required this.typesize,
      required this.size,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  isSelected
                      ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(color: Colors.black)
                          ),
                        )
                      : Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(color: Colors.black)
                          ),
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    type,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Flexible(
                child: Text(
                  typesize,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 14),
                ),
              ),
              Text(
                size,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
