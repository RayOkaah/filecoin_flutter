import 'package:flutter/material.dart';
import 'package:FilecoinStorage/api.dart';
import 'package:http/http.dart' as http ;
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import'dart:html' as html;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  dynamic testfunction() async{
    // [aToken] Your access token after creating an account with web3.storage
    String aToken = "";
    OAuth _oauth = OAuth(accessToken: aToken);
    ApiClient _apiClient = ApiClient(authentication: _oauth,);
    final api_instance = Web3StorageHTTPAPIApi(_apiClient);
    String cid = "";

    FilePickerResult? fileResult = await FilePicker.platform.pickFiles(allowMultiple: true, withReadStream: true, withData: true);
    http.MultipartFile fileVar;
    if (fileResult != null) {

      fileVar = http.MultipartFile('files', fileResult.files.first.readStream!, fileResult.files.length, filename: fileResult.files.single.name);

      final result;
      try  {
        result = await api_instance.postUpload(file: fileVar);
        return result;
      } catch (e) {
        print('Exception when calling Web3StorageHTTPAPIApi->getCarCid: $e\n');
      }
    } else {
      // User canceled the picker
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filecoin storage demo"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: testfunction,//_incrementCounter,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
