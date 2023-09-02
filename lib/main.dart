import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:smart_gebere/features/blog/domain/usecases/create_article.dart';
import 'package:smart_gebere/features/blog/domain/usecases/delete_article.dart';
import 'package:smart_gebere/features/blog/domain/usecases/get_tags.dart';
import 'package:smart_gebere/features/blog/presentation/screen/viewBlog.dart';
import 'package:smart_gebere/features/onboarding/screens/splash_2.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences package
import 'package:smart_gebere/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_gebere/features/onboarding/screens/splash.dart';
import 'package:smart_gebere/core/bloc.dart';
import 'package:smart_gebere/features/user/presentation/pages/login.dart';
import 'package:smart_gebere/features/user/presentation/pages/user_profile_screen.dart';
import 'package:smart_gebere/features/home/screen/home_screen.dart';
import 'package:smart_gebere/features/blog/presentation/screen/addBlog.dart';
import 'package:smart_gebere/features/user/domain/usecases/get_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/login_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/register_user.dart';
import 'package:smart_gebere/features/user/domain/usecases/update_user.dart';
import 'package:smart_gebere/features/blog/domain/usecases/get_all_articles.dart';
import 'package:smart_gebere/features/blog/domain/usecases/get_single_article.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc.dart';
import 'package:smart_gebere/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  Bloc.observer = const AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      // Initialize SharedPreferences
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return loading widget while SharedPreferences is being fetched
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error if SharedPreferences cannot be fetched
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          // Check if 'auth_token' exists in SharedPreferences
          final prefs = snapshot.data!;
          final authToken = prefs.getString('auth_token');

          // Decide which screen to show based on the existence of 'auth_token'
          final initialRoute = authToken != null ? '/splash2' : '/splash';

          return MultiBlocProvider(
            providers: [
              BlocProvider<UserBloc>(
                // Provide UserBloc here
                create: (context) => UserBloc(
                  registerUser: sl<RegisterUserUseCase>(),
                  getUser: sl<GetUserUseCase>(),
                  loginUser: sl<LoginUserUseCase>(),
                  updateProfilePhoto: sl<UpdateProfilePhotoUseCase>(),
                ),
              ),
              // BlogBloc
              BlocProvider<BlogBloc>(
                create: (context) => BlogBloc(
                  getAllArticle: sl<GetArticleUseCase>(),
                  getSingleArticle: sl<GetSingleArticleUseCase>(),
                  getTags: sl<GetTagsUseCase>(),
                  createArticle: sl<CreateArticleUseCase>(),
                  deleteArticle: sl<DeleteArticleUseCase>(),
                ),
              ),
              // Other BlocProviders if needed
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Massaa',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.white,
                    secondary: const Color(0xffEE6F57)),
                useMaterial3: true,
              ),
              initialRoute:
                  initialRoute, // Use initialRoute based on 'auth_token'
              routes: {
                '/splash': (context) => const Splash(),
                '/splash2': (context) => const SplashSecond(),
                '/home': (context) => const Home(),
                '/profile': (context) => const UserProfileScreen(),
                '/login': (context) => const Login(),

                // Define routes here
              },
            ),
          );
        }
      },
    );
  }
}
