import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationsRecord extends FirestoreRecord {
  LocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  bool hasPostcode() => _postcode != null;

  // "customer_number" field.
  String? _customerNumber;
  String get customerNumber => _customerNumber ?? '';
  bool hasCustomerNumber() => _customerNumber != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "apartment_info" field.
  String? _apartmentInfo;
  String get apartmentInfo => _apartmentInfo ?? '';
  bool hasApartmentInfo() => _apartmentInfo != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "place_type_name" field.
  String? _placeTypeName;
  String get placeTypeName => _placeTypeName ?? '';
  bool hasPlaceTypeName() => _placeTypeName != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  void _initializeFields() {
    _location = snapshotData['location'] as LatLng?;
    _user = snapshotData['user'] as DocumentReference?;
    _city = snapshotData['city'] as String?;
    _address = snapshotData['address'] as String?;
    _postcode = snapshotData['postcode'] as String?;
    _customerNumber = snapshotData['customer_number'] as String?;
    _customerName = snapshotData['customer_name'] as String?;
    _country = snapshotData['country'] as String?;
    _apartmentInfo = snapshotData['apartment_info'] as String?;
    _region = snapshotData['region'] as String?;
    _placeTypeName = snapshotData['place_type_name'] as String?;
    _street = snapshotData['street'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locations');

  static Stream<LocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocationsRecord.fromSnapshot(s));

  static Future<LocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocationsRecord.fromSnapshot(s));

  static LocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocationsRecordData({
  LatLng? location,
  DocumentReference? user,
  String? city,
  String? address,
  String? postcode,
  String? customerNumber,
  String? customerName,
  String? country,
  String? apartmentInfo,
  String? region,
  String? placeTypeName,
  String? street,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'user': user,
      'city': city,
      'address': address,
      'postcode': postcode,
      'customer_number': customerNumber,
      'customer_name': customerName,
      'country': country,
      'apartment_info': apartmentInfo,
      'region': region,
      'place_type_name': placeTypeName,
      'street': street,
    }.withoutNulls,
  );

  return firestoreData;
}

class LocationsRecordDocumentEquality implements Equality<LocationsRecord> {
  const LocationsRecordDocumentEquality();

  @override
  bool equals(LocationsRecord? e1, LocationsRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.user == e2?.user &&
        e1?.city == e2?.city &&
        e1?.address == e2?.address &&
        e1?.postcode == e2?.postcode &&
        e1?.customerNumber == e2?.customerNumber &&
        e1?.customerName == e2?.customerName &&
        e1?.country == e2?.country &&
        e1?.apartmentInfo == e2?.apartmentInfo &&
        e1?.region == e2?.region &&
        e1?.placeTypeName == e2?.placeTypeName &&
        e1?.street == e2?.street;
  }

  @override
  int hash(LocationsRecord? e) => const ListEquality().hash([
        e?.location,
        e?.user,
        e?.city,
        e?.address,
        e?.postcode,
        e?.customerNumber,
        e?.customerName,
        e?.country,
        e?.apartmentInfo,
        e?.region,
        e?.placeTypeName,
        e?.street
      ]);

  @override
  bool isValidKey(Object? o) => o is LocationsRecord;
}
