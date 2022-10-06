class AppConfig {
  final Map _appConfigData = {
    "eventTitle": "Bring animated experience in your Flutter App",
    "eventOrganiser": "GeekyAnts",
    "eventTheme": "Flutter Fest",
    "venueLocation": "GeekyAnts Office",
    "venuePartner": "GeekyAnts",
    "date": "8th October, 2022",
    "animationTime": 375
  };
  static final instance = AppConfig._();
  String get eventTitle => _appConfigData['eventTitle'];
  String get eventOrganiser => _appConfigData['eventOrganiser'];
  String get eventTheme => _appConfigData['eventTheme'];
  String get venueLocation => _appConfigData['venueLocation'];
  String get venuePartner => _appConfigData['venuePartner'];
  String get date => _appConfigData['date'];
  int get animationTime => _appConfigData['animationTime'];

  AppConfig._();
}
