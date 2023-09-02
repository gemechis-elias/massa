import 'package:smart_gebere/core/utils/is_email_valid.dart';
import 'package:smart_gebere/features/onboarding/widgets/loading_widget.dart';
import 'package:smart_gebere/features/user/domain/usecases/get_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/login_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/register_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/update_user.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc_state.dart';
import 'package:smart_gebere/features/user/presentation/blocs/login/login_state.dart';
import 'package:smart_gebere/features/user/presentation/blocs/singup/signup_event.dart';
import 'package:smart_gebere/features/user/presentation/blocs/singup/signup_state.dart';
import 'package:smart_gebere/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool _isLoading = false;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ConfirmPasswordController =
      TextEditingController();
  bool pasword_obscure = true;
  bool ConfirmPasword_obscure = true;

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _ConfirmPasswordController.dispose();
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
        listener: (context, state) {
          if (state is UserSignedInState) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushNamed(context, '/home', arguments: state.user.id);
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
              'Welcome',
              style: TextStyle(
                  color: Color(0xFF0D253C),
                  fontFamily: 'Urbanist-Regular',
                  fontSize: 30),
            ),
            const Text(
              'Provide Credentials to SignUp',
              style: TextStyle(
                color: Color(0xFF2D4379),
                fontFamily: 'Urbanist-Bold',
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                hintText: 'eg. Abel Abebe',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                labelText: 'Full Name ',
                labelStyle: const TextStyle(
                  color: Color(0xFF2D4379),
                  fontFamily: 'Urbanist-Light',
                  fontSize: 18,
                ),
              ),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontFamily: 'Urbanist-Light',
                  fontSize: 18,
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color(0xFF2D4379),
                  fontFamily: 'Urbanist-Light',
                  fontSize: 18,
                ),
              ),
            ),
            TextField(
              controller: _ConfirmPasswordController,
              obscureText: ConfirmPasword_obscure,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: const TextStyle(
                  color: Color(0xFF2D4379),
                  fontFamily: 'Urbanist-Light',
                  fontSize: 18,
                ),
                suffixIcon: TextButton(
                    onPressed: () {
                      setState(() {
                        ConfirmPasword_obscure = !ConfirmPasword_obscure;
                      });
                    },
                    child: Text(
                      ConfirmPasword_obscure ? 'show' : 'Hide',
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
                    final fullName = _fullNameController.text;
                    if (isEmailValid(email) && password.isNotEmpty) {
                      context.read<UserBloc>().add(RegisterUserEvent(
                            fullName: fullName,
                            email: email,
                            password: password,
                            bio: '',
                            expertise: '',
                          ));
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
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color(0xFF004600)),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        ) // Show a CircularProgressIndicator if login is in progress
                      : const Text(
                          'SIGNUP',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Urbanist-Bold',
                              fontSize: 16),
                        ),
                ),
              ),
            ),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account?',
                    style: TextStyle(
                        color: Color(0xFF2D4379),
                        fontFamily: 'Urbanist-Bold',
                        fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(context, '/login');
                        });
                      },
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            ) // Show a CircularProgressIndicator if login is in progress
                          : const Text(
                              'Login',
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
