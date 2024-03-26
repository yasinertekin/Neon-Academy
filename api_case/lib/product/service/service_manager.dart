import 'dart:convert';
import 'dart:io';

import 'package:api_case/product/model/post_model.dart';
import 'package:http/http.dart' as http;

abstract interface class IServiceManager {
  IServiceManager(this.client);

  Future<List<PostModel>?> getPosts();

  final http.Client client;
}

final class ServiceManager implements IServiceManager {
  ServiceManager(this.client);

  @override
  Future<List<PostModel>?> getPosts() async {
    final response = await client.get(Uri.parse(_PostUrl.postsUrls.value));
    if (response.statusCode == HttpStatus.ok) {
      final data = json.decode(response.body) as List<dynamic>;
      return data
          .map<PostModel>(
            (dynamic item) => PostModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  final http.Client client;
}

enum _PostUrl {
  postsUrls('https://jsonplaceholder.typicode.com/posts');

  final String value;

  const _PostUrl(this.value);
}
