import 'package:get/get.dart';
import 'package:home_mobile_application/src/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  Rx<List<PostModel>> post = Rx<List<PostModel>>();

  Future<void> getPost() async {
    Map<String, dynamic> body = {
      "token": "bebded0c-925f-4ee2-b5c5-55ae16873dbe"
    };
    await http
        .post(Uri.parse("http://api.gan-mkk.com/api/post"), body: body)
        .then(
      (value) {
        print(value.body);
        post.value = postModelFromJson(value.body);
      },
    );
  }

  @override
  void onReady() async {
    super.onReady();
    await getPost();
  }
}
