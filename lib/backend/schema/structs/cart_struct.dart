// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartStruct extends FFFirebaseStruct {
  CartStruct({
    String? productName,
    double? price,
    int? count,
    String? image,
    DocumentReference? product,
    String? quality,
    double? piecePrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productName = productName,
        _price = price,
        _count = count,
        _image = image,
        _product = product,
        _quality = quality,
        _piecePrice = piecePrice,
        super(firestoreUtilData);

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;

  bool hasProductName() => _productName != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "product" field.
  DocumentReference? _product;
  DocumentReference? get product => _product;
  set product(DocumentReference? val) => _product = val;

  bool hasProduct() => _product != null;

  // "Quality" field.
  String? _quality;
  String get quality => _quality ?? '';
  set quality(String? val) => _quality = val;

  bool hasQuality() => _quality != null;

  // "piece_price" field.
  double? _piecePrice;
  double get piecePrice => _piecePrice ?? 0.0;
  set piecePrice(double? val) => _piecePrice = val;

  void incrementPiecePrice(double amount) => piecePrice = piecePrice + amount;

  bool hasPiecePrice() => _piecePrice != null;

  static CartStruct fromMap(Map<String, dynamic> data) => CartStruct(
        productName: data['product_name'] as String?,
        price: castToType<double>(data['price']),
        count: castToType<int>(data['count']),
        image: data['image'] as String?,
        product: data['product'] as DocumentReference?,
        quality: data['Quality'] as String?,
        piecePrice: castToType<double>(data['piece_price']),
      );

  static CartStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'product_name': _productName,
        'price': _price,
        'count': _count,
        'image': _image,
        'product': _product,
        'Quality': _quality,
        'piece_price': _piecePrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_name': serializeParam(
          _productName,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'product': serializeParam(
          _product,
          ParamType.DocumentReference,
        ),
        'Quality': serializeParam(
          _quality,
          ParamType.String,
        ),
        'piece_price': serializeParam(
          _piecePrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static CartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartStruct(
        productName: deserializeParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        product: deserializeParam(
          data['product'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Product'],
        ),
        quality: deserializeParam(
          data['Quality'],
          ParamType.String,
          false,
        ),
        piecePrice: deserializeParam(
          data['piece_price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartStruct &&
        productName == other.productName &&
        price == other.price &&
        count == other.count &&
        image == other.image &&
        product == other.product &&
        quality == other.quality &&
        piecePrice == other.piecePrice;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([productName, price, count, image, product, quality, piecePrice]);
}

CartStruct createCartStruct({
  String? productName,
  double? price,
  int? count,
  String? image,
  DocumentReference? product,
  String? quality,
  double? piecePrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartStruct(
      productName: productName,
      price: price,
      count: count,
      image: image,
      product: product,
      quality: quality,
      piecePrice: piecePrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartStruct? updateCartStruct(
  CartStruct? cart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartStructData(
  Map<String, dynamic> firestoreData,
  CartStruct? cart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cart == null) {
    return;
  }
  if (cart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && cart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartData = getCartFirestoreData(cart, forFieldValue);
  final nestedData = cartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartFirestoreData(
  CartStruct? cart, [
  bool forFieldValue = false,
]) {
  if (cart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cart.toMap());

  // Add any Firestore field values
  cart.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartListFirestoreData(
  List<CartStruct>? carts,
) =>
    carts?.map((e) => getCartFirestoreData(e, true)).toList() ?? [];
