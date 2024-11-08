import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SellerRecord extends FirestoreRecord {
  SellerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "Store_Name" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "First_Owner_Name" field.
  String? _firstOwnerName;
  String get firstOwnerName => _firstOwnerName ?? '';
  bool hasFirstOwnerName() => _firstOwnerName != null;

  // "Sec_Owner_Name" field.
  String? _secOwnerName;
  String get secOwnerName => _secOwnerName ?? '';
  bool hasSecOwnerName() => _secOwnerName != null;

  // "Id_Number" field.
  int? _idNumber;
  int get idNumber => _idNumber ?? 0;
  bool hasIdNumber() => _idNumber != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "Neighborhood" field.
  String? _neighborhood;
  String get neighborhood => _neighborhood ?? '';
  bool hasNeighborhood() => _neighborhood != null;

  // "ID_photo" field.
  String? _iDPhoto;
  String get iDPhoto => _iDPhoto ?? '';
  bool hasIDPhoto() => _iDPhoto != null;

  // "Commercial_register_photo" field.
  String? _commercialRegisterPhoto;
  String get commercialRegisterPhoto => _commercialRegisterPhoto ?? '';
  bool hasCommercialRegisterPhoto() => _commercialRegisterPhoto != null;

  // "Modification_date" field.
  DateTime? _modificationDate;
  DateTime? get modificationDate => _modificationDate;
  bool hasModificationDate() => _modificationDate != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "Admin_notes" field.
  String? _adminNotes;
  String get adminNotes => _adminNotes ?? '';
  bool hasAdminNotes() => _adminNotes != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _storeName = snapshotData['Store_Name'] as String?;
    _firstOwnerName = snapshotData['First_Owner_Name'] as String?;
    _secOwnerName = snapshotData['Sec_Owner_Name'] as String?;
    _idNumber = castToType<int>(snapshotData['Id_Number']);
    _birthDate = snapshotData['birth_date'] as DateTime?;
    _email = snapshotData['Email'] as String?;
    _city = snapshotData['City'] as String?;
    _neighborhood = snapshotData['Neighborhood'] as String?;
    _iDPhoto = snapshotData['ID_photo'] as String?;
    _commercialRegisterPhoto =
        snapshotData['Commercial_register_photo'] as String?;
    _modificationDate = snapshotData['Modification_date'] as DateTime?;
    _status = snapshotData['Status'] as String?;
    _adminNotes = snapshotData['Admin_notes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Seller');

  static Stream<SellerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SellerRecord.fromSnapshot(s));

  static Future<SellerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SellerRecord.fromSnapshot(s));

  static SellerRecord fromSnapshot(DocumentSnapshot snapshot) => SellerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SellerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SellerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SellerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SellerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSellerRecordData({
  String? uid,
  String? phoneNumber,
  String? photoUrl,
  DocumentReference? user,
  String? storeName,
  String? firstOwnerName,
  String? secOwnerName,
  int? idNumber,
  DateTime? birthDate,
  String? email,
  String? city,
  String? neighborhood,
  String? iDPhoto,
  String? commercialRegisterPhoto,
  DateTime? modificationDate,
  String? status,
  String? adminNotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'user': user,
      'Store_Name': storeName,
      'First_Owner_Name': firstOwnerName,
      'Sec_Owner_Name': secOwnerName,
      'Id_Number': idNumber,
      'birth_date': birthDate,
      'Email': email,
      'City': city,
      'Neighborhood': neighborhood,
      'ID_photo': iDPhoto,
      'Commercial_register_photo': commercialRegisterPhoto,
      'Modification_date': modificationDate,
      'Status': status,
      'Admin_notes': adminNotes,
    }.withoutNulls,
  );

  return firestoreData;
}

class SellerRecordDocumentEquality implements Equality<SellerRecord> {
  const SellerRecordDocumentEquality();

  @override
  bool equals(SellerRecord? e1, SellerRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.user == e2?.user &&
        e1?.storeName == e2?.storeName &&
        e1?.firstOwnerName == e2?.firstOwnerName &&
        e1?.secOwnerName == e2?.secOwnerName &&
        e1?.idNumber == e2?.idNumber &&
        e1?.birthDate == e2?.birthDate &&
        e1?.email == e2?.email &&
        e1?.city == e2?.city &&
        e1?.neighborhood == e2?.neighborhood &&
        e1?.iDPhoto == e2?.iDPhoto &&
        e1?.commercialRegisterPhoto == e2?.commercialRegisterPhoto &&
        e1?.modificationDate == e2?.modificationDate &&
        e1?.status == e2?.status &&
        e1?.adminNotes == e2?.adminNotes;
  }

  @override
  int hash(SellerRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.phoneNumber,
        e?.photoUrl,
        e?.user,
        e?.storeName,
        e?.firstOwnerName,
        e?.secOwnerName,
        e?.idNumber,
        e?.birthDate,
        e?.email,
        e?.city,
        e?.neighborhood,
        e?.iDPhoto,
        e?.commercialRegisterPhoto,
        e?.modificationDate,
        e?.status,
        e?.adminNotes
      ]);

  @override
  bool isValidKey(Object? o) => o is SellerRecord;
}
