class Post {
  final String id;
  final String name;
  final String roast;
  String image = 'No Image';

  Post({String? image, required String name, required String roast, required String id})
    : name = name,
      roast = roast,
      id = id;

  Post.fromJSON(Map<String, dynamic> parsedJson)
    :name = parsedJson['name'],
    image = parsedJson['image'],
    roast = parsedJson['roast'],
    id = parsedJson['_id'];
}