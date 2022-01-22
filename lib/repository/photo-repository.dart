import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:wallpaperapp/models/failuremode.dart';
import 'package:wallpaperapp/models/photosmodel.dart';

class PhotoRepository {
  final http.Client _client;

  static String curatedBaseUrl =
      'https://api.pexels.com/v1/curated?per_page=1000';

  PhotoRepository({http.Client? client}) : _client = client ?? http.Client();

  Future<List<PhotoModel>> getPhotos() async {
    try {
      final response = await _client.get(Uri.parse(curatedBaseUrl), headers: {
        HttpHeaders.authorizationHeader: '${dotenv.env['PEXELS_API_KEY']}'
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        // print(prettyJson((data['photos']), indent: 2));

        return (data['photos'] as List)
            .map((e) => PhotoModel.fromMap(e))
            .toList();
      } else {
        // ignore: avoid_print
        print(response.statusCode);
        throw Failure(message: "something is wrong!!");
      }
    } on Exception catch (e) {
      throw Failure(message: '$e');
    }
  }

  Future<List<PhotoModel>> getSearchPhotos(String photoSearch) async {
    final String searchPhotoUrl =
        'https://api.pexels.com/v1/search?query=$photoSearch&per_page=10000';
    try {
      final response = await _client.get(Uri.parse(searchPhotoUrl), headers: {
        HttpHeaders.authorizationHeader: '${dotenv.env['PEXELS_API_KEY']}'
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        // print(prettyJson((data['photos']), indent: 2));

        return (data['photos'] as List)
            .map((e) => PhotoModel.fromMap(e))
            .toList();
      } else {
        // ignore: avoid_print
        print(response.statusCode);
        throw Failure(message: "something is wrong!!");
      }
    } on Exception catch (e) {
      throw Failure(message: '$e');
    }
  }
}
