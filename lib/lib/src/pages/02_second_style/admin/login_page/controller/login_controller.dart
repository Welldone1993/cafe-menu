import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../../infrastructure/app_writer.dart';
import '../../../../../infrastructure/routes/route_names.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    final sessions =
        await appwriteService.account.getSession(sessionId: 'current');
    await appwriteService.account.deleteSession(sessionId: sessions.$id);
    super.onInit();
  }

  void _showSuccesSnackBar(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _showFaildSnackBar(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> login(BuildContext context) async {
    isLoading(true);
    final email = emailController.text.trim();
    final password = passwordController.text;

    /*   final sessions =
        await appwriteService.account.getSession(sessionId: 'current');
    await appwriteService.account.deleteSession(sessionId: sessions.$id);*/

    try {
      await appwriteService.account
          .createEmailPasswordSession(email: email, password: password);
      _showSuccesSnackBar('ورود موفقیت‌آمیز بود!');

      if (!context.mounted) return;
      Get.offNamed(CafeMenuRouteNames.secondStyleAdminPage.uri);

      emailController.clear();
      passwordController.clear();
      fullNameController.clear();
      isLoading(false);
    } catch (e) {
      String errorMessage = 'خطا در ورود: لطفاً دوباره تلاش کنید.';

      if (e is AppwriteException) {
        switch (e.code) {
          case 401:
            errorMessage = 'دسترسی غیرمجاز! لطفاً اطلاعات ورود را بررسی کنید.';
            break;
          case 400:
            errorMessage = 'درخواست نامعتبر! ایمیل یا رمز عبور صحیح نیست.';
            break;
          case 404:
            errorMessage = 'کاربری با این ایمیل یافت نشد.';
            break;
          case 429:
            errorMessage =
                'تعداد درخواست‌ها بیش از حد مجاز است! لطفاً بعداً تلاش کنید.';
            break;
          case 500:
            errorMessage = 'خطای سرور! لطفاً بعداً تلاش کنید.';
            break;
          default:
            errorMessage = 'خطای ناشناخته: ${e.message}';
            break;
        }
      } else {
        errorMessage = 'خطای غیرمنتظره رخ داد!';
        isLoading(false);
      }

      _showFaildSnackBar(errorMessage);
      print(e);
      isLoading(false);
    }
  }
}
