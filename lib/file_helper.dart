part of FilecoinStorage.client;


Future<Uint8List> getBytesFromFile(dynamic file) async{
  final fileBytes;
  if(file is html.File){
    fileBytes = convertHtmlFileToBytes(file);
  }
  else {
    fileBytes = convertIOFileToBytes(file);
  }
  return fileBytes;
}

Future<Uint8List> convertHtmlFileToBytes(html.File file) async {
  final reader = html.FileReader();
  reader.readAsArrayBuffer(file);
  await reader.onLoad.first;
  final finalResult = reader.result as Uint8List;
  return finalResult;
}

convertIOFileToBytes(io.File file){
  final finalResult = file.readAsBytes();
  return finalResult;
}
