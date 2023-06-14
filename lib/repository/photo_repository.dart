import 'dart:convert';

import 'package:http/http.dart';
import 'package:photo_api_bloc/modals/photo_modal.dart';

class PhotoRepository {
  String photoUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<PhotoModal>> getPhotos() async {
    Response response = await get(Uri.parse(photoUrl),) ;
        if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => PhotoModal.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }

  }
}