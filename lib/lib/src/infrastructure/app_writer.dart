import 'package:appwrite/appwrite.dart';

class AppwriteService {
  late Client client;
  late Account account;
  late Databases databases;
  late Storage storage;

  AppwriteService() {
    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('67d67588002156ea6599');

    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
  }
}

final appwriteService = AppwriteService();
