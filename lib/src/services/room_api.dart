import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
