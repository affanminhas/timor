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

import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

const String testAPIKey =
    'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
const String liveAPiKEy =
    '7V0FCLqVxWynk1yqq64otj-WPqaGINo_vgilZr5kkJvQaw1AAeBAWnU-tufw49Gi4yJU8bMwCYP-Di2lme2PAMCk1j72xKrc1jqiYh64m6ZIyiGA5Ve945CWyPjLWH0IQjIi8d1-V01711O0ajSWcj_0zu4BugLRkYKFkhdJBY6ukpQKgP9bujahQmfH2x7h7jyEm4BWc6lVBZLc837-djQnZbErpN6D18zlrYMJzy_h3w2mt2xZ1tNuZg1-_8c-muS6PVJqyqDi0bmo_sBV3LEZhsLQG1TMgdQakcfOqvykMKEadogD1gTaLZIZNt8Es8W5NV--vPfiKcEahlyeY7MESsf1rd6jgH9DW66W6QR_jtJhz7vc-iWjv-vvEEsh1EdiPPZJ1BCnHJaUOCRXhxGqh1kvgvngDFbawecY3KciIyCXKWk1cR5Gi0nj1vhu29BlnL1vybxM4fSkUmgE7FjIEk1wnRoILVAjjAcNwhprG0EZTIXApYrxrENpyItrSNSKlEH8adyhwTL7PXg7ptegLXVrjNRazbygDKm88LU5YeDetQXu86ggep1aCfgnJXpqia-Y5Knou0z9QI8ACCVKuCVZ8YjH4VhCWFRtSqrsfoJL0ITgYjNDmeqG44mAYegZ3hQAwQXPYtFs6UInjnXXxsASIN7dCcL4ZWbFpDgSbb3M';

class MyFatoorahGooglePay extends StatefulWidget {
  const MyFatoorahGooglePay({
    super.key,
    this.width,
    this.height,
    required this.price,
  });

  final double? width;
  final double? height;
  final double price;

  @override
  State<MyFatoorahGooglePay> createState() => _MyFatoorahGooglePayState();
}

class _MyFatoorahGooglePayState extends State<MyFatoorahGooglePay> {
  late MFGooglePayButton mfGooglePayButton;
  String? _response = '';

  @override
  void initState() {
    super.initState();
    initiate();
  }

  initiate() async {
    if (testAPIKey.isEmpty) {
      setState(() {
        _response =
            'Missing API Token Key.. You can get it from here: https://myfatoorah.readme.io/docs/test-token';
      });
      return;
    }

    /// Initialize MyFatoorah SDK
    await MFSDK.init(liveAPiKEy, MFCountry.SAUDIARABIA, MFEnvironment.LIVE);

    /// Initiate session for Google Pay
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initSession();
    });
  }

  /// Initiate session for Google Pay
  initSession() async {
    MFInitiateSessionRequest initiateSessionRequest =
        MFInitiateSessionRequest();

    await MFSDK
        .initSession(initiateSessionRequest, MFLanguage.ENGLISH)
        .then((sessionResponse) => {
              setupGooglePayHelper(sessionResponse.sessionId),
            })
        .catchError((error) {
      setState(() {
        _response = error.message;
      });
    });
  }

  /// Setup Google Pay with session ID
  setupGooglePayHelper(String sessionId) async {
    MFGooglePayRequest googlePayRequest = MFGooglePayRequest(
      totalPrice: widget.price.toString(),
      merchantId: "your_google_merchant_id",

      /// Replace with your actual Google merchant ID
      merchantName: "Test Vendor",
      countryCode: MFCountry.SAUDIARABIA,

      /// Use appropriate country code
      currencyIso: MFCurrencyISO.SAUDIARABIA_SAR,
    );

    await mfGooglePayButton.setupGooglePayHelper(sessionId, googlePayRequest,
        (invoiceId) {
      debugPrint("-----------Invoice Id: $invoiceId------------");
    }).then((value) {
      debugPrint("Google Pay setup successful: $value");
    }).catchError((error) {
      setState(() {
        _response = error.message;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mfGooglePayButton = const MFGooglePayButton();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  child: mfGooglePayButton,
                ),
                const SizedBox(height: 20),
                Text(
                  _response ?? '',
                  style: const TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
