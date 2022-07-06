import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> getFavicon({required String url}) async {
  String formattedUrl = url;
  bool isVaild = false;
  formattedUrl.contains("http://")
      ? null
      : formattedUrl = "http://$formattedUrl";

  try {
    isVaild = Uri.parse(formattedUrl).host.isNotEmpty;

    final response = await http.head(Uri.parse(formattedUrl));
    switch (response.statusCode) {
      case 200:
        isVaild = true;
        break;
      default:
        isVaild = false;
        break;
    }
  } catch (e) {
    isVaild = false;
  }

  isVaild ? formattedUrl += "/favicon.ico" : formattedUrl = "";

  return [Image.network(formattedUrl), isVaild];
}
