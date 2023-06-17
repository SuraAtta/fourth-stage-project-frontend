import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import '../local_database/shared_preferences.dart';

class Wishlist {
  final int id;

  Wishlist({required this.id});

  Map<String, dynamic> toJson() {
    return {'id': id,};
  }
}

Future<void> postID(int id) async {
  var token = Database2.box.read("token");
  print(Database2.box.read("token"));
  final url = Uri.parse('http://127.0.0.1:10000/api/cart/create');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  //final body = {'id': id};
  print('Database2.box.read("token")');
  final body = '''{\r\n  "product_id":${id}\r\n  }''';
  //var response = await http.get(url, headers: headers);
  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    print('ID posted successfully.');
  } else {
    print('Error posting ID: ${response.reasonPhrase}');
  }
}