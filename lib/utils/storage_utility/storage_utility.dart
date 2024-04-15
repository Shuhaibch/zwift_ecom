import 'package:get_storage/get_storage.dart';

class CLocalStorage {
  late final GetStorage _storage;

  // singleton instance
  static CLocalStorage? _instance;

  CLocalStorage._internal();

  factory CLocalStorage.instance() {
    _instance ??= CLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = CLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  // Generic methord to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic methord to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic methord to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // CLear all data in Storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
