import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentSuccessRecord extends FirestoreRecord {
  PaymentSuccessRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "InvoiceId" field.
  int? _invoiceId;
  int get invoiceId => _invoiceId ?? 0;
  bool hasInvoiceId() => _invoiceId != null;

  // "InvoiceStatus" field.
  String? _invoiceStatus;
  String get invoiceStatus => _invoiceStatus ?? '';
  bool hasInvoiceStatus() => _invoiceStatus != null;

  // "InvoiceReference" field.
  String? _invoiceReference;
  String get invoiceReference => _invoiceReference ?? '';
  bool hasInvoiceReference() => _invoiceReference != null;

  // "CustomerReference" field.
  String? _customerReference;
  String get customerReference => _customerReference ?? '';
  bool hasCustomerReference() => _customerReference != null;

  // "InvoiceValue" field.
  double? _invoiceValue;
  double get invoiceValue => _invoiceValue ?? 0.0;
  bool hasInvoiceValue() => _invoiceValue != null;

  // "Comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "CustomerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "CustomerMobile" field.
  String? _customerMobile;
  String get customerMobile => _customerMobile ?? '';
  bool hasCustomerMobile() => _customerMobile != null;

  // "CustomerEmail" field.
  String? _customerEmail;
  String get customerEmail => _customerEmail ?? '';
  bool hasCustomerEmail() => _customerEmail != null;

  // "CreatedDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _invoiceId = castToType<int>(snapshotData['InvoiceId']);
    _invoiceStatus = snapshotData['InvoiceStatus'] as String?;
    _invoiceReference = snapshotData['InvoiceReference'] as String?;
    _customerReference = snapshotData['CustomerReference'] as String?;
    _invoiceValue = castToType<double>(snapshotData['InvoiceValue']);
    _comments = snapshotData['Comments'] as String?;
    _customerName = snapshotData['CustomerName'] as String?;
    _customerMobile = snapshotData['CustomerMobile'] as String?;
    _customerEmail = snapshotData['CustomerEmail'] as String?;
    _createdDate = snapshotData['CreatedDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PaymentSuccess');

  static Stream<PaymentSuccessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentSuccessRecord.fromSnapshot(s));

  static Future<PaymentSuccessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentSuccessRecord.fromSnapshot(s));

  static PaymentSuccessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentSuccessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentSuccessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentSuccessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentSuccessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentSuccessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentSuccessRecordData({
  int? invoiceId,
  String? invoiceStatus,
  String? invoiceReference,
  String? customerReference,
  double? invoiceValue,
  String? comments,
  String? customerName,
  String? customerMobile,
  String? customerEmail,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'InvoiceId': invoiceId,
      'InvoiceStatus': invoiceStatus,
      'InvoiceReference': invoiceReference,
      'CustomerReference': customerReference,
      'InvoiceValue': invoiceValue,
      'Comments': comments,
      'CustomerName': customerName,
      'CustomerMobile': customerMobile,
      'CustomerEmail': customerEmail,
      'CreatedDate': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentSuccessRecordDocumentEquality
    implements Equality<PaymentSuccessRecord> {
  const PaymentSuccessRecordDocumentEquality();

  @override
  bool equals(PaymentSuccessRecord? e1, PaymentSuccessRecord? e2) {
    return e1?.invoiceId == e2?.invoiceId &&
        e1?.invoiceStatus == e2?.invoiceStatus &&
        e1?.invoiceReference == e2?.invoiceReference &&
        e1?.customerReference == e2?.customerReference &&
        e1?.invoiceValue == e2?.invoiceValue &&
        e1?.comments == e2?.comments &&
        e1?.customerName == e2?.customerName &&
        e1?.customerMobile == e2?.customerMobile &&
        e1?.customerEmail == e2?.customerEmail &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(PaymentSuccessRecord? e) => const ListEquality().hash([
        e?.invoiceId,
        e?.invoiceStatus,
        e?.invoiceReference,
        e?.customerReference,
        e?.invoiceValue,
        e?.comments,
        e?.customerName,
        e?.customerMobile,
        e?.customerEmail,
        e?.createdDate
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentSuccessRecord;
}
