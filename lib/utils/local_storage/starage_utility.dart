// import 'package:get_storage/get_storage.dart';

// class CLocalStorage {
//   static final CLocalStorage _instance = CLocalStorage._internal();

//   factory CLocalStorage() {
//     return _instance;
//   }

//   CLocalStorage._internal();

//   final _storage = GetStorage();

//   //* Generic methord to store data
//   Future<void> saveData<T>(String key, T value) async {
//     await _storage.write(key, value);
//   }

//   //* Generic methord to read data
//   readData<T>(String key) async {
//     await _storage.read(key);
//   }

//   //* Generic methord to remove data
//   Future<void> removeData<T>(String key) async {
//     await _storage.remove(key);
//   }
  
//   //* Clear All Data in Storage
//   Future<void> clearAll() async {
//     await _storage.erase();
//   }
// }
