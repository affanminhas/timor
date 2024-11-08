import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellerRatingsRecord extends FirestoreRecord {
  SellerRatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "Seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "buyer" field.
  DocumentReference? _buyer;
  DocumentReference? get buyer => _buyer;
  bool hasBuyer() => _buyer != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _rating = castToType<double>(snapshotData['rating']);
    _seller = snapshotData['Seller'] as DocumentReference?;
    _buyer = snapshotData['buyer'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _date = snapshotData['Date'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SellerRatings');

  static Stream<SellerRatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SellerRatingsRecord.fromSnapshot(s));

  static Future<SellerRatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SellerRatingsRecord.fromSnapshot(s));

  static SellerRatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SellerRatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SellerRatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SellerRatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SellerRatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SellerRatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSellerRatingsRecordData({
  double? rating,
  DocumentReference? seller,
  DocumentReference? buyer,
  String? comment,
  DateTime? date,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'Seller': seller,
      'buyer': buyer,
      'comment': comment,
      'Date': date,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class SellerRatingsRecordDocumentEquality
    implements Equality<SellerRatingsRecord> {
  const SellerRatingsRecordDocumentEquality();

  @override
  bool equals(SellerRatingsRecord? e1, SellerRatingsRecord? e2) {
    return e1?.rating == e2?.rating &&
        e1?.seller == e2?.seller &&
        e1?.buyer == e2?.buyer &&
        e1?.comment == e2?.comment &&
        e1?.date == e2?.date &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(SellerRatingsRecord? e) => const ListEquality()
      .hash([e?.rating, e?.seller, e?.buyer, e?.comment, e?.date, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is SellerRatingsRecord;
}
