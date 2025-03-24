import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/scaffold.dart';
import '../../../../../infrastructure/utils/constants.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: Directionality(
            textDirection: TextDirection.rtl, child: _body(context)),
        showEndDrawer: true,
        appbar: _appBar(context),
      );

  AppBar _appBar(BuildContext context) => AppBar(
        toolbarHeight: 60,
        title: Text(
          'ورود ادمین',
          style: _textStyle(),
        ),
        backgroundColor: Color(0xff313131),
        centerTitle: true,
        actions: [
          Builder(
            builder: (BuildContext context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer()),
          )
        ],
      );

  TextStyle _textStyle() => TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: Constants.iranSansFaNumFont,
      color: Colors.white);

  Padding _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(labelText: 'ایمیل'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value!.isEmpty
                  ? 'وارد کردن ایمیل الزامی است'
                  : (!GetUtils.isEmail(value) ? 'ایمیل معتبر نیست' : null),
            ),
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                  labelText: 'رمز عبور',
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.isPasswordVisible.value =
                          !controller.isPasswordVisible.value;
                    },
                  ),
                ),
                obscureText: !controller.isPasswordVisible.value,
                validator: (value) =>
                    value!.isEmpty ? 'وارد کردن رمز عبور الزامی است' : null,
              ),
            ),
            const SizedBox(height: 20),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.login(context);
                    }
                  },
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ورود'),
                        Constants.mediumHorizontalSpacer,
                        Obx(() => controller.isLoading.value
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ))
                            : SizedBox()),
                      ],
                    ),
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
