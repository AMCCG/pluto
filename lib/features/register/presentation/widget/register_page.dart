import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
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
            child: const Text('Register'),
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
            if (state is RegisterInputDateOfBirthState) {
              return Column(
                children: [
                  Text('$state'),
                  Text(state.userRegister.firstName!),
                  Text(state.userRegister.lastName!),
                  Text(state.userRegister.email!),
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
            context.read<RegisterBloc>().add(RegisterInputFullNameEvent(
                firstName: _firstNameController.text,
                lastName: _lastNameController.text));
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
            context
                .read<RegisterBloc>()
                .add(RegisterInputEmailEvent(email: _emailController.text));
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
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Age'),
        TextButton(
          onPressed: () {
            context
                .read<RegisterBloc>()
                .add(RegisterInputEmailEvent(email: _emailController.text));
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
