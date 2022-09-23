import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'consts.dart';

String hashingPassword(String password) {
  List<int> key = utf8.encode(password);
  List<int> bytes = utf8.encode(passwordPrivateKey);
  Hmac hmacSha256 = Hmac(sha256, key);
  Digest digest = hmacSha256.convert(bytes);
  return digest.toString();
}