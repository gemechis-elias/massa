import 'package:flutter/material.dart';
import 'package:smart_gebere/features/user/domain/entities/user.dart' as UserEntity;

class Aboutme extends StatefulWidget {
  final Function(String) onActivitySelected;
  final UserEntity.User user;
  const Aboutme(
      {super.key, required this.onActivitySelected, required this.user});

  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
  int selectedIndex = 1; // Initialize selectedIndex here

  Widget buildCustomMetricRow(String value, String title, int index) {
    final color = index == selectedIndex
        ? const Color.fromARGB(255, 8, 85, 148)
        : const Color.fromARGB(255, 33, 150, 243);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; // Update selected index for each row
        });
        widget.onActivitySelected(title);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Urbanist',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Widget buildCustomMetricRow(String title, String value, int isSelected) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = isSelected; // Update selected index for each row
          });
          final color = isSelected == selectedIndex
              ? const Color.fromARGB(255, 8, 85, 148)
              : const Color.fromARGB(255, 33, 150, 243);
          widget.onActivitySelected(title);
        },
        child: Container(
          width: screenWidth * 0.2,
          height: screenWidth * 0.2, // Adjust the height as needed
          decoration: BoxDecoration(
            color: isSelected == selectedIndex
                ? const Color.fromARGB(255, 8, 85, 148)
                : const Color.fromARGB(255, 33, 150, 243),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Urbanist',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Urbanist',
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Center(
      child: SizedBox(
        // width: screenWidth * 0.8,
        height: screenHeight * 0.4,
        // color: Colors.red,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: screenWidth * 0.85,
              height: screenHeight * 0.37,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(149, 157, 165, 0.2),
                    offset: Offset(0, 8),
                    blurRadius: 24,
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 0.23 *
                                screenWidth, // Adjust the width based on screen width
                            height: 0.3 * screenHeight,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFF376AED)),
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 0.1 *
                                    screenWidth, // Adjust the width based on screen width
                                height: 0.2 * screenHeight,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0,
                                        color: Color.fromARGB(0, 55, 107, 237)),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/no_profile.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "@${widget.user.fullName}",
                                style: const TextStyle(
                                  color: Color(0xFF2D4379),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -0.24,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "${widget.user.fullName}",
                                style: const TextStyle(
                                  color: Color(0xFF0D253C),
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'UX Designer',
                                style: TextStyle(
                                  color: Color(0xFF376AED),
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Text(
                            'About me',
                            style: TextStyle(
                              color: Color(0xFF0D253C),
                              fontSize: 17,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            "${widget.user.bio}",
                            style: const TextStyle(
                              color: Color(0xFF2D4379),
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w100,
                              height: 1.43,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth * 0.6, // Adjust the width
                height: screenHeight * 0.08,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 33, 150, 243),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(149, 157, 165, 0.2),
                      offset: Offset(0, 8),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: buildCustomMetricRow(
                          "Posts",
                          '4.5K',
                          1,
                        ),
                      ),
                      Expanded(
                        child: buildCustomMetricRow(
                          "Following",
                          '4.5K',
                          2,
                        ),
                      ),
                      Expanded(
                        child: buildCustomMetricRow(
                          "Follower",
                          '4.5K',
                          3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
