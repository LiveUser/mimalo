library mimalo;

import 'dart:io';

//Extension and asociated MIME type
Map<String,String> _mimeTypes = {
  ".aac" : "audio/aac",
  ".abw" : "application/x-abiword",
  ".arc" : "application/octet-stream",
  ".avi" : "video/x-msvideo",
  ".azw" : "application/vnd.amazon.ebook",
  ".bin" : "application/octet-stream",
  ".bz" : "application/x-bzip",
  ".bz2" : "application/x-bzip2",
  ".csh" : "application/x-csh",
  ".css" : "text/css",
  ".csv" : "text/csv",
  ".doc" : "application/msword",
  ".epub" : "application/epub+zip",
  ".gif" : "image/gif",
  ".htm" : "text/html",
  ".html" : "text/html",
  ".ico" : "image/x-icon",
  ".ics" : "text/calendar",
  ".jar" : "application/java-archive",
  ".jpeg" : "image/jpeg",
  ".jpg" : "image/jpeg",
  ".js" : "application/javascript",
  ".json" : "application/json",
  ".mid" : "audio/midi",
  ".midi" : "audio/midi",
  ".mpeg" : "video/mpeg",
  ".mpkg" : "application/vnd.apple.installer+xml",
  ".odp" : "application/vnd.oasis.opendocument.presentation",
  ".ods" : "application/vnd.oasis.opendocument.spreadsheet",
  ".odt" : "application/vnd.oasis.opendocument.text",
  ".oga" : "audio/ogg",
  ".ogv" : "video/ogg",
  ".ogx" : "application/ogg",
  ".pdf" : "application/pdf",
  ".ppt" : "application/vnd.ms-powerpoint",
  ".rar" : "application/x-rar-compressed",
  ".rtf" : "application/rtf",
  ".sh" : "application/x-sh",
  ".svg" : "image/svg+xml",
  ".swf" : "application/x-shockwave-flash",
  ".tar" : "application/x-tar",
  ".tif" : "image/tiff",
  ".tiff" : "image/tiff",
  ".ttf" : "font/ttf",
  ".vsd" : "application/vnd.visio",
  ".wav" : "audio/x-wav",
  ".weba" : "audio/webm",
  ".webm" : "video/webm",
  ".webp" : "image/webp",
  ".woff" : "font/woff",
  ".woff2" : "font/woff2",
  ".xhtml" : "application/xhtml+xml",
  ".xls" : "application/vnd.ms-excel",
  ".xml" : "application/xml",
  ".xul" : "application/vnd.mozilla.xul+xml",
  ".zip" : "application/zip",
  ".3gp" : "video/3gpp",
  ".3g2" : "video/3gpp2",
  ".7z" : "application/x-7z-compressed",
};
///Get ContentType from extension or path. Returns null if there is no MIME type asociated with the extension on this library.
ContentType? mimalo({
  required String filePathOrExtension,
  charset = "utf-8",
}){
  String fileExtension = filePathOrExtension.substring(filePathOrExtension.lastIndexOf("."));
  List<String> extensions = _mimeTypes.keys.toList();
  int extensionIndex = extensions.indexOf(fileExtension);
  if(extensionIndex == -1){
    return null;
  }else{
    String typeOfContent = _mimeTypes[extensions[extensionIndex]]!;
    List<String> brokenType = typeOfContent.split("/");
    return ContentType(
      brokenType[0],
      brokenType[1],
      charset: charset,
    );
  }
}
///Get Extension from ContentType. Returns null if there is no extension asociated with the MIME type on this library.
String? noMeMimes({
  required ContentType contentType,
}){
  List<String> mimeTypes = _mimeTypes.values.toList();
  List<String> extensions = _mimeTypes.keys.toList();
  int mimeTypeIndex = mimeTypes.indexOf(contentType.mimeType);
  if(mimeTypeIndex != -1){
    return extensions[mimeTypeIndex];
  }else{
    return null;
  }
}