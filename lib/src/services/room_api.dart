import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:home_mobile_application/src/models/profile_model.dart';
import 'package:home_mobile_application/src/models/room_model.dart';
import 'package:http/http.dart' as http;

class RoomController extends GetxController {
  Rx<RoomModel> room = Rx<RoomModel>();

  Future<void> getRoom() async {
    await http.post(Uri.parse("http://api.gan-mkk.com/api/room")).then(
      (value) {
        print(value.body);
        room.value = roomModelFromJson(value.body);
      },
    );
  }

  @override
  void onReady() async {
    super.onReady();
    await getRoom();
  }
}

class ProfileController extends GetxController {
  Rx<NameModel> name = Rx<NameModel>();

  final Map<String, dynamic> body = {
    'token': 'bebded0c-925f-4ee2-b5c5-55ae16873dbe'
  };

  Future<void> getName() async {
    await http
        .post(Uri.parse("api.gan-mkk.com/api/profile/name"), body: body)
        .then(
      (value) {
        print(value.body);
        name.value = nameModelFromJson(value.body);
      },
    );
  }

  @override
  void onReady() async {
    super.onReady();
    await getName();
  }
}
