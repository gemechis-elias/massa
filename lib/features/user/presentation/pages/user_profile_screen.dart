import 'dart:developer';
import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc_event.dart';
import 'package:smart_gebere/features/blog/presentation/blocs/bloc_state.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc.dart';
import 'package:smart_gebere/features/user/presentation/blocs/bloc_state.dart';
import 'package:smart_gebere/features/user/presentation/blocs/get_user.dart/user_event.dart';
import 'package:smart_gebere/features/user/presentation/blocs/get_user.dart/user_state.dart';
import 'package:smart_gebere/features/user/presentation/widgets/about_me.dart';
import 'package:smart_gebere/features/user/presentation/widgets/my_activities.dart';
import 'package:smart_gebere/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_gebere/features/user/domain/entities/user.dart' as UserEntity;

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late String selectedActivity = 'Posts';
  late int selectedIndex = 0; // Initially selected index

  void updateSelectedActivity(String newActivity) {
    setState(() {
      selectedActivity = newActivity;
    });
  }

  UserEntity.User user =
      UserEntity.User(fullName: '', email: '', expertise: '', bio: '');

  List<Article> articles = [];
  bool _isDisposed = false; // Flag to track widget disposal

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
 
    // Articles
    context.read<BlogBloc>().add(const GetAllArticlesEvent());
    context.read<BlogBloc>().stream.listen((state) {
      if (!_isDisposed) {
        if (state is LoadedGetBlogState) {
          log("Articles are fetched on User Profile Page");
          setState(() {
            articles = state.articles;
          });
        }
      }
    });

    // Get User
    context.read<UserBloc>().add(const GetUserEvent());
    context.read<UserBloc>().stream.listen((state) {
      if (!_isDisposed) {
        // Check if widget is disposed before using setState
        if (state is LoadedGetUserState) {
          setState(() {
            user = state.user;
          });
        } else if (state is UserLoading) {
          log("Loading on User Profile Page");
          user = UserEntity.User(
            id: "123123",
            fullName: "loading ..",
            email: "loading ..",
            expertise: "loading ..",
            bio: "loading ..",
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserBloc>().add(const GetUserEvent());
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8FAFF),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Stack(
              children: [
                Text(
                  "Profile",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 2
                      ..color = const Color.fromARGB(
                          255, 253, 239, 239), // Stroke color (#000000)
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "Profile",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(
                        13, 37, 60, 1), // Fill color (#0D253C) in RGBA
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          // leading: Placeholder(),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                // Add your three dots menu logic here
              },
            ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Aboutme(
                  onActivitySelected: updateSelectedActivity, user: user),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MyActivity(
                  activity: selectedActivity, articles: articles, user: user),
            ),
          ],
        ),
      ),
    );
  }
}
