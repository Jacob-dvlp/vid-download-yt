import 'package:flutter/material.dart';

class CustomListTypeDownload extends StatelessWidget {
  final String type;
  final String typesize;
  final String size;
  const CustomListTypeDownload(
      {Key? key,
      required this.type,
      required this.typesize,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                maxRadius: 5,
                backgroundColor: Colors.red,
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
    );
  }
}
