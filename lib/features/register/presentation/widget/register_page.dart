import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pluto/features/register/presentation/state/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;

  late DateTime _selectedDate;
  int _age = 0;

  @override
  void initState() {
    _selectedDate = DateTime.now();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildFormUserName(context, _formKey),
              buildContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Form buildFormUserName(BuildContext context, GlobalKey formKey) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            child: const Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
            if (state is RegisterInitialState) {
              return buildRegisterInputFullNameForm();
            }
            if (state is RegisterInputFullNameState) {
              return buildRegisterInputEmailForm();
            }
            if (state is RegisterInputEmailState) {
              return buildRegisterInputDateOfBirthForm();
            }
            if (state is RegisterDisplayDetailState ||
                state is RegisterInputDateOfBirthState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$state'),
                  Text('FirstName : ${state.userRegister.firstName!}'),
                  Text('LastName : ${state.userRegister.lastName!}'),
                  Text('Email : ${state.userRegister.email!}'),
                  Text(
                      'DateOfBirth : ${state.userRegister.dateOfBirth!.toString()}'),
                  Text('Age : ${state.userRegister.age!.toString()}'),
                  ElevatedButton(onPressed: () {}, child: const Text('Submit')),
                ],
              );
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }

  Column buildRegisterInputFullNameForm() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: 'FirstName'),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter firstName';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: 'LastName'),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter lastName';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<RegisterBloc>().add(RegisterInputFullNameEvent(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text));
            }
          },
          child: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            child: const Text('next'),
          ),
        )
      ],
    );
  }

  Column buildRegisterInputEmailForm() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    var regExp = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                    if (!regExp.hasMatch(value)) {
                      return 'invalid email format';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context
                  .read<RegisterBloc>()
                  .add(RegisterInputEmailEvent(email: _emailController.text));
            }
          },
          child: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            child: const Text('next'),
          ),
        )
      ],
    );
  }

  Column buildRegisterInputDateOfBirthForm() {
    return Column(
      children: [
        const SizedBox(height: 20),
        OutlinedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: const Text('Date Of Birth')),
        const SizedBox(height: 20),
        Text(DateFormat.yMd().format(_selectedDate)),
        const SizedBox(height: 40),
        const Text('Age'),
        const SizedBox(height: 20),
        Text(_age.toString()),
        TextButton(
          onPressed: () {
            context.read<RegisterBloc>().add(RegisterInputDateOfBirthEvent(
                age: _age, dateOfBirth: _selectedDate));
          },
          child: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
            ),
            child: const Text('next'),
          ),
        )
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _calAge();
      });
    }
  }

  void _calAge() {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    int currentDay = DateTime.now().day;
    int selectYear = _selectedDate.year;
    int selectMonth = _selectedDate.month;
    int selectDay = _selectedDate.day;
    if (currentYear <= selectYear) {
      _age = 0;
    }

    if (currentMonth > selectMonth) {
      _age = currentYear - selectYear - 1;
    }
    if (currentMonth == selectMonth) {
      if (currentDay >= selectDay) {
        _age = currentYear - selectYear;
      } else {
        _age = currentYear - selectYear - 1;
      }
    }
    _age = currentYear - selectYear;
  }

  Container buildContainer(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/authentication', ModalRoute.withName('/'));
              },
              child: const Text('Already Account')),
        ],
      ),
    );
  }
}
