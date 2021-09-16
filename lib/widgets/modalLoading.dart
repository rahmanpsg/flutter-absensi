import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void modalBottomSheetLoading(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    // backgroundColor: bgColor,
    builder: (BuildContext bc) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/loading.json',
            repeat: false,
            height: 200,
          ),
        ],
      );
    },
  );
}
