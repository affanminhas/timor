import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _cart = (await secureStorage.getStringList('ff_cart'))
              ?.map((x) {
                try {
                  return CartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cart;
    });
    await _safeInitAsync(() async {
      _myfavorite = (await secureStorage.getStringList('ff_myfavorite'))
              ?.map((path) => path.ref)
              .toList() ??
          _myfavorite;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<CartStruct> _cart = [];
  List<CartStruct> get cart => _cart;
  set cart(List<CartStruct> value) {
    _cart = value;
    secureStorage.setStringList(
        'ff_cart', value.map((x) => x.serialize()).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(CartStruct value) {
    cart.add(value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeFromCart(CartStruct value) {
    cart.remove(value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void updateCartAtIndex(
    int index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCart(int index, CartStruct value) {
    cart.insert(index, value);
    secureStorage.setStringList(
        'ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  List<DocumentReference> _myfavorite = [];
  List<DocumentReference> get myfavorite => _myfavorite;
  set myfavorite(List<DocumentReference> value) {
    _myfavorite = value;
    secureStorage.setStringList(
        'ff_myfavorite', value.map((x) => x.path).toList());
  }

  void deleteMyfavorite() {
    secureStorage.delete(key: 'ff_myfavorite');
  }

  void addToMyfavorite(DocumentReference value) {
    myfavorite.add(value);
    secureStorage.setStringList(
        'ff_myfavorite', _myfavorite.map((x) => x.path).toList());
  }

  void removeFromMyfavorite(DocumentReference value) {
    myfavorite.remove(value);
    secureStorage.setStringList(
        'ff_myfavorite', _myfavorite.map((x) => x.path).toList());
  }

  void removeAtIndexFromMyfavorite(int index) {
    myfavorite.removeAt(index);
    secureStorage.setStringList(
        'ff_myfavorite', _myfavorite.map((x) => x.path).toList());
  }

  void updateMyfavoriteAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    myfavorite[index] = updateFn(_myfavorite[index]);
    secureStorage.setStringList(
        'ff_myfavorite', _myfavorite.map((x) => x.path).toList());
  }

  void insertAtIndexInMyfavorite(int index, DocumentReference value) {
    myfavorite.insert(index, value);
    secureStorage.setStringList(
        'ff_myfavorite', _myfavorite.map((x) => x.path).toList());
  }

  String _invoiceRef = '';
  String get invoiceRef => _invoiceRef;
  set invoiceRef(String value) {
    _invoiceRef = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
