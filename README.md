# Mímalo

A library to get the Mime Types from Extensions and the Extensions from Mime types

Hecho en 🇵🇷 por Radamés J. Valentín Reyes

# Import

~~~dart
import 'package:mimalo/mimalo.dart';
import 'dart:io';
~~~

# Examples

## mimalo

a function to get the mime type of the file by supplying the file path or extension as String

~~~dart
ContentType? type = mimalo(filePathOrExtension: "mimamamemima.js");
if(type != null){
  print(type.mimeType.toString());
}
~~~

## noMeMimes

a function to get the extension of the file by supplying the mime type

~~~dart
ContentType? type = mimalo(filePathOrExtension: "nada.js");
String? fileExtension = noMeMimes(
  contentType: type!,
);
if(fileExtension != null){
  print(fileExtension);
}
~~~

# For node.js users

A software similar to this that I wrote a couple of year ago

https://www.npmjs.com/package/mimalo

# JS code used to extract mime types from the MDN website

Ran this code on the developer console while on the MDN website on MIME Types. It was not a perfect solution but only required minimal modification. Just copied the code logged into the console.
~~~js
var rows = document.getElementById("mimes").getElementsByTagName("tr");
var result = "";
for(rowIndex = 0; rowIndex < rows.length; rowIndex++){
  var thisRow = rows.item(rowIndex);
  var thisColumns = thisRow.getElementsByTagName("td");
  //Extensions are in the first column
  var extensions = thisColumns[0].getElementsByTagName("code");
  var mimeType = thisColumns[2].getElementsByTagName("code")[0].textContent;
  for(extensionIndex = 0; extensionIndex < extensions.length; extensionIndex++){
    var thisExtension = extensions[extensionIndex].textContent;
    result += '"'+ thisExtension +'" : "' + mimeType + '",\n';
  }
}
console.log(result);
~~~
# References
- https://developer.mozilla.org/es/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types
- https://api.dart.dev/stable/2.14.4/dart-io/ContentType/text.html