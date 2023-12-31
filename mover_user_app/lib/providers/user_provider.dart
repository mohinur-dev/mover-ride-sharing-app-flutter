import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mover_user_app/services/database_services.dart';
import '../models/user_model.dart' as user;

class UserProvider with ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  user.User? _loggedUser;

  user.User? get loggedUser => _loggedUser;

  UserProvider.initialize() {
    if (FirebaseAuth.instance.currentUser != null) {
      _dbService.getUser(FirebaseAuth.instance.currentUser!.uid).then(
        (user.User user) {
          _loggedUser = user;
          notifyListeners();
        },
      );
    }
  }

  void setUser(user.User user) {
    _loggedUser = user;
  }

  void clearUser() {
    _loggedUser = null;
  }
}
