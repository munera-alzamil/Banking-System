import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create an instance of FlutterSecureStorage
  final _storage = const FlutterSecureStorage();

  // Keys for storing data (like tokens)
  static const _authTokenKey = 'auth_token';

  // Write a token securely
  Future<void> writeAuthToken(String token) async {
    try {
      await _storage.write(key: _authTokenKey, value: token);
    } catch (e) {
      print('Error writing token: $e');
      // Handle error accordingly
    }
  }

  // Read a token securely
  Future<String?> readAuthToken() async {
    try {
      return await _storage.read(key: _authTokenKey);
    } catch (e) {
      print('Error reading token: $e');
      return null; // Handle error accordingly
    }
  }

  // Delete a token securely
  Future<void> deleteAuthToken() async {
    try {
      await _storage.delete(key: _authTokenKey);
    } catch (e) {
      print('Error deleting token: $e');
      // Handle error accordingly
    }
  }

  // Clear all stored data
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      print('Error clearing storage: $e');
      // Handle error accordingly
    }
  }

}

SecureStorage secureStorage = SecureStorage();

// When a user logs in or you receive a token
String token = 'user_auth_token';
await secureStorage.writeAuthToken(token);


String? token2 = await secureStorage.readAuthToken();
if (token2 != null) {
  print('Token retrieved: $token2');
} else {
  print('No token found');
}

// When logging out or clearing sensitive data
await secureStorage.deleteAuthToken();
