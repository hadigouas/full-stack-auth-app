import 'package:auth_app/services/authservecise/user_module.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  User _user = User(name: '', email: '', password: '', token: '', id: '');
  User get user => _user;

  void getuserdata(Map<String, dynamic> userdata) {
    _user = User.fromMap(userdata);
  }
}
