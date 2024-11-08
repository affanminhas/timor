import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Quality" field.
  String? _quality;
  String get quality => _quality ?? '';
  bool hasQuality() => _quality != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "DateModification" field.
  DateTime? _dateModification;
  DateTime? get dateModification => _dateModification;
  bool hasDateModification() => _dateModification != null;

  // "ProductRating" field.
  DocumentReference? _productRating;
  DocumentReference? get productRating => _productRating;
  bool hasProductRating() => _productRating != null;

  // "SellerRating" field.
  DocumentReference? _sellerRating;
  DocumentReference? get sellerRating => _sellerRating;
  bool hasSellerRating() => _sellerRating != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "Admin_Notes" field.
  String? _adminNotes;
  String get adminNotes => _adminNotes ?? '';
  bool hasAdminNotes() => _adminNotes != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _type = snapshotData['type'] as String?;
    _quality = snapshotData['Quality'] as String?;
    _description = snapshotData['description'] as String?;
    _images = getDataList(snapshotData['images']);
    _date = snapshotData['Date'] as DateTime?;
    _dateModification = snapshotData['DateModification'] as DateTime?;
    _productRating = snapshotData['ProductRating'] as DocumentReference?;
    _sellerRating = snapshotData['SellerRating'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _adminNotes = snapshotData['Admin_Notes'] as String?;
    _status = snapshotData['status'] as String?;
    _seller = snapshotData['seller'] as DocumentReference?;
    _count = castToType<int>(snapshotData['count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? name,
  double? price,
  String? image,
  String? type,
  String? quality,
  String? description,
  DateTime? date,
  DateTime? dateModification,
  DocumentReference? productRating,
  DocumentReference? sellerRating,
  String? uid,
  String? adminNotes,
  String? status,
  DocumentReference? seller,
  int? count,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'image': image,
      'type': type,
      'Quality': quality,
      'description': description,
      'Date': date,
      'DateModification': dateModification,
      'ProductRating': productRating,
      'SellerRating': sellerRating,
      'uid': uid,
      'Admin_Notes': adminNotes,
      'status': status,
      'seller': seller,
      'count': count,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.type == e2?.type &&
        e1?.quality == e2?.quality &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.date == e2?.date &&
        e1?.dateModification == e2?.dateModification &&
        e1?.productRating == e2?.productRating &&
        e1?.sellerRating == e2?.sellerRating &&
        e1?.uid == e2?.uid &&
        e1?.adminNotes == e2?.adminNotes &&
        e1?.status == e2?.status &&
        e1?.seller == e2?.seller &&
        e1?.count == e2?.count;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.name,
        e?.price,
        e?.image,
        e?.type,
        e?.quality,
        e?.description,
        e?.images,
        e?.date,
        e?.dateModification,
        e?.productRating,
        e?.sellerRating,
        e?.uid,
        e?.adminNotes,
        e?.status,
        e?.seller,
        e?.count
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
