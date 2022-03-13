import 'package:flutter_test/flutter_test.dart';
import 'package:mimalo/mimalo.dart';
import 'dart:io';

void main() {
  test("Get mime type of the file extension", (){
    ContentType? type = mimalo(filePathOrExtension: "nada.js");
    if(type != null){
      print(type.mimeType.toString());
    }
  });
  test("Get file extension from MIME type", (){
    ContentType? type = mimalo(filePathOrExtension: "nada.js");
    String? fileExtension = noMeMimes(
      contentType: type!,
    );
    if(fileExtension != null){
      print(fileExtension);
    }
  });
}