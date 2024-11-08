import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "status_view" field.
  bool? _statusView;
  bool get statusView => _statusView ?? false;
  bool hasStatusView() => _statusView != null;

  // "status_send" field.
  bool? _statusSend;
  bool get statusSend => _statusSend ?? false;
  bool hasStatusSend() => _statusSend != null;

  // "status_delivered" field.
  bool? _statusDelivered;
  bool get statusDelivered => _statusDelivered ?? false;
  bool hasStatusDelivered() => _statusDelivered != null;

  // "total_sum" field.
  double? _totalSum;
  double get totalSum => _totalSum ?? 0.0;
  bool hasTotalSum() => _totalSum != null;

  // "real_sum" field.
  double? _realSum;
  double get realSum => _realSum ?? 0.0;
  bool hasRealSum() => _realSum != null;

  // "delivered_commission" field.
  double? _deliveredCommission;
  double get deliveredCommission => _deliveredCommission ?? 0.0;
  bool hasDeliveredCommission() => _deliveredCommission != null;

  // "coupun_sum" field.
  double? _coupunSum;
  double get coupunSum => _coupunSum ?? 0.0;
  bool hasCoupunSum() => _coupunSum != null;

  // "payincard" field.
  bool? _payincard;
  bool get payincard => _payincard ?? false;
  bool hasPayincard() => _payincard != null;

  // "payincash" field.
  bool? _payincash;
  bool get payincash => _payincash ?? false;
  bool hasPayincash() => _payincash != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

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

  // "apartment_info" field.
  String? _apartmentInfo;
  String get apartmentInfo => _apartmentInfo ?? '';
  bool hasApartmentInfo() => _apartmentInfo != null;

  // "customer_name" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "customer_number" field.
  String? _customerNumber;
  String get customerNumber => _customerNumber ?? '';
  bool hasCustomerNumber() => _customerNumber != null;

  // "location_lat_lng" field.
  LatLng? _locationLatLng;
  LatLng? get locationLatLng => _locationLatLng;
  bool hasLocationLatLng() => _locationLatLng != null;

  // "cancelled" field.
  bool? _cancelled;
  bool get cancelled => _cancelled ?? false;
  bool hasCancelled() => _cancelled != null;

  // "items" field.
  List<DocumentReference>? _items;
  List<DocumentReference> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "cart" field.
  CartStruct? _cart;
  CartStruct get cart => _cart ?? CartStruct();
  bool hasCart() => _cart != null;

  // "payment" field.
  DocumentReference? _payment;
  DocumentReference? get payment => _payment;
  bool hasPayment() => _payment != null;

  // "seller" field.
  String? _seller;
  String get seller => _seller ?? '';
  bool hasSeller() => _seller != null;

  // "buyer" field.
  String? _buyer;
  String get buyer => _buyer ?? '';
  bool hasBuyer() => _buyer != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _statusView = snapshotData['status_view'] as bool?;
    _statusSend = snapshotData['status_send'] as bool?;
    _statusDelivered = snapshotData['status_delivered'] as bool?;
    _totalSum = castToType<double>(snapshotData['total_sum']);
    _realSum = castToType<double>(snapshotData['real_sum']);
    _deliveredCommission =
        castToType<double>(snapshotData['delivered_commission']);
    _coupunSum = castToType<double>(snapshotData['coupun_sum']);
    _payincard = snapshotData['payincard'] as bool?;
    _payincash = snapshotData['payincash'] as bool?;
    _active = snapshotData['active'] as bool?;
    _paid = snapshotData['paid'] as bool?;
    _userEmail = snapshotData['user_email'] as String?;
    _country = snapshotData['country'] as String?;
    _region = snapshotData['region'] as String?;
    _city = snapshotData['city'] as String?;
    _address = snapshotData['address'] as String?;
    _postcode = snapshotData['postcode'] as String?;
    _apartmentInfo = snapshotData['apartment_info'] as String?;
    _customerName = snapshotData['customer_name'] as String?;
    _customerNumber = snapshotData['customer_number'] as String?;
    _locationLatLng = snapshotData['location_lat_lng'] as LatLng?;
    _cancelled = snapshotData['cancelled'] as bool?;
    _items = getDataList(snapshotData['items']);
    _cart = CartStruct.maybeFromMap(snapshotData['cart']);
    _payment = snapshotData['payment'] as DocumentReference?;
    _seller = snapshotData['seller'] as String?;
    _buyer = snapshotData['buyer'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  int? id,
  DateTime? createdDate,
  String? status,
  bool? statusView,
  bool? statusSend,
  bool? statusDelivered,
  double? totalSum,
  double? realSum,
  double? deliveredCommission,
  double? coupunSum,
  bool? payincard,
  bool? payincash,
  bool? active,
  bool? paid,
  String? userEmail,
  String? country,
  String? region,
  String? city,
  String? address,
  String? postcode,
  String? apartmentInfo,
  String? customerName,
  String? customerNumber,
  LatLng? locationLatLng,
  bool? cancelled,
  CartStruct? cart,
  DocumentReference? payment,
  String? seller,
  String? buyer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'created_date': createdDate,
      'status': status,
      'status_view': statusView,
      'status_send': statusSend,
      'status_delivered': statusDelivered,
      'total_sum': totalSum,
      'real_sum': realSum,
      'delivered_commission': deliveredCommission,
      'coupun_sum': coupunSum,
      'payincard': payincard,
      'payincash': payincash,
      'active': active,
      'paid': paid,
      'user_email': userEmail,
      'country': country,
      'region': region,
      'city': city,
      'address': address,
      'postcode': postcode,
      'apartment_info': apartmentInfo,
      'customer_name': customerName,
      'customer_number': customerNumber,
      'location_lat_lng': locationLatLng,
      'cancelled': cancelled,
      'cart': CartStruct().toMap(),
      'payment': payment,
      'seller': seller,
      'buyer': buyer,
    }.withoutNulls,
  );

  // Handle nested data for "cart" field.
  addCartStructData(firestoreData, cart, 'cart');

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.createdDate == e2?.createdDate &&
        e1?.status == e2?.status &&
        e1?.statusView == e2?.statusView &&
        e1?.statusSend == e2?.statusSend &&
        e1?.statusDelivered == e2?.statusDelivered &&
        e1?.totalSum == e2?.totalSum &&
        e1?.realSum == e2?.realSum &&
        e1?.deliveredCommission == e2?.deliveredCommission &&
        e1?.coupunSum == e2?.coupunSum &&
        e1?.payincard == e2?.payincard &&
        e1?.payincash == e2?.payincash &&
        e1?.active == e2?.active &&
        e1?.paid == e2?.paid &&
        e1?.userEmail == e2?.userEmail &&
        e1?.country == e2?.country &&
        e1?.region == e2?.region &&
        e1?.city == e2?.city &&
        e1?.address == e2?.address &&
        e1?.postcode == e2?.postcode &&
        e1?.apartmentInfo == e2?.apartmentInfo &&
        e1?.customerName == e2?.customerName &&
        e1?.customerNumber == e2?.customerNumber &&
        e1?.locationLatLng == e2?.locationLatLng &&
        e1?.cancelled == e2?.cancelled &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.cart == e2?.cart &&
        e1?.payment == e2?.payment &&
        e1?.seller == e2?.seller &&
        e1?.buyer == e2?.buyer;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdDate,
        e?.status,
        e?.statusView,
        e?.statusSend,
        e?.statusDelivered,
        e?.totalSum,
        e?.realSum,
        e?.deliveredCommission,
        e?.coupunSum,
        e?.payincard,
        e?.payincash,
        e?.active,
        e?.paid,
        e?.userEmail,
        e?.country,
        e?.region,
        e?.city,
        e?.address,
        e?.postcode,
        e?.apartmentInfo,
        e?.customerName,
        e?.customerNumber,
        e?.locationLatLng,
        e?.cancelled,
        e?.items,
        e?.cart,
        e?.payment,
        e?.seller,
        e?.buyer
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
