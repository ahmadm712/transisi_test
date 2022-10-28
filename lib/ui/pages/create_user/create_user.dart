import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_transisi/cubits/create_user_cubit/create_user_cubit.dart';
import 'package:test_transisi/ui/widgets/input_forms.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});
  static const routeName = '/create-user';
  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController jobController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  clearField() {
    userNameController.clear();
    jobController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_reaction_rounded,
                  size: 120,
                  color: Colors.blueGrey,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputForm(
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                  controller: userNameController,
                ),
                const SizedBox(
                  height: 12,
                ),
                InputForm(
                  hintText: 'Job',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Job';
                    }
                    return null;
                  },
                  controller: jobController,
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<CreateUserCubit, CreateUserState>(
                  listener: (context, state) {
                    if (state is CreateUserSuccess) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Add User Success',
                        desc:
                            'You\'re Add Name: ${state.data.name} & Job: ${state.data.job}',
                      ).show();
                      clearField();
                    } else if (state is CreateUserFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 2),
                        content: Text(
                          state.error,
                        ),
                      ));
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<CreateUserCubit>().createUser(
                                name: userNameController.text,
                                job: jobController.text);
                          }
                        },
                        child: const Text('Add User'),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
