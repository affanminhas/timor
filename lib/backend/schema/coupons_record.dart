import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponsRecord extends FirestoreRecord {
  CouponsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "amout" field.
  double? _amout;
  double get amout => _amout ?? 0.0;
  bool hasAmout() => _amout != null;

  // "promo_code" field.
  String? _promoCode;
  String get promoCode => _promoCode ?? '';
  bool hasPromoCode() => _promoCode != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "aktive" field.
  bool? _aktive;
  bool get aktive => _aktive ?? false;
  bool hasAktive() => _aktive != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _amout = castToType<double>(snapshotData['amout']);
    _promoCode = snapshotData['promo_code'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _aktive = snapshotData['aktive'] as bool?;
    _status = snapshotData['status'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coupons');

  static Stream<CouponsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CouponsRecord.fromSnapshot(s));

  static Future<CouponsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CouponsRecord.fromSnapshot(s));

  static CouponsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CouponsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CouponsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CouponsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CouponsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CouponsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCouponsRecordData({
  int? id,
  DateTime? createdDate,
  double? amout,
  String? promoCode,
  DocumentReference? user,
  bool? aktive,
  String? status,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'created_date': createdDate,
      'amout': amout,
      'promo_code': promoCode,
      'user': user,
      'aktive': aktive,
      'status': status,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class CouponsRecordDocumentEquality implements Equality<CouponsRecord> {
  const CouponsRecordDocumentEquality();

  @override
  bool equals(CouponsRecord? e1, CouponsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.createdDate == e2?.createdDate &&
        e1?.amout == e2?.amout &&
        e1?.promoCode == e2?.promoCode &&
        e1?.user == e2?.user &&
        e1?.aktive == e2?.aktive &&
        e1?.status == e2?.status &&
        e1?.name == e2?.name;
  }

  @override
  int hash(CouponsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdDate,
        e?.amout,
        e?.promoCode,
        e?.user,
        e?.aktive,
        e?.status,
        e?.name
      ]);

  @override
  bool isValidKey(Object? o) => o is CouponsRecord;
}
