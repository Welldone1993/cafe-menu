import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../../infrastructure/app_writer.dart';

class AdminController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final RxBool isLogin = true.obs;
  final RxBool rememberMe = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final formKey = GlobalKey<FormState>();

  Future<void> signUp(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final fullName = fullNameController.text.trim();

    if (password.length <
            8 /*||
        !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,}\$')
            .hasMatch(password)*/
        ) {
      _showFaildSnackBar(
          'رمز عبور باید حداقل ۸ کاراکتر و شامل حرف، عدد و نماد باشد');
      return;
    }

    try {
      await appwriteService.account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: fullName,
      );
      _showSuccesSnackBar('ثبت‌نام موفقیت‌آمیز بود!');
      login(context);
    } catch (e) {
      _showFaildSnackBar('خطا در ثبت‌نام: $e');
      print(e);
    }
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
    final email = emailController.text.trim();
    final password = passwordController.text;
    try {
      final session = await appwriteService.account
          .createEmailPasswordSession(email: email, password: password);
      _showSuccesSnackBar('ورود موفقیت‌آمیز بود!');

      if (!context.mounted) return;
      //context.go(RouteNames.homePage);

      emailController.clear();
      passwordController.clear();
      fullNameController.clear();
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
      }

      _showFaildSnackBar(errorMessage);
      print(e);
    }
  }
}
