import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_fatoorah_payment_model.dart';
export 'my_fatoorah_payment_model.dart';

class MyFatoorahPaymentWidget extends StatefulWidget {
  const MyFatoorahPaymentWidget({
    super.key,
    double? price,
    required this.itemName,
    required this.cardType,
    required this.translationid,
    required this.last4Number,
    required this.invoiceid,
    required this.invoicestatus,
    required this.invoicereference,
    required this.customerreference,
    required this.comments,
    required this.customername,
    required this.customermobile,
    required this.customeremail,
    required this.userRef,
  }) : this.price = price ?? 0.00;

  final double price;
  final String? itemName;
  final String? cardType;
  final String? translationid;
  final String? last4Number;
  final String? invoiceid;
  final String? invoicestatus;
  final String? invoicereference;
  final String? customerreference;
  final String? comments;
  final String? customername;
  final String? customermobile;
  final String? customeremail;
  final DocumentReference? userRef;

  @override
  State<MyFatoorahPaymentWidget> createState() =>
      _MyFatoorahPaymentWidgetState();
}

class _MyFatoorahPaymentWidgetState extends State<MyFatoorahPaymentWidget> {
  late MyFatoorahPaymentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyFatoorahPaymentModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.MyFatoorahPayment(
                    width: double.infinity,
                    height: double.infinity,
                    price: widget!.price,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
