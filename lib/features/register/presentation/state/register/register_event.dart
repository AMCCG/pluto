part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterInitialEvent extends RegisterEvent {}

class RegisterInputFullNameEvent extends RegisterEvent {
  final String firstName;
  final String lastName;

  const RegisterInputFullNameEvent(
      {required this.firstName, required this.lastName});
}

class RegisterInputEmailEvent extends RegisterEvent {
  final String email;

  const RegisterInputEmailEvent({required this.email});
}

class RegisterInputDateOfBirthEvent extends RegisterEvent {
  final DateTime dateTime;
  final int age;

  const RegisterInputDateOfBirthEvent(
      {required this.dateTime, required this.age});
}
