import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'count_model.dart';
export 'count_model.dart';

class CountWidget extends StatefulWidget {
  const CountWidget({
    super.key,
    this.cartproduct,
    this.itemindex,
  });

  final CartStruct? cartproduct;
  final int? itemindex;

  @override
  State<CountWidget> createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  late CountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.0,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: FlutterFlowCountController(
        decrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.minus,
          color: enabled
              ? FlutterFlowTheme.of(context).secondaryText
              : FlutterFlowTheme.of(context).tertiary,
          size: 12.0,
        ),
        incrementIconBuilder: (enabled) => FaIcon(
          FontAwesomeIcons.plus,
          color: enabled
              ? FlutterFlowTheme.of(context).secondaryText
              : FlutterFlowTheme.of(context).tertiary,
          size: 12.0,
        ),
        countBuilder: (count) => Text(
          count.toString(),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Rubik',
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: false,
              ),
        ),
        count: _model.countControllerValue ??= widget!.cartproduct!.count,
        updateCount: (count) async {
          safeSetState(() => _model.countControllerValue = count);
          FFAppState().updateCartAtIndex(
            widget!.itemindex!,
            (e) => e..incrementCount(1),
          );
          FFAppState().update(() {});
          FFAppState().updateCartAtIndex(
            widget!.itemindex!,
            (e) => e
              ..price = valueOrDefault<double>(
                widget!.cartproduct!.piecePrice *
                    (_model.countControllerValue!),
                99999.0,
              ),
          );
          FFAppState().update(() {});
        },
        stepSize: 1,
        minimum: 1,
        maximum: 999,
        contentPadding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
      ),
    );
  }
}
