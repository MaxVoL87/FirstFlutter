// Project imports:
import 'package:first_flutter/home_2/user.dart';

class UserManager<T extends User> {
  final List<T> _userList = List.empty(growable: true);

  void add(T user) {
    _userList.add(user);
  }

  void remove(T user) {
    _userList.remove(user);
  }

  void removeLast() {
    _userList.removeLast();
  }

  List<String> getEmails() =>
      _userList.map((e) => e is AdminUser ? e.getMailSystem() : e.email).toList();

}
