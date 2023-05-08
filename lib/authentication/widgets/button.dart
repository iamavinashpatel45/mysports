import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String text;
  final Function() ontap;

  const button({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Material(
        elevation: 10,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: Container(
          width: 370,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            // border: Border.all(
            //   color: Colors.black,
            // ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
