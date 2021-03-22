import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:home_mobile_application/src/models/profile_model.dart';
import 'package:home_mobile_application/src/models/room_model.dart';
import 'package:home_mobile_application/src/models/stat_model.dart';
import 'package:http/http.dart' as http;

final Map<String, dynamic> body = {
  'token': 'fa9f1fe4-096f-4779-aae4-910d498b6ba1'
};

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

  Future<void> getName() async {
    await http
        .post(Uri.parse("http://api.gan-mkk.com/api/profile/name"), body: body)
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

class StatModelController extends GetxController {
  Rx<StatModel> stat = Rx<StatModel>();

  Future<void> getStat() async {
    await http
        .post(Uri.parse("http://api.gan-mkk.com/api/stat/all"), body: body)
        .then(
      (value) {
        print(value.body);
        stat.value = statModelFromJson(value.body);
      },
    );
  }

  @override
  void onReady() async {
    super.onReady();
    await getStat();
  }
}
