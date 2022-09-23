part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final UserRegister userRegister;

  const RegisterState(this.userRegister);

  @override
  List<Object> get props => [userRegister];

  RegisterState copyWith(
      {String? firstName,
      String? lastName,
      String? email,
      DateTime? dateOfBirth,
      int? age}) {
    UserRegister userRegister = UserRegister();
    if (this.userRegister.firstName == null) {
      userRegister.firstName = firstName ?? '';
    } else {
      userRegister.firstName = firstName ?? this.userRegister.firstName;
    }
    if (this.userRegister.lastName == null) {
      userRegister.lastName = lastName ?? '';
    } else {
      userRegister.lastName = lastName ?? this.userRegister.lastName;
    }
    if (this.userRegister.email == null) {
      userRegister.email = email ?? '';
    } else {
      userRegister.email = email ?? this.userRegister.email;
    }
    if (this.userRegister.dateOfBirth == null) {
      userRegister.dateOfBirth = dateOfBirth ?? DateTime.now();
    } else {
      userRegister.dateOfBirth = dateOfBirth ?? this.userRegister.dateOfBirth;
    }
    if (this.userRegister.age == null) {
      userRegister.age = age ?? 0;
    } else {
      userRegister.age = age ?? this.userRegister.age;
    }
    return RegisterState(userRegister);
  }
}

class RegisterInitial extends RegisterState {
  const RegisterInitial(super.userRegister);
}

class RegisterInitialState extends RegisterState {
  const RegisterInitialState(super.userRegister);
}

class RegisterInputFullNameState extends RegisterState {
  const RegisterInputFullNameState(super.userRegister);
}

class RegisterInputEmailState extends RegisterState {
  const RegisterInputEmailState(super.userRegister);
}

class RegisterInputDateOfBirthState extends RegisterState {
  const RegisterInputDateOfBirthState(super.userRegister);
}

class RegisterDisplayDetailState extends RegisterState {
  const RegisterDisplayDetailState(super.userRegister);
}
