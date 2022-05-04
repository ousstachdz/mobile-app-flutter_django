import 'package:equatable/equatable.dart';

class AuthEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartEvent extends AuthEvents {}

class LoginSubmit extends AuthEvents {
  final String username;
  final String password;

  LoginSubmit({required this.username, required this.password});
}
