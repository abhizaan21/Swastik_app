import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/foundation.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('Uploaded Image/$imageName').getDownloadURL();
    return downloadURL;
  }

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('Uploaded Image/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  Future<firebase_storage.ListResult> listFiles() async{
    firebase_storage.ListResult results=await storage.ref('uploaded Image').listAll();
    for (var ref in results.items) {
      print('Found a file: $ref');
    }
  return results;}


}
