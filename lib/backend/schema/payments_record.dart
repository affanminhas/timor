import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "paymentMethodType" field.
  String? _paymentMethodType;
  String get paymentMethodType => _paymentMethodType ?? '';
  bool hasPaymentMethodType() => _paymentMethodType != null;

  // "cardLast4" field.
  String? _cardLast4;
  String get cardLast4 => _cardLast4 ?? '';
  bool hasCardLast4() => _cardLast4 != null;

  // "cardType" field.
  String? _cardType;
  String get cardType => _cardType ?? '';
  bool hasCardType() => _cardType != null;

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  // "purchaseTime" field.
  DateTime? _purchaseTime;
  DateTime? get purchaseTime => _purchaseTime;
  bool hasPurchaseTime() => _purchaseTime != null;

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  bool hasProduct() => _product != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _amount = castToType<double>(snapshotData['amount']);
    _currency = snapshotData['currency'] as String?;
    _paymentMethodType = snapshotData['paymentMethodType'] as String?;
    _cardLast4 = snapshotData['cardLast4'] as String?;
    _cardType = snapshotData['cardType'] as String?;
    _transactionId = snapshotData['transactionId'] as String?;
    _purchaseTime = snapshotData['purchaseTime'] as DateTime?;
    _seller = snapshotData['seller'] as DocumentReference?;
    _product = snapshotData['product'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  double? amount,
  String? currency,
  String? paymentMethodType,
  String? cardLast4,
  String? cardType,
  String? transactionId,
  DateTime? purchaseTime,
  DocumentReference? seller,
  DocumentReference? product,
  DateTime? createdTime,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'currency': currency,
      'paymentMethodType': paymentMethodType,
      'cardLast4': cardLast4,
      'cardType': cardType,
      'transactionId': transactionId,
      'purchaseTime': purchaseTime,
      'seller': seller,
      'product': product,
      'createdTime': createdTime,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.currency == e2?.currency &&
        e1?.paymentMethodType == e2?.paymentMethodType &&
        e1?.cardLast4 == e2?.cardLast4 &&
        e1?.cardType == e2?.cardType &&
        e1?.transactionId == e2?.transactionId &&
        e1?.purchaseTime == e2?.purchaseTime &&
        e1?.seller == e2?.seller &&
        e1?.product == e2?.product &&
        e1?.createdTime == e2?.createdTime &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.currency,
        e?.paymentMethodType,
        e?.cardLast4,
        e?.cardType,
        e?.transactionId,
        e?.purchaseTime,
        e?.seller,
        e?.product,
        e?.createdTime,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
