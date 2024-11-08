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

import 'dart:convert';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

const String testAPIKey =
    'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
const String liveAPiKEy =
    '7V0FCLqVxWynk1yqq64otj-WPqaGINo_vgilZr5kkJvQaw1AAeBAWnU-tufw49Gi4yJU8bMwCYP-Di2lme2PAMCk1j72xKrc1jqiYh64m6ZIyiGA5Ve945CWyPjLWH0IQjIi8d1-V01711O0ajSWcj_0zu4BugLRkYKFkhdJBY6ukpQKgP9bujahQmfH2x7h7jyEm4BWc6lVBZLc837-djQnZbErpN6D18zlrYMJzy_h3w2mt2xZ1tNuZg1-_8c-muS6PVJqyqDi0bmo_sBV3LEZhsLQG1TMgdQakcfOqvykMKEadogD1gTaLZIZNt8Es8W5NV--vPfiKcEahlyeY7MESsf1rd6jgH9DW66W6QR_jtJhz7vc-iWjv-vvEEsh1EdiPPZJ1BCnHJaUOCRXhxGqh1kvgvngDFbawecY3KciIyCXKWk1cR5Gi0nj1vhu29BlnL1vybxM4fSkUmgE7FjIEk1wnRoILVAjjAcNwhprG0EZTIXApYrxrENpyItrSNSKlEH8adyhwTL7PXg7ptegLXVrjNRazbygDKm88LU5YeDetQXu86ggep1aCfgnJXpqia-Y5Knou0z9QI8ACCVKuCVZ8YjH4VhCWFRtSqrsfoJL0ITgYjNDmeqG44mAYegZ3hQAwQXPYtFs6UInjnXXxsASIN7dCcL4ZWbFpDgSbb3M';

class MyFatoorahApplePay extends StatefulWidget {
  const MyFatoorahApplePay({
    super.key,
    this.width,
    this.height,
    required this.price,
  });

  final double? width;
  final double? height;
  final double price;

  @override
  State<MyFatoorahApplePay> createState() => _MyFatoorahApplePayState();
}

class _MyFatoorahApplePayState extends State<MyFatoorahApplePay> {
  String? _response = '';

  double amount = 5.00;
  late MFApplePayButton mfApplePayButton;

  @override
  void initState() {
    amount = widget.price;
    initiate();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initiate() async {
    if (testAPIKey.isEmpty) {
      setState(() {
        _response =
            'Missing API Token Key.. You can get it from here: https://myfatoorah.readme.io/docs/test-token';
      });
      return;
    }

    await MFSDK.init(liveAPiKEy, MFCountry.SAUDIARABIA, MFEnvironment.LIVE);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initSession();
    });
  }

  log(Object object) {
    var json = const JsonEncoder.withIndent('  ').convert(object);
    setState(() {
      debugPrint(json);
      _response = json;
    });
  }

  initSession() async {
    MFInitiateSessionRequest initiateSessionRequest =
        MFInitiateSessionRequest();

    await MFSDK
        .initSession(initiateSessionRequest, MFLanguage.ARABIC)
        .then((value) => loadEmbeddedPayment(value))
        .catchError((error) => {log(error.message)});
  }

  loadEmbeddedPayment(MFInitiateSessionResponse session) async {
    MFExecutePaymentRequest executePaymentRequest =
        MFExecutePaymentRequest(invoiceValue: widget.price);
    executePaymentRequest.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;
    await applePayPayment(session);
    await MFApplepay.setupApplePay(
        session, executePaymentRequest, MFLanguage.ARABIC);
  }

  applePayPayment(MFInitiateSessionResponse session) async {
    MFExecutePaymentRequest executePaymentRequest =
        MFExecutePaymentRequest(invoiceValue: widget.price);
    executePaymentRequest.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;

    await mfApplePayButton
        .displayApplePayButton(
            session, executePaymentRequest, MFLanguage.ARABIC)
        .then((value) => {
              log(value),
              mfApplePayButton
                  .executeApplePayButton(null, (invoiceId) => log(invoiceId))
                  .then((value) => log(value))
                  .catchError((error) => {log(error.message)})
            })
        .catchError((error) => {log(error.message)});
  }

  @override
  Widget build(BuildContext context) {
    mfApplePayButton = MFApplePayButton(applePayStyle: MFApplePayStyle());
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Flex(
              direction: Axis.vertical,
              children: [applePayView()],
            ),
          ),
        ),
      ),
    );
  }

  Widget applePayView() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: mfApplePayButton,
        )
      ],
    );
  }
}
