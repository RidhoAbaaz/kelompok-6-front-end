import 'package:get/get.dart';
import 'package:zoobeta/views/animals.dart';
import 'package:zoobeta/views/home.dart';
import 'package:zoobeta/views/profile.dart';

class ButtonNav extends GetxController {
  RxInt count = 0.obs;

  final pages = [const HomePage(), const AnimalPage(), const ProfileScreen()];
}
