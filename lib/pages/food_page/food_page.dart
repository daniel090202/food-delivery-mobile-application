import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery_mobile_application/themes/colors.dart';
import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';
import 'package:food_delivery_mobile_application/utilities/dimensions.dart';
import 'package:food_delivery_mobile_application/widgets/text_with_icon.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  PageController pageController = PageController(viewportFraction: 0.85);

  double _currentPageValue = 0.0;

  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // >>> Phần hiển thị main slider các sản phẩm:
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
              itemCount: 5,
              controller: pageController,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        // >>> Hiển thị các indicators cho phần slider phía trên:
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.floor(),
          decorator: DotsDecorator(
            size: Size.square(9.0),
            activeSize: Size(18.0, 9.0),
            activeColor: AppColors.primaryColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height(10.0),
        ),
        // >>> Tiêu đề của phần danh sách các sản phẩm bên dưới:
        Container(
          margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Row(
            children: [
              BigText(
                text: "Popular",
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: BigText(
                  text: ".",
                  size: 32.0,
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              SmallText(
                size: 14.0,
                text: "Food pairing",
              )
            ],
          ),
        ),
        SizedBox(
          height: 900.0,
          child: ListView.builder(
              itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 10.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/food0.png"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                Dimensions.width(20.0),
                              ),
                              bottomRight: Radius.circular(
                                Dimensions.width(20.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.width(10.0),
                              right: Dimensions.width(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: "Nutritious fruit meal in China",
                                ),
                                SizedBox(
                                  height: Dimensions.height(
                                    10.0,
                                  ),
                                ),
                                SmallText(
                                  text: "With Chinese characteristics",
                                ),
                                SizedBox(
                                  height: Dimensions.height(
                                    10.0,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWithIcon(
                                      text: "Normal",
                                      icon: Icons.circle_sharp,
                                      iconColor: AppColors.iconColor,
                                    ),
                                    TextWithIcon(
                                      text: "1.7 km",
                                      icon: Icons.location_on,
                                      iconColor: AppColors.primaryColor,
                                    ),
                                    TextWithIcon(
                                      text: "32 min",
                                      iconColor: AppColors.redColor,
                                      icon: Icons.access_time_rounded,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  // >>> Phương thức hiển thị mỗi phần tử trong phần banner với điều kiện cho các phần đang nằm trong khung hình hoặc nằm bên trái, phải của khung hình:
  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();

    // >>> Điều kiện tạo hiệu ứng zoom in & zoom out khi scroll các thẻ sang trái hoặc sang phải:
    // >>> Hiệu ứng khi phần tử mang index được hiển thị:
    if (index == _currentPageValue.floor()) {
      double currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(
          0,
          currentTransform,
          0,
        );
    }
    // >>> Hiệu ứng khi phần tử mang index + 1 được hiển thị:
    else if (index == _currentPageValue.floor() + 1) {
      double currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(
          0,
          currentTransform,
          0,
        );
    }
    // >>> Hiệu ứng khi phần tử mang index - 1 được hiển thị:
    else if (index == _currentPageValue.floor() - 1) {
      double currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(
          0,
          currentTransform,
          0,
        );
    }
    // >>> Hiệu ứng mặc định nếu như các phần tử không nằm trong khung hiển thị sẽ mang chiều cao tương ứng 0.8:
    else {
      double currentScale = 0.8;

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(
          0,
          currentTransform,
          0,
        );
    }

    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          Container(
            height: _height,
            margin: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food0.png"),
              ),
              color: index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                bottom: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                    color: AppColors.shadowColor,
                  ),
                  BoxShadow(
                    offset: Offset(-5, 0),
                    color: Colors.white,
                  ),
                  BoxShadow(
                    offset: Offset(5, 0),
                    color: Colors.white,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Bitter Orange Marinade"),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    size: Dimensions.width(24.0),
                                    color: AppColors.primaryColor,
                                  )),
                        ),
                        SizedBox(width: 12),
                        SmallText(
                          text: "4.5",
                          color: AppColors.disabledColor,
                        ),
                        SizedBox(width: 4),
                        SmallText(
                          text: "1287 comments",
                          color: AppColors.disabledColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWithIcon(
                          text: "Normal",
                          icon: Icons.circle_sharp,
                          iconColor: AppColors.iconColor,
                        ),
                        TextWithIcon(
                          text: "1.7 km",
                          icon: Icons.location_on,
                          iconColor: AppColors.primaryColor,
                        ),
                        TextWithIcon(
                          text: "32 min",
                          iconColor: AppColors.redColor,
                          icon: Icons.access_time_rounded,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
