

import 'dart:async';


import 'UsersModel.dart';
import 'bloc.dart';

class UserBloc extends Bloc {
 final userController = StreamController<List<UsersModel>>.broadcast();

  @override
  void dispose() {
    userController.close();
  }
}

UserBloc userBloc = UserBloc();