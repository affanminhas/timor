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

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

const String testAPIKey =
    'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
const String liveAPiKEy =
    '7V0FCLqVxWynk1yqq64otj-WPqaGINo_vgilZr5kkJvQaw1AAeBAWnU-tufw49Gi4yJU8bMwCYP-Di2lme2PAMCk1j72xKrc1jqiYh64m6ZIyiGA5Ve945CWyPjLWH0IQjIi8d1-V01711O0ajSWcj_0zu4BugLRkYKFkhdJBY6ukpQKgP9bujahQmfH2x7h7jyEm4BWc6lVBZLc837-djQnZbErpN6D18zlrYMJzy_h3w2mt2xZ1tNuZg1-_8c-muS6PVJqyqDi0bmo_sBV3LEZhsLQG1TMgdQakcfOqvykMKEadogD1gTaLZIZNt8Es8W5NV--vPfiKcEahlyeY7MESsf1rd6jgH9DW66W6QR_jtJhz7vc-iWjv-vvEEsh1EdiPPZJ1BCnHJaUOCRXhxGqh1kvgvngDFbawecY3KciIyCXKWk1cR5Gi0nj1vhu29BlnL1vybxM4fSkUmgE7FjIEk1wnRoILVAjjAcNwhprG0EZTIXApYrxrENpyItrSNSKlEH8adyhwTL7PXg7ptegLXVrjNRazbygDKm88LU5YeDetQXu86ggep1aCfgnJXpqia-Y5Knou0z9QI8ACCVKuCVZ8YjH4VhCWFRtSqrsfoJL0ITgYjNDmeqG44mAYegZ3hQAwQXPYtFs6UInjnXXxsASIN7dCcL4ZWbFpDgSbb3M';

class MyFatoorahPayment extends StatefulWidget {
  const MyFatoorahPayment({
    super.key,
    this.width,
    this.height,
    required this.price,
  });

  final double? width;
  final double? height;
  final double price;

  @override
  State<MyFatoorahPayment> createState() => _MyFatoorahPaymentState();
}

class _MyFatoorahPaymentState extends State<MyFatoorahPayment> {
  String? _response = '';
  MFInitiateSessionResponse? session;

  List<MFPaymentMethod> paymentMethods = [];
  List<bool> isSelected = [];
  int selectedPaymentMethodIndex = -1;

