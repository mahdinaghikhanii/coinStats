import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class AppwriteServices extends ChangeNotifier {
  var client = Client()
      .setEndpoint("https://localhost/v1") // Your API Endpoint
      .setProject("6267e78a1181dfd0fe5b") // Your project ID
      .setSelfSigned(status: true);
}
