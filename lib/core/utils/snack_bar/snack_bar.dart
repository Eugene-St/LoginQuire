import 'package:flutter/material.dart';
import 'package:quireloginform/core/utils/constants.dart';

extension FailureSnackBar on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String message,
      {int durationInSeconds = 5}) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    return ScaffoldMessenger.of(this)
        .showSnackBar(snackBar(message, durationInSeconds, true));
  }
}

extension MissSnackBar on BuildContext {
  SnackBar snackBar(String message, int durationInSeconds, bool isError) {
    return SnackBar(
      backgroundColor: AppColors.textfieldBackgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: durationInSeconds),
      dismissDirection: DismissDirection.up,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(this).size.height - 170,
        left: 10,
        right: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.cancel,
            color: AppColors.primaryRed,
            size: 40.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Please try again.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
