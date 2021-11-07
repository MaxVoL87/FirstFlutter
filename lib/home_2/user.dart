abstract class User {
  final String email;

  User(this.email);
}

mixin UserMixin on User {
  String getMailSystem() {
    final parts = email.split('@');
    return parts.length >= 2 ? parts.last : "";
  }
}

class AdminUser extends User with UserMixin {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}