  double amount = 5.00;
  bool visibilityObs = false;
  late MFCardPaymentView mfCardView;
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
      await initiatePayment();
    });
  }

  log(Object object) {
    var json = const JsonEncoder.withIndent('  ').convert(object);
    setState(() {
      debugPrint(json);
      _response = json;
    });
  }

  /// --- Initiate Payment
  initiatePayment() async {
    var request = MFInitiatePaymentRequest(
        invoiceAmount: amount, currencyIso: MFCurrencyISO.SAUDIARABIA_SAR);

    await MFSDK
        .initiatePayment(request, MFLanguage.ENGLISH)
        .then((value) => {
              log(value),
              if (value.paymentMethods != null &&
                  value.paymentMethods!.isNotEmpty)
                {
                  setState(() {
                    paymentMethods.addAll(value.paymentMethods!);
                    for (int i = 0; i < paymentMethods.length; i++) {
                      isSelected.add(false);
                    }
                  })
                }
              else
                {
                  setState(() {
                    _response = "No payment methods available.";
                  })
                }
            })
        .catchError((error) => {log(error.message)});
  }

  /// --- Poll payment status method
  startPollingPaymentStatus(String invoiceId) async {
    const duration = Duration(seconds: 5); // Poll every 5 seconds
    Timer.periodic(duration, (Timer timer) async {
      var request = MFGetPaymentStatusRequest(
          key: invoiceId, keyType: MFKeyType.INVOICEID);

      await MFSDK.getPaymentStatus(request, MFLanguage.ENGLISH).then((value) {
        log('this is response $value');
        if (value.invoiceStatus == 'Paid') {
          timer.cancel();
          setState(() {
            _response = 'Payment successful!';
          });

          /// --- Creating the firestore document from here ---
          addInvoiceIntoFirebase(value);

          //Navigator.pop(context);
          Flushbar(
            title: "Order Placed Successfully",
            message: "Invoice ID: $invoiceId",
            duration: const Duration(seconds: 3),
          ).show(context);
          // Handle success (e.g., navigate to a success screen)
        } else if (value.invoiceStatus == "Failed") {
          timer.cancel();
          setState(() {
            _response = "Payment failed.";
          });
          //Navigator.pop(context);
          Flushbar(
            title: "Failed",
            message: "Payment Failed",
            duration: const Duration(seconds: 3),
          ).show(context);
          // Handle failure (e.g., show error message)
        }
      }).catchError((error) {
        log(error.message);
      });
    });
  }

  setPaymentMethodSelected(int index, bool value) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = value;
        if (value) {
          selectedPaymentMethodIndex = index;
          visibilityObs = paymentMethods[index].isDirectPayment!;
        } else {
          selectedPaymentMethodIndex = -1;
          visibilityObs = false;
        }
      } else {
        isSelected[i] = false;
      }
    }
  }

  MFCardViewStyle cardViewStyle() {
    MFCardViewStyle cardViewStyle = MFCardViewStyle();
    cardViewStyle.cardHeight = 200;
    cardViewStyle.hideCardIcons = false;
    cardViewStyle.input?.inputMargin = 3;
    cardViewStyle.label?.display = true;
    cardViewStyle.input?.fontFamily = MFFontFamily.TimesNewRoman;
    cardViewStyle.label?.fontWeight = MFFontWeight.Light;
    return cardViewStyle;
  }

  initSession() async {
    MFInitiateSessionRequest initiateSessionRequest =
        MFInitiateSessionRequest();

    await MFSDK
        .initSession(initiateSessionRequest, MFLanguage.ENGLISH)
        .then((value) => loadEmbeddedPayment(value))
        .catchError((error) => {log(error.message)});
  }

  loadCardView(MFInitiateSessionResponse session) {
    mfCardView.load(session, (bin) {
      log(bin);
    });
  }

  loadEmbeddedPayment(MFInitiateSessionResponse session) async {
    MFExecutePaymentRequest executePaymentRequest =
        MFExecutePaymentRequest(invoiceValue: amount);
    executePaymentRequest.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;
    await loadCardView(session);
  }

  pay() async {
    var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: amount);

    await mfCardView
        .pay(executePaymentRequest, MFLanguage.ENGLISH, (invoiceId) async {
          debugPrint("-----------$invoiceId------------");
          log(invoiceId);
          startPollingPaymentStatus(invoiceId);
        })
        .then((value) => log(value))
        .catchError((error) {
          Flushbar(
            title: "Error",
            message: error.message,
            duration: const Duration(seconds: 3),
          ).show(context);
          log(error.message);
        });
  }

  validate() async {
    await mfCardView.validate().then((value) {
      Flushbar(
        title: "Verification",
        message: "Your $value card is valid",
        duration: const Duration(seconds: 3),
      ).show(context);
      return log('Validate: $value');
    }).catchError(
      (error) => {
        log(error.message),
      },
    );
  }

  Future<void> addInvoiceIntoFirebase(
      MFGetPaymentStatusResponse invoice) async {
    // Reference to the Firestore collection
    final CollectionReference invoices =
        FirebaseFirestore.instance.collection('PaymentSuccess');

    try {
      // Adding a new document with the provided invoiceId
      await invoices.add({
        'InvoiceId': invoice.invoiceId,
        'InvoiceStatus': invoice.invoiceStatus,
        'InvoiceReference': invoice.invoiceReference,
        'CustomerReference': invoice.customerReference,
        'CreatedDate': invoice.createdDate,
        'InvoiceValue': invoice.invoiceValue,
        'Comments': invoice.comments,
        'CustomerName': invoice.customerName,
        'CustomerMobile': invoice.customerMobile,
        'CustomerEmail': invoice.customerEmail,
      });
      print("Invoice added successfully!");
    } catch (e) {
      print("Error adding invoice: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    mfCardView = MFCardPaymentView(cardViewStyle: cardViewStyle());
    mfApplePayButton = MFApplePayButton(applePayStyle: MFApplePayStyle());
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 1,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              embeddedCardView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget embeddedCardView() {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: mfCardView,
        ),
        Row(
          children: [
            Expanded(child: elevatedButton("Pay Now", pay)),
          ],
        )
      ],
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

  Widget paymentMethodsItem(BuildContext ctx, int index) {
    return SizedBox(
      width: 70,
      height: 75,
      child: Container(
        decoration: isSelected[index]
            ? BoxDecoration(
                border: Border.all(color: Color(0xffC48A07), width: 2),
              )
            : const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              if (paymentMethods[index].imageUrl != null)
                Image.network(
                  paymentMethods[index].imageUrl!,
                  height: 35.0,
                ),
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: Checkbox(
                    checkColor: Color(0xffC48A07),
                    activeColor: const Color(0xFFC9C5C5),
                    value: isSelected[index],
                    onChanged: (bool? value) {
                      setState(() {
                        setPaymentMethodSelected(index, value!);
                      });
                    }),
              ),
              Text(
                paymentMethods[index].paymentMethodEn ?? "",
                style: TextStyle(
                  fontSize: 8.0,
                  fontWeight:
                      isSelected[index] ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget btn(String title, Function onPressed) {
    return SizedBox(
      width: double.infinity,
      child: elevatedButton(title, onPressed),
    );
  }

  Widget elevatedButton(String title, Function onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xffC48A07)),
        shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.red, width: 1.0),
              );
            } else {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.white, width: 1.0),
              );
            }
          },
        ),
      ),
      child: (title.isNotEmpty)
          ? Text(title, style: textStyle())
          : const Icon(Icons.refresh),
      onPressed: () async {
        await onPressed();
      },
    );
  }

  TextStyle textStyle() {
    return const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic);
  }
}
