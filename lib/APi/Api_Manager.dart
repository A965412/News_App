import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/APi/Api_Constant.dart';
import 'package:news_application/Models/EveryResponse.dart';
import 'package:news_application/Models/SourceResponse.dart';

class Apimanager {
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
 https://newsapi.org/v2/everything?apiKey=21c0a356eb8c4a95b1c80d22a50bec59
21c0a356eb8c4a95b1c80d22a50bec59
 */
  static Future<EveryResponse> search(String query) async {
    Uri url = Uri.https(apiconstant.authority, apiconstant.unencodedPath,
        {'apiKey': '21c0a356eb8c4a95b1c80d22a50bec59', "q": query});

    try {
      var response = await http.get(url);
      var bodystring = response.body;
      var json = jsonDecode(bodystring);
      return EveryResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<SourceResponse?> getresources(String categoryid) async {
    Uri url = Uri.https(apiconstant.authority, apiconstant.unencodedPath,
        {'apiKey': '21c0a356eb8c4a95b1c80d22a50bec59', "category": categoryid});

    try {
      var response = await http.get(url);
      var bodystring = response.body;
      var json = jsonDecode(bodystring);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<EveryResponse> getNewsByIdforsearch(
      {String? sourcrId, String? query}) async {
    Uri url = Uri.https(apiconstant.authority, apiconstant.newspath, {
      "apiKey": '21c0a356eb8c4a95b1c80d22a50bec59',
      'sources': sourcrId,
      'q': query
    });
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return EveryResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<EveryResponse> getNewsById(String? sourcrId) async {
    Uri url = Uri.https(apiconstant.authority, apiconstant.newspath, {
      "apiKey": '21c0a356eb8c4a95b1c80d22a50bec59',
      'sources': sourcrId,
    });
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return EveryResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
