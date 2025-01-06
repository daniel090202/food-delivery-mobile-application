import 'package:flutter/material.dart';

class RecommendedFoodDetailPage extends StatelessWidget {
  const RecommendedFoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food0.png",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
