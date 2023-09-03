import 'dart:developer';

import 'package:smart_gebere/core/utils/is_email_valid.dart';
import 'package:smart_gebere/features/onboarding/widgets/loading_widget.dart';
import 'package:smart_gebere/features/user/domain/usecases/get_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/login_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/register_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/update_user.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc_state.dart';
import 'package:smart_gebere/features/user/presentation/blocs/login/login_event.dart';
import 'package:smart_gebere/features/user/presentation/blocs/login/login_state.dart';
import 'package:smart_gebere/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _isLoading = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool pasword_obscure = true;
  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        registerUser: sl<RegisterUserUseCase>(),
        getUser: sl<GetUserUseCase>(),
        loginUser: sl<LoginUserUseCase>(),
        updateProfilePhoto: sl<UpdateProfilePhotoUseCase>(),
      ),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) async {
          if (state is LoadedUserState) {
            setState(() {
              _isLoading = false;
            });
            // Store name in SharedPreferences
            final prefs = await SharedPreferences.getInstance();
            prefs.setString('fullName', state.user.fullName!);

            Navigator.pushNamed(context, '/home');
          }
          // loading state
          else if (state is UserLoading) {
            setState(() {
              _isLoading = true;
            });
          } else if (state is UserError) {
            // Handle error if login fails
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return buildBody(context);
        },
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back',
              style: TextStyle(
                  color: Color(0xFF0D253C),
                  fontFamily: 'Urbanist-Regular',
                  fontSize: 28),
            ),
            const Text(
              'Sign in with your account',
              style: TextStyle(
                color: Color(0xFF2D4379),
                fontFamily: 'Urbanist-Bold',
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontFamily: 'Urbanist-Light',
                  fontSize: 18,
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: pasword_obscure,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color(0xFF2D4379),
                  fontFamily: 'Urbanist-Light',
                  fontSize: 18,
                ),
                suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        pasword_obscure = !pasword_obscure;
                      });
                    },
                    child: Text(
                      pasword_obscure ? 'show' : 'Hide',
                      style: const TextStyle(
                        color: Color(0xFF2D4379),
                        fontFamily: 'Urbanist-Bold',
                        fontSize: 14,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            //Login button
            Center(
              child: SizedBox(
                height: 60,
                width: 295,
                child: ElevatedButton(
                  onPressed: () {
                    final email = _usernameController.text;
                    final password = _passwordController.text;
                    if (isEmailValid(email) && password.isNotEmpty) {
                      context.read<UserBloc>().add(
                          LoginUserEvent(email: email, password: password));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Invalid email or Password'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xff20813c),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        ) // Show a CircularProgressIndicator if login is in progress
                      : const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Urbanist-Bold',
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Forgot your password?',
                    style: TextStyle(
                        color: Color(0xFF2D4379),
                        fontFamily: 'Urbanist-Bold',
                        fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Reset here',
                        style: TextStyle(
                            color: Color(0xFF376AED),
                            fontFamily: 'Urbanist-Regular',
                            fontSize: 14),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
