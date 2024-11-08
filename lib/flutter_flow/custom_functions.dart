import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? total(double price) {
  // 2% increase in the price
  double increase = 2.0; // نسبة الزيادة
  return price + (price * increase / 100);
}

double? fee(double price) {
  // I want a 2% from the price
  double increase = 2.0;
  return price * increase / 100;
}

DateTime? datefromapi(String? stringdate) {
  // 2024-07-14T08:07:20Z to data time
  if (stringdate == null) return null;
  try {
    return DateTime.parse(stringdate);
  } catch (e) {
    return null;
  }
}

double? remainingamount(
  double? goal,
  double? amountprefilled,
) {
  // Amount Minus Amount Return with the result
  if (goal == null || amountprefilled == null) {
    return null;
  }
  return math.max(0, goal - amountprefilled);
}
