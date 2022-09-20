import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/user_register.dart';
import 'dart:developer';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial(UserRegister())) {
    on<RegisterInitialEvent>((event, emit) {
      emit(RegisterInitialState(UserRegister()));
    });
    on<RegisterInputFullNameEvent>((event, emit) {
      RegisterState registerState =
          state.copyWith(firstName: event.firstName, lastName: event.lastName);
      emit(RegisterInputFullNameState(registerState.userRegister));
    });
    on<RegisterInputEmailEvent>((event, emit) {
      RegisterState registerState = state.copyWith(email: event.email);
      emit(RegisterInputEmailState(registerState.userRegister));
    });
    on<RegisterInputDateOfBirthEvent>((event, emit) {
      RegisterState registerState = state.copyWith();
      emit(RegisterInputDateOfBirthState(registerState.userRegister));
    });
  }
}
