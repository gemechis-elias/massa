String getGreeting() {
  final currentTime = DateTime.now();
  if (currentTime.hour < 12) {
    return "Good morning, ";
  } else if (currentTime.hour < 17) {
    return "Good afternoon, ";
  } else {
    return "Good evening, ";
  }
}
