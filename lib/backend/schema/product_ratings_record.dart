import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRatingsRecord extends FirestoreRecord {
  ProductRatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "buyer" field.
  DocumentReference? _buyer;
  DocumentReference? get buyer => _buyer;
  bool hasBuyer() => _buyer != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  void _initializeFields() {
    _rating = castToType<double>(snapshotData['rating']);
    _seller = snapshotData['seller'] as DocumentReference?;
    _buyer = snapshotData['buyer'] as DocumentReference?;
    _date = snapshotData['Date'] as DateTime?;
    _comment = snapshotData['comment'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProductRatings');

  static Stream<ProductRatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRatingsRecord.fromSnapshot(s));

  static Future<ProductRatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRatingsRecord.fromSnapshot(s));

  static ProductRatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRatingsRecordData({
  double? rating,
  DocumentReference? seller,
  DocumentReference? buyer,
  DateTime? date,
  String? comment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'seller': seller,
      'buyer': buyer,
      'Date': date,
      'comment': comment,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRatingsRecordDocumentEquality
    implements Equality<ProductRatingsRecord> {
  const ProductRatingsRecordDocumentEquality();

  @override
  bool equals(ProductRatingsRecord? e1, ProductRatingsRecord? e2) {
    return e1?.rating == e2?.rating &&
        e1?.seller == e2?.seller &&
        e1?.buyer == e2?.buyer &&
        e1?.date == e2?.date &&
        e1?.comment == e2?.comment;
  }

  @override
  int hash(ProductRatingsRecord? e) => const ListEquality()
      .hash([e?.rating, e?.seller, e?.buyer, e?.date, e?.comment]);

  @override
  bool isValidKey(Object? o) => o is ProductRatingsRecord;
}
