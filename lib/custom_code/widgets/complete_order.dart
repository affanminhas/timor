// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:developer';
import 'package:my_fatoorah/my_fatoorah.dart';

class CompleteOrder extends StatefulWidget {
  const CompleteOrder({
    super.key,
    this.width,
    this.height,
    required this.invoiceAmount,
  });

  final double? width;
  final double? height;
  final double invoiceAmount;

  @override
  State<CompleteOrder> createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder> {
  Future<void> payNow() async {
    var response = await MyFatoorah.startPayment(
      context: context,
      request: MyfatoorahRequest.live(
        currencyIso: Country.SaudiArabia,
        successUrl:
            'https://firebasestorage.googleapis.com/v0/b/speed-vision-95eaa.appspot.com/o/Success.png?alt=media&token=05d6bc6d-21eb-4ddc-afc6-2d94d2a33a2d',
        errorUrl:
            'https://firebasestorage.googleapis.com/v0/b/speed-vision-95eaa.appspot.com/o/Unscessful.png?alt=media&token=b485fcaa-324b-4cd2-9369-8d191018d2a1',
        invoiceAmount: widget.invoiceAmount,
        language: ApiLanguage.English,
        token:
            '7V0FCLqVxWynk1yqq64otj-WPqaGINo_vgilZr5kkJvQaw1AAeBAWnU-tufw49Gi4yJU8bMw'
            'CYP-Di2lme2PAMCk1j72xKrc1jqiYh64m6ZIyiGA5Ve945CWyPjLWH0IQjIi8d1-V01711O0ajS'
            'Wcj_0zu4BugLRkYKFkhdJBY6ukpQKgP9bujahQmfH2x7h7jyEm4BWc6lVBZLc837-djQnZbErpN6D18zlrYM'
            'Jzy_h3w2mt2xZ1tNuZg1-_8c-muS6PVJqyqDi0bmo_sBV3LEZhsLQG1TMgdQakcfOqvykMKEadogD1gTaLZIZNt8Es8W5'
            'NV--vPfiKcEahlyeY7MESsf1rd6jgH9DW66W6QR_jtJhz7vc-iWjv-vvEEsh1EdiPPZJ1BCnHJaUOCRXhxGqh1kvgvng'
            'DFbawecY3KciIyCXKWk1cR5Gi0nj1vhu29BlnL1vybxM4fSkUmgE7FjIEk1wnRoILVAjjAcNwhprG0EZTIXApYrxrEN'
            'pyItrSNSKlEH8adyhwTL7PXg7ptegLXVrjNRazbygDKm88LU5YeDetQXu86ggep1aCfgnJXpqia-Y5Knou0z9QI8ACCV'
            'KuCVZ8YjH4VhCWFRtSqrsfoJL0ITgYjNDmeqG44mAYegZ3hQAwQXPYtFs6UInjnXXxsASIN7dCcL4ZWbFpDgSbb3M',
      ),
    );
    log(response.paymentId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          minWidth: double.infinity,
          height: 48,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: const Color(0xFFC48A07),
          onPressed: () => payNow(),
          child: const Text(
            'Complete the order',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Rubik',
            ),
          ),
        ),
      ),
    );
  }
}
