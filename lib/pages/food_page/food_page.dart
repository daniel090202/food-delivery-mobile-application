import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_application/themes/colors.dart';
import 'package:food_delivery_mobile_application/widgets/big_text.dart';
import 'package:food_delivery_mobile_application/widgets/small_text.dart';
import 'package:food_delivery_mobile_application/widgets/text_with_icon.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  PageController pageController = PageController(viewportFraction: 0.85);

  double _currentPageValue = 0.0;

  final double _height = 260;
  final double _scaleFactor = 0.8;

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
    return SizedBox(
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          controller: pageController,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    // >>> Điều kiện tạo hiệu ứng zoom in & zoom out khi scroll các thẻ sang trái hoặc sang phải:

    Matrix4 matrix4 = Matrix4.identity();

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
    } else if (index == _currentPageValue.floor() + 1) {
      double currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(
          0,
          currentTransform,
          0,
        );
    } else if (index == _currentPageValue.floor() - 1) {
      double currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currentTransform = _height * (1 - currentScale) / 2;

      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(
          0,
          currentTransform,
          0,
        );
    } else {
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
              borderRadius: BorderRadius.circular(30.0),
              color: index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/food0.png"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                bottom: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
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
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    size: 12,
                                    Icons.star,
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
