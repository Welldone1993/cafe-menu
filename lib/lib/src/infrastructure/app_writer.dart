import 'package:appwrite/appwrite.dart';

class AppwriteService {
  late Client client;
  late Account account;
  late Databases databases;
  late Storage storage;
  final String databaseId = '67e1185b000b3f4d9381';
  final String collectionCategoryId = '67e11874003ba972679c';

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
