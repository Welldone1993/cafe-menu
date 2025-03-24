import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/scaffold.dart';
import '../../../../infrastructure/utils/constants.dart';
import '../controller/details_controller.dart';

class DetailsPageView extends GetView<DetailsController> {
  const DetailsPageView({super.key});

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
          'جزیات',
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

  Widget _body(BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              // بخش بالایی برای نمایش تصویر
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/latte.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              // نام محصول
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'کافه موکا',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ریتینگ
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '4.7',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '(230)',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ردیف آیکن‌ها (گرم/سرد، نوع نوشیدنی، ...)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // مثلا آیکن سرد/گرم
                  _iconInfo(Icons.local_fire_department, 'گرم'),
                  const SizedBox(width: 16),
                  // آیکن نوع نوشیدنی
                  _iconInfo(Icons.coffee, 'قهوه'),
                  const SizedBox(width: 16),
                  // هر آیکن دیگری که می‌خواهید
                  _iconInfo(Icons.severe_cold, 'سرد'),
                ],
              ),

              const SizedBox(height: 16),

              // توضیحات محصول
              // برای Read More می‌توانید از پکیج readmore یا ویجت سفارشی استفاده کنید
              const Text(
                'کاپوچینو یک نوشیدنی تقریباً ۱۵۰ میلی‌لیتری (۵ اونس) است که شامل ۲۵ میلی‌لیتر اسپرسو و ۸۵ میلی‌لیتر شیر تازه می‌شود. روی اسپرسو، شیر فوم‌گرفته شده ریخته می‌شود که در نهایت یک لایه کرمی در بالا ایجاد کرده و طعمی قوی از قهوه به همراه دارد.',
                style: TextStyle(fontSize: 14),
              ),

              const SizedBox(height: 16),

              // انتخاب سایز
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _sizeOption('S', true),
                  _sizeOption('M', false),
                  _sizeOption('L', false),
                ],
              ),

              const SizedBox(height: 16),

              // قیمت و دکمه خرید
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '\$4.53',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // منطق خرید را اینجا بنویسید
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'خرید',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}

// ویجت کمکی برای نمایش آیکن و متن زیر آن
Widget _iconInfo(IconData icon, String label) {
  return Column(
    children: [
      Icon(icon, color: Colors.brown),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}

// ویجت کمکی برای نمایش گزینه‌های سایز
Widget _sizeOption(String size, bool isSelected) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: InkWell(
      onTap: () {
        // تغییر انتخاب سایز
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.brown : Colors.transparent,
          border: Border.all(color: Colors.brown),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.brown,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
