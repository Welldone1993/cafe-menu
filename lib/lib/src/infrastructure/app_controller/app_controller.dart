class AppController {
  factory AppController() => _instance;

  AppController._();

  static final AppController _instance = AppController._();

  void initializeApp() {}
}
