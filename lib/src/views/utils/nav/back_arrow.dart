import 'package:flutter/material.dart';

class BackArrow extends StatefulWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  State<BackArrow> createState() => _BackArrowState();
}

class _BackArrowState extends State<BackArrow> {
  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              print("object");
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Color.fromRGBO(178, 35, 35, 1),
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
