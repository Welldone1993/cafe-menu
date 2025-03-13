import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/scaffold.dart';
import '../../../infrastructure/utils/constants.dart';
import '../controller/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        showEndDrawer: true,
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment(0, 1.5),
                  children: <Widget>[
                    _headerBackground(),
                    _itemImage(),
                  ],
                ),
                Constants.xxLargeVerticalSpacer,
                _order(),
                Constants.xxLargeVerticalSpacer,
                _nextAndPrevious(),
              ],
            ),
          ),
        ),
      );

  Widget _order() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Quantity",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(250),
                  ),
                  width: 100,
                  height: 35,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(250),
                          ),
                          child: GestureDetector(
                            onTap: controller.remove,
                            child: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Obx(
                          () => Text(
                            "${controller.quantity}",
                            style: TextStyle(
                              //color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(250),
                          ),
                          child: GestureDetector(
                            onTap: controller.add,
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Constants.mediumVerticalSpacer,
            Text("Total amount"),
            Constants.mediumVerticalSpacer,
            Obx(() => Text("\$${controller.total}")),
            Constants.xLargeVerticalSpacer,
            _orderButton()
          ],
        ),
      );

  Widget _headerBackground() => ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 0.0),
              colors: [
                Colors.lightBlue,
                Colors.lightBlueAccent[100]!,
              ],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _itemName(),
              _itemInfo(),
            ],
          ),
        ),
      );

  Widget _itemName() => Text(
        controller.item.value!.name,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );

  Widget _orderButton() => SizedBox(
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "Place Order",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          onPressed: () {},
        ),
      );

  Widget _itemImage() => Hero(
        tag: controller.item.value!.name,
        child: ClipOval(
          child: Image.asset(
            controller.item.value!.imageSource,
            fit: BoxFit.cover,
            width: 175,
            height: 175,
          ),
        ),
      );

  Widget _nextAndPrevious() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.giantSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(250),
              ),
              child: GestureDetector(
                onTap: () =>
                    controller.previousItem(controller.item.value!.id - 1),
                child: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            Text(
              "Change",
              style: TextStyle(
                  //color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(250),
              ),
              child: GestureDetector(
                onTap: () => controller.nextItem(controller.item.value!.id + 1),
                child: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _itemInfo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Constants.largeVerticalSpacer,
          Text(
            controller.item.value!.taste,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.white),
          ),
          Constants.largeVerticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Constants.smallHorizontalSpacer,
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constants.smallSpace),
                      child: Text(
                        controller.item.value!.degree,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  Constants.smallHorizontalSpacer,
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Constants.smallSpace),
                      child: Text(
                        controller.item.value!.freshness,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "\$${controller.item.value!.pricePerQuantity}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black54),
                  ),
                  Text(
                    "per Quantity",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
          Constants.largeVerticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Constants.smallHorizontalSpacer,
              for (var i = 0; i < controller.item.value!.rate; i++)
                Icon(Icons.star, size: 15, color: Colors.orangeAccent),
            ],
          ),
        ],
      );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 1.3);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 1.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
