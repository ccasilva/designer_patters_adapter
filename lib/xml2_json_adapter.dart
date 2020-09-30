import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class Xml2JsonAdapter {
  static Map<String, dynamic> adapter(String xml) {
    var xmlParser = Xml2Json();
    xmlParser.parse(xml);
    return json.decode(xmlParser.toParker());
  }
}